import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/cubit/theme_context.dart';
import 'package:seysmoprognoz/core/entities/useful_info_entity.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';

class StatisticsCard extends StatelessWidget {
  final UsefulInfoEntity usefulInfo;

  const StatisticsCard({super.key, required this.usefulInfo});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () {
        Navigator.pushNamed(
          context,
          "single_info",
          arguments: {
            'usefulInfo': usefulInfo,
          },
        );
      },
      child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              usefulInfo.title,
              style: context.extraBold18
                  ?.copyWith(color: state ? Colors.black : Colors.white),
            ).tr(),
            SizedBox(height: context.spaceM),
            Image.asset(
              usefulInfo.image,
              width: 150,
            ),
            SizedBox(height: context.spaceM),
            Text(
              usefulInfo.text,
              style: context.regular14?.copyWith(
                color: state ? context.greyScale5 : context.greyScale7,
              ),
              textAlign: TextAlign.center,
            ).tr(),
          ],
        );
      }),
    );
  }
}
