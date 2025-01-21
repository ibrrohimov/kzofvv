import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/cubit/theme_context.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';
import 'package:seysmoprognoz/features/about/presentation/widgets/about_center_ru.dart';
import 'package:seysmoprognoz/features/about/presentation/widgets/about_center_uz.dart';

const text =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static const String routeName = 'about';

  @override
  Widget build(BuildContext context) {
    final language =
        EasyLocalization.of(context)?.currentLocale?.countryCode?.toLowerCase();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("about_centre").tr(),
      ),
      body: SingleChildScrollView(
        child: AppContainer(
          hasTopPadding: true,
          child: language == 'uz' ? AboutCenterUz() : AboutCenterRu(),
        ),
      ),
    );
  }
}
