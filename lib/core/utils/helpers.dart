import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'package:seysmoprognoz/core/network/dio_client.dart';
import 'package:seysmoprognoz/core/network/endpoints.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_params_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.chevron_left,
        size: 35,
      ),
    ),
  );
}

QuakeParamsModel buildQuakeParamsFromMap({required Map formData}) {
  RangeValues? magnitude = formData['magnitude'];

  return QuakeParamsModel(
    regName: formData['regName'] ?? '',
    magnitude: '${magnitude?.start ?? 1}+${magnitude?.end ?? 10}',
    vaqt: (formData['from_day'] == null && formData['to_day'] == null)
        ? null
        : '${formData['from_day'] == null ? '' : convertDateTimeDisplay(formData['from_day'].toString())}+${formData['from_day'] == null ? '' : convertDateTimeDisplay(formData['to_day'].toString())}',
    depth: (formData['from_depth'] == null && formData['to_depth'] == null)
        ? null
        : '${formData['from_depth'] ?? ''}+${formData['to_depth'] ?? ''}',
    latitude: (formData['from_latitude'] == null &&
            formData['to_latitude'] == null)
        ? null
        : '${formData['from_latitude'] ?? ''}+${formData['to_latitude'] ?? ''}',
    longtitude: (formData['from_longtitude'] == null &&
            formData['to_longtitude'] == null)
        ? null
        : '${formData['from_longtitude'] ?? ''}+${formData['to_longtitude'] ?? ''}',
  );
}

Future<Map<String, dynamic>?> getNews() async {
  final prefs = await SharedPreferences.getInstance();
  final res = await DioClient(Dio()).post(Endpoints.yangilikmap1);
  final List networkNewsList = res.data;
  final cachedNews = prefs.getString("news");
  await prefs.setString('news', jsonEncode(networkNewsList));

  if (cachedNews != null) {
    final cachedNewsList = jsonDecode(cachedNews) as List;
    print(
        "CACHE: ${cachedNewsList.length} \n NETWORK: ${networkNewsList.length}");

    if (cachedNewsList.length < networkNewsList.length) {
      return networkNewsList[networkNewsList.length - 1];
    }
  }
}

// this will be used as notification channel id
const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 888;

void showNotification(
  Map quake,
) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    notificationChannelId,
    'Bildirishnomalar',
    importance: Importance.max,
    priority: Priority.high,
    color: Color(0xFF1D1D1D),
    styleInformation: BigTextStyleInformation(
        'Sana: ${quake['vaqt']} \nVaqt: ${quake['localTime']} \nMagnituda: ${quake['magnitude']}'),
  );
  NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
    0,
    quake['nomi'],
    null,
    // "Sana: ${quake['vaqt']} \nVaqt: ${quake['localTime']} \nMagnituda: ${quake['magnitude']}",
    notificationDetails,
    payload: 'item x',
  );
}

void showWarningNotification(
    // Map quake,
    ) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails(
    notificationChannelId,
    'Bildirishnomalar',
    importance: Importance.max,
    priority: Priority.high,
    color: Color(0xFF1D1D1D),
    // styleInformation: BigTextStyleInformation(
    //   'Sana: ${quake['vaqt']} \nVaqt: ${quake['localTime']} \nMagnituda: ${quake['magnitude']}',
    // ),
  );
  NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
    0,
    "Zilziladan erta ogohlantirish",
    "Zilzilaga tayyorlaning",
    notificationDetails,
    payload: 'item x',
  );
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}
