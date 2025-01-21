import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: AppColors.primary1,
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: AppColors.primary1,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary1,
      selectionHandleColor: AppColors.primary1,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.primary1,
    ),
    scaffoldBackgroundColor: const Color(0xFFF9F9F9),
    colorScheme: const ColorScheme.light(primary: AppColors.primary1),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary1,
      elevation: 0,
      systemOverlayStyle: systemUiOverlayStyle,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(kToDark),
      ),
    ),
    buttonTheme: ButtonThemeData(),
    elevatedButtonTheme: buttonTheme,
    outlinedButtonTheme: outlinedbuttonTheme,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      errorMaxLines: 20,
      contentPadding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16.5,
      ),
      suffixIconColor: AppColors.primary1,
      border: InputBorder.none,
    ),
    primarySwatch: kToDark,
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: AppColors.greyScale5,
      labelColor: AppColors.primary1,
    ),
  );

  static ThemeData darkTheme = lightTheme.copyWith(
    scaffoldBackgroundColor: AppColors.darkPrimary1,
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: AppColors.darkPrimary2,
      systemOverlayStyle: systemUiOverlayStyleDark,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkPrimary2,
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: AppColors.greyScale5,
      labelColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.darkPrimary2,
    ),
    dialogBackgroundColor: AppColors.darkPrimary2,
    radioTheme: RadioThemeData(
      overlayColor: MaterialStateColor.resolveWith((states) => Colors.green),
    ),
  );

  static ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(16.0),
      textStyle: textTheme.semiBold18,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      minimumSize: const Size(double.maxFinite, AppSizes.buttonHeight),
      maximumSize: const Size(double.maxFinite, AppSizes.buttonHeight),
      backgroundColor: AppColors.primary1,
      disabledBackgroundColor: AppColors.greyScale6,
    ),
  );

  static OutlinedButtonThemeData outlinedbuttonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: AppColors.primary1,
      ),
      padding: const EdgeInsets.all(0),
      foregroundColor: AppColors.primary1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      fixedSize: const Size(double.maxFinite, 80),
      disabledBackgroundColor: AppColors.primary1,
    ),
  );

  static TextTheme textTheme = const TextTheme(
    headline1: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: AppColors.greyScale3,
    ),
    headline2: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColors.greyScale3,
    ),
    headline3: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: AppColors.greyScale3,
    ),
    headline4: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: AppColors.greyScale3,
    ),
    headline5: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.greyScale3,
    ),
    headline6: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      color: AppColors.greyScale3,
    ),
    bodyText1: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      color: AppColors.greyScale3,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.greyScale3,
    ),
    subtitle1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
      color: AppColors.greyScale3,
    ),
    subtitle2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w300,
      color: AppColors.greyScale3,
    ),
    button: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ).copyWith();

  static const systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.primary1,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const systemUiOverlayStyleDark = SystemUiOverlayStyle(
    statusBarColor: AppColors.darkPrimary2,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.darkPrimary2,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const MaterialColor kToDark = MaterialColor(
    0xFFe39701, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color.fromRGBO(227, 151, 1, .1), //10%
      100: Color.fromRGBO(227, 151, 1, .2), //20%
      200: Color.fromRGBO(227, 151, 1, .3), //30%
      300: Color.fromRGBO(227, 151, 1, .4), //40%
      400: Color.fromRGBO(227, 151, 1, .5), //50%
      500: Color.fromRGBO(227, 151, 1, .6), //60%
      600: Color.fromRGBO(227, 151, 1, .7), //70%
      700: Color.fromRGBO(227, 151, 1, .8), //80%
      800: Color.fromRGBO(227, 151, 1, .9), //90%
      900: Color.fromRGBO(227, 151, 1, 1), //100%
    },
  );
}
