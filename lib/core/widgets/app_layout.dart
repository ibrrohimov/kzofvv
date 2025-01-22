import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/cubit/language_cubit.dart';
import 'package:seysmoprognoz/core/cubit/notoification_cubit.dart';
import 'package:seysmoprognoz/core/cubit/quake_params_cubit.dart';
import 'package:seysmoprognoz/core/cubit/tab_cubit.dart';
import 'package:seysmoprognoz/core/entities/menu_entity.dart';
import 'package:seysmoprognoz/core/utils/helpers.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';
import 'package:seysmoprognoz/core/widgets/warning_screen.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_params_model.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/bloc/quakes_all_bloc.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/bloc/quakes_bloc.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/pages/_index.dart';
import 'package:seysmoprognoz/features/tasks/presentation/widgets/index.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  final _formKey = GlobalKey<FormBuilderState>();

  void setLanguage() {
    EasyLocalization.of(context)!
        .setLocale(EasyLocalization.of(context)!.currentLocale!);
  }

  @override
  void initState() {
    tz.initializeTimeZones();

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    () async {
      String? token = await FirebaseMessaging.instance.getToken();
      print("TOOOOOKEN");
      print(token);
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      );
    }();

    Future.delayed(Duration.zero, () {
      context
          .read<NotificationCubit>()
          .setPlugin(flutterLocalNotificationsPlugin);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          BlocBuilder<TabCubit, int>(builder: (context, state) {
            return Row(
              children: [
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.notifications, color: Colors.white),
                // ),
                // SizedBox(width: context.spaceS),
                if (state != 2)
                  IconButton(
                    onPressed: _showModalBottomSheet,
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                  ),
              ],
            );
          })
        ],
        title: BlocBuilder<TabCubit, int>(
          builder: (context, state) {
            return Text(
              _menuTitle(state),
              style: context.semiBold18?.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ).tr();
          },
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              width: double.infinity,
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/logo.png",
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(height: context.spaceM),
                  Text(
                    "centre_name",
                    style: context.semiBold14?.copyWith(
                      color: Colors.white,
                    ),
                  ).tr(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                // color: context.primary1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: AppGlobals.menuList
                        .map((e) => MenuItem(menu: e, setLanguage: setLanguage))
                        .toList(),
                  ),
                ),
              ),
            ),
            Text(
              "android_version",
              style: context.regular15?.copyWith(
                color: Colors.white,
              ),
            ).tr(),
            SizedBox(height: context.spaceM),
          ]),
        ),
      ),
      body: const EarthQuakesScreen(),
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet<void>(
      barrierColor: Colors.transparent,
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          floatingActionButton: AppContainer(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.danger,
                    ),
                    onPressed: () {
                      _formKey.currentState!.reset();
                      // context.read<QuakeParamsCubit>().setParams({});
                    },
                    child: Text("clear").tr(),
                  ),
                ),
                SizedBox(width: context.spaceS),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _onSubmit();
                      Navigator.pop(context);
                    },
                    child: Text("filtering").tr(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            title: Text("filtering").tr(),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: AppContainer(
              hasTopPadding: true,
              child: TaskForm(formKey: _formKey),
            ),
          ),
        );
      },
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState!.value;

      final params = buildQuakeParamsFromMap(formData: formData);

      context.read<QuakeParamsCubit>().setParams(formData);
      final currentTab = context.read<TabCubit>().state;

      if (currentTab == 0) {
        context
            .read<QuakesAllBloc>()
            .add(GetQuakesAll(params.copyWith(sezildimi: 0)));
      } else {
        context
            .read<QuakesBloc>()
            .add(GetQuakes(params.copyWith(sezildimi: 1)));
      }
    }
  }

  String _menuTitle(int value) {
    switch (value) {
      case 0:
        return "_general";
      case 1:
        return "felt_quakes";
      default:
        return "useful_info";
    }
  }

  // NOTIFICATIONS

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final dynamic payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(
    //     builder: (context) => WarningScreen(payload: payload),
    //   ),
    // );
  }
}

class MenuItem extends StatelessWidget {
  final MenuEntity menu;
  final void Function() setLanguage;

  const MenuItem({
    super.key,
    required this.menu,
    required this.setLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: menu.bottomWidget != null
            ? null
            : () {
                Navigator.pushNamed(context, menu.routeName).then((value) {});
                setLanguage();
              },
        child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      menu.icon,
                      color: Colors.white,
                    ),
                    SizedBox(width: context.spaceM),
                    Expanded(
                      child: Text(
                        menu.title,
                        style: context.regular18?.copyWith(
                          color: Colors.white,
                        ),
                      ).tr(),
                    )
                  ],
                ),
                if (menu.bottomWidget != null) menu.bottomWidget!,
              ],
            )),
      ),
    );
  }
}
