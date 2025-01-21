import 'package:seysmoprognoz/core/entities/barrel.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:seysmoprognoz/core/widgets/index.dart';
import 'package:seysmoprognoz/core/widgets/single_useful_info.dart';
import 'package:seysmoprognoz/core/widgets/user_manual_screen.dart';
import 'package:seysmoprognoz/core/widgets/warning_screen.dart';
import 'package:seysmoprognoz/features/about/presentation/pages/about_screen.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_model.dart';
import 'package:seysmoprognoz/features/statistics/presentation/pages/statistics_screen.dart';
import 'package:seysmoprognoz/features/tasks/presentation/pages/index.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/pages/_index.dart';
import 'package:seysmoprognoz/features/useful_info/presentation/pages/useful_info_screen.dart';

class RouteGenerator {
  static List<RouteEntity> _getRoutes(arguments) {
    return [
      if (arguments?['usefulInfo'] != null)
        RouteEntity(
          routeName: SingleUsefulInfo.routeName,
          screen: SingleUsefulInfo(usefulInfo: arguments?['usefulInfo']),
        ),
      const RouteEntity(
        routeName: UserManualScreen.routeName,
        screen: UserManualScreen(),
      ),
      const RouteEntity(
        routeName: SettingsScreen.routeName,
        screen: SettingsScreen(),
      ),
      const RouteEntity(
        routeName: UsefulInfoScreen.routeName,
        screen: UsefulInfoScreen(),
      ),
      const RouteEntity(
        routeName: AboutScreen.routeName,
        screen: AboutScreen(),
      ),
      const RouteEntity(
        routeName: StatisticsScreen.routeName,
        screen: StatisticsScreen(),
      ),
      if (arguments?['quake'] != null)
        RouteEntity(
          routeName: SingleQuakeScreen.routeName,
          screen: SingleQuakeScreen(
            quake: arguments?['quake'] ?? QuakeModel(),
          ),
        ),
      const RouteEntity(
        routeName: TasksScreen.routeName,
        screen: TasksScreen(),
      ),
      const RouteEntity(
        routeName: TaskPreviewScreen.routeName,
        screen: TaskPreviewScreen(),
      ),
      const RouteEntity(
        routeName: WarningScreen.routeName,
        screen: WarningScreen(),
      ),
    ];
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var currentPage = PageTransition(
      child: NotFound(),
      type: PageTransitionType.fade,
      settings: settings,
    );

    for (var route in _getRoutes(settings.arguments)) {
      if (settings.name == route.routeName) {
        currentPage = PageTransition(
          child: route.screen,
          type: PageTransitionType.fade,
          settings: settings,
        );
        break;
      }
    }

    return currentPage;
  }
}
