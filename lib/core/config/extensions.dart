import 'package:flutter/material.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'theme.dart';

extension UIThemeExtension on BuildContext {
  TextStyle? get extraBold14 => AppTheme.textTheme.extraBold14;
  TextStyle? get extraBold18 => AppTheme.textTheme.extraBold18;
  TextStyle? get extraBold22 => AppTheme.textTheme.extraBold22;
  TextStyle? get extraBold32 => AppTheme.textTheme.extraBold32;

  TextStyle? get semiBold48 => AppTheme.textTheme.semiBold48;
  TextStyle? get semiBold40 => AppTheme.textTheme.semiBold40;
  TextStyle? get semiBold32 => AppTheme.textTheme.semiBold32;
  TextStyle? get semiBold30 => AppTheme.textTheme.semiBold30;
  TextStyle? get semiBold22 => AppTheme.textTheme.semiBold22;
  TextStyle? get semiBold20 => AppTheme.textTheme.semiBold20;
  TextStyle? get semiBold18 => AppTheme.textTheme.semiBold18;
  TextStyle? get semiBold14 => AppTheme.textTheme.semiBold14;

  TextStyle? get regular33 => AppTheme.textTheme.regular33;
  TextStyle? get regular22 => AppTheme.textTheme.regular22;
  TextStyle? get regular14 => AppTheme.textTheme.regular14;
  TextStyle? get regular15 => AppTheme.textTheme.regular15;
  TextStyle? get regular16 => AppTheme.textTheme.regular16;
  TextStyle? get regular18 => AppTheme.textTheme.regular18;
  TextStyle? get regular20 => AppTheme.textTheme.regular20;

  TextStyle? get light18 => AppTheme.textTheme.light18;

  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  Color get primary1 => AppColors.primary1;
  Color get primary2 => AppColors.primary2;
  Color get primary3 => AppColors.primary3;

  Color get darkPrimary1 => AppColors.darkPrimary1;
  Color get darkPrimary2 => AppColors.darkPrimary2;

  Color get greyScale3 => AppColors.greyScale3;
  Color get greyScale4 => AppColors.greyScale4;
  Color get greyScale5 => AppColors.greyScale5;
  Color get greyScale7 => AppColors.greyScale7;
  Color get greyScale9 => AppColors.greyScale9;

  Color get success => AppColors.success;
  Color get danger => AppColors.danger;

  double get spaceXL => AppSizes.spaceXL;
  double get spaceL => AppSizes.spaceL;
  double get spaceM => AppSizes.spaceM;
  double get spaceS => AppSizes.spaceS;
}

extension TextThemeExtension on TextTheme {
  // EXTRA BOLD
  TextStyle? get extraBold14 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w900,
        color: AppColors.greyScale3,
      );

  TextStyle? get extraBold18 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: AppColors.greyScale3,
      );
  TextStyle? get extraBold22 => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: AppColors.greyScale3,
      );
  TextStyle? get extraBold32 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        color: AppColors.greyScale3,
      );

  // SEMIBOLD
  TextStyle? get semiBold48 => const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w600,
        color: AppColors.greyScale3,
      );
  TextStyle? get semiBold40 => const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: AppColors.greyScale3,
      );

  TextStyle? get semiBold32 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: AppColors.greyScale3,
      );

  TextStyle? get semiBold30 => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: AppColors.greyScale3,
      );

  TextStyle? get semiBold22 => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.greyScale3,
      );

  TextStyle? get semiBold20 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.greyScale3,
      );

  TextStyle? get semiBold18 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.greyScale3,
      );

  TextStyle? get semiBold14 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.greyScale3,
      );

  // REGULAR
  TextStyle? get regular33 => const TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w400,
        color: AppColors.greyScale3,
      );

  TextStyle? get regular22 => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.greyScale3,
      );

  TextStyle? get regular20 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.greyScale3,
      );

  TextStyle? get regular18 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.greyScale3,
      );

  TextStyle? get regular16 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.greyScale3,
      );

  TextStyle? get regular15 => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.greyScale3,
      );

  TextStyle? get regular14 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.greyScale3,
      );

  // LIGHT
  TextStyle? get light18 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: AppColors.greyScale3,
      );
}
