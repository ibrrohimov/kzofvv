import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/cubit/theme_context.dart';

import 'app_container.dart';

class UserManualScreen extends StatelessWidget {
  static const routeName = "user_manual";
  const UserManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("user_manual").tr(),
      ),
      body: AppContainer(
        hasTopPadding: true,
        child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
          return Column(
            children: [
              Text(
                "1. ${'user_manual_rule1'.tr()}",
                style: context.semiBold18?.copyWith(
                  color: state ? null : Colors.white,
                ),
              ),
              SizedBox(height: context.spaceM),
              Container(
                decoration: BoxDecoration(
                  color: context.success,
                  border: Border.all(),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      constraints: BoxConstraints(minHeight: 80),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: !state ? AppColors.darkPrimary2 : Colors.white,
                        constraints: BoxConstraints(minHeight: 80),
                        child: Text(
                          "user_manual_rule1_green",
                          textAlign: TextAlign.left,
                          style: context.regular15?.copyWith(
                            color: state ? null : Colors.white,
                          ),
                        ).tr(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.danger,
                  border: Border(
                    left: BorderSide(),
                    bottom: BorderSide(),
                    right: BorderSide(),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      constraints: BoxConstraints(minHeight: 80),
                      decoration: BoxDecoration(
                        color: context.danger,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: !state ? AppColors.darkPrimary2 : Colors.white,
                        constraints: BoxConstraints(minHeight: 80),
                        child: Text(
                          "user_manual_rule1_red",
                          textAlign: TextAlign.left,
                          style: context.regular15?.copyWith(
                            color: state ? null : Colors.white,
                          ),
                        ).tr(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
