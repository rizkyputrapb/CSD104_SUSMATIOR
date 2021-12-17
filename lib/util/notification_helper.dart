import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:susmatior_app/constants/string_array_notification_body_constants.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        if (kDebugMode) {
          print('notification payload: ' + payload);
        }
      }
      selectNotificationSubject.add(payload ?? 'empty payload');
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var _channelId = "1";
    var _channelName = "Daily Reminder";
    var _channelDescription = "SUSMATIOR";

    var titleNotification =
        "<b>Check information scam if you discovered suspicious</b>";
    var text = descriptionNotification;

    var randomIndex =
        generateRandomDescription(0, descriptionNotification.length - 1);
    var randomDescription = text[randomIndex];
    var descriptionName = randomDescription;
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: BigTextStyleInformation(
        descriptionName,
        contentTitle: titleNotification,
        htmlFormatTitle: true,
        htmlFormatContentTitle: true,
        htmlFormatBigText: true,
      ),
    );
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    await flutterLocalNotificationsPlugin.show(
      randomIndex,
      titleNotification,
      descriptionName,
      platformChannelSpecifics,
      payload: randomDescription,
    );
  }

  void configureSelectNotificationSubject(BuildContext context, String route) {
    selectNotificationSubject.stream.listen(
      (String payload) async {
        Navigator.pushNamed(
          context,
          route,
        );
      },
    );
  }

  int generateRandomDescription(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
