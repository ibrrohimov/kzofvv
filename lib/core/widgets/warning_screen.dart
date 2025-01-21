import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/widgets/app_map.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_model.dart';

class WarningScreen extends StatelessWidget {
  const WarningScreen({super.key});
  static const routeName = "early_warning";

  @override
  Widget build(BuildContext context) {
    final language =
        EasyLocalization.of(context)?.currentLocale?.countryCode?.toLowerCase();
    print(language);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("early_warning").tr(),
      ),
      body: SingleChildScrollView(
        child: AppContainer(
          hasTopPadding: true,
          hasBottomPadding: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: context.spaceM),
                    child: RichText(
                      text: TextSpan(
                        text: '${'date'.tr()}: ',
                        style: context.extraBold18,
                        children: [
                          TextSpan(
                              text: '2023-${'year'.tr()} 15-${'august'.tr()}',
                              style: context.regular18),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: context.spaceM),
                    child: RichText(
                      text: TextSpan(
                        text: '${'time_tshv'.tr()}: ',
                        style: context.extraBold18,
                        children: [
                          TextSpan(text: '15:00', style: context.regular18),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: context.spaceM),
                  RichText(
                    text: TextSpan(
                      text: '${'magnitude'.tr()}: ',
                      style: context.extraBold18,
                      children: [
                        TextSpan(text: '6.0', style: context.regular18),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: context.spaceM),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: MapSample(
                    quake: QuakeModel(
                  latitude: 37.63,
                  longitude: 72.25,
                )),
              ),
              SizedBox(height: context.spaceM),
              Container(
                height: MediaQuery.of(context).size.height * 0.38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.amber,
                        child: Center(
                          child: Text(
                            "4 \n${'ball'.tr()}",
                            style: context.semiBold30?.copyWith(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: context.spaceM),
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "assets/images/${language == 'uz' ? 'warning_uz' : 'warning_ru'}.png")),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
