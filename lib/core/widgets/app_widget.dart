import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'package:seysmoprognoz/core/config/theme.dart';
import 'package:seysmoprognoz/core/cubit/language_cubit.dart';
import 'package:seysmoprognoz/core/cubit/notoification_cubit.dart';
import 'package:seysmoprognoz/core/cubit/quake_params_cubit.dart';
import 'package:seysmoprognoz/core/cubit/tab_cubit.dart';
import 'package:seysmoprognoz/core/cubit/theme_context.dart';
import 'package:seysmoprognoz/core/injections/sl.dart';
import 'package:seysmoprognoz/core/widgets/app_layout.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/bloc/quakes_bloc.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/bloc/quakes_all_bloc.dart';
import 'package:seysmoprognoz/routes/routes.dart';

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<QuakesBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<QuakesAllBloc>(),
        ),
        BlocProvider(create: (BuildContext context) => TabCubit()),
        BlocProvider(create: (BuildContext context) => ThemeCubit()),
        BlocProvider(create: (BuildContext context) => LanguageCubit()),
        BlocProvider(create: (BuildContext context) => QuakeParamsCubit()),
        BlocProvider(create: (BuildContext context) => NotificationCubit()),
      ],
      child: EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: AppGlobals.supportedLocales,
        fallbackLocale: AppGlobals.supportedLocales[0],
        path: AppAssets.translationsPath,
        startLocale: AppGlobals.supportedLocales[0],
        child: const AppWidget(),
      ),
    );
  }
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();

    // Set app theme and language
    Future.delayed(Duration.zero, () {
      context.read<ThemeCubit>().setSavedTheme();
      context.read<LanguageCubit>().setLanguage(
          EasyLocalization.of(context)!.currentLocale!.languageCode);
    });
  }

  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      // Navigator.pushNamed(
      //   context,
      //   '/chat',
      //   arguments: ChatArguments(message),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const AppLayout(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: state ? AppTheme.lightTheme : AppTheme.darkTheme,
          // darkTheme: AppTheme.darkTheme,
        );
      },
    );
  }
}
