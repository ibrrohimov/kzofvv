import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/cubit/theme_context.dart';
import 'package:seysmoprognoz/core/entities/useful_info_entity.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';

class SingleUsefulInfo extends StatelessWidget {
  static const routeName = "single_info";
  final UsefulInfoEntity usefulInfo;

  const SingleUsefulInfo({super.key, required this.usefulInfo});

  @override
  Widget build(BuildContext context) {
    final language =
        EasyLocalization.of(context)?.currentLocale?.countryCode?.toLowerCase();
    return Scaffold(
      appBar: AppBar(
        title: Text(usefulInfo.title).tr(),
      ),
      body: SingleChildScrollView(
        child: AppContainer(
          hasTopPadding: true,
          child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
            return Column(
              children: usefulInfo.usefulContent
                  .asMap()
                  .map((key, value) => MapEntry(
                        key,
                        Container(
                          margin: EdgeInsets.only(bottom: context.spaceM),
                          child: RichText(
                            text: TextSpan(
                              text: '${key + 1}. ',
                              style: context.extraBold18?.copyWith(
                                  color: !state ? Colors.white : null),
                              children: <TextSpan>[
                                TextSpan(
                                  text: language == 'uz'
                                      ? value.text
                                      : value.textRu,
                                  style: context.regular18?.copyWith(
                                      color: !state ? Colors.white : null),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .values
                  .toList(),
            );
          }),
        ),
      ),
    );
  }
}
