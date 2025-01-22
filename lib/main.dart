import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seysmoprognoz/firebase_api.dart';
import 'core/config/theme.dart';
import 'core/injections/sl.dart';
import 'core/widgets/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiOverlayStyle);
  await setUpServiceLocator();
  await EasyLocalization.ensureInitialized();

  // Firebase ######
  try {
    await Firebase.initializeApp();
    await FirebaseApi().initNotifications();
  } catch (e) {
    print(e.toString());
  }

  runApp(const BlocProviders());
}
