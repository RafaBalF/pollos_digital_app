import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/models/notification_payload.model.dart';
import 'package:pollos_digital/app/shared/enums/notification_payload_types.enum.dart';

class NotificationService {
  NotificationService();
  final text = Platform.isIOS;
  int _notificationIdCounter = 0;

  late FlutterLocalNotificationsPlugin localNotifications;
  Future<void> initializePlatformNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);

    localNotifications = FlutterLocalNotificationsPlugin();

    await localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  onSelectNotification(NotificationResponse notificationResponse) async {
    if (notificationResponse.payload != null &&
        notificationResponse.payload != '') {
      NotificationPayloadModel payload = NotificationPayloadModel.fromJson(
          jsonDecode(notificationResponse.payload!));

      _handlePayload(payload);
    } else {
      Modular.to.navigate('/home/');
    }
  }

  void _handlePayload(NotificationPayloadModel payload) {
    if (payload.type! == NotificationPayloadType.chat.asString) {
      Modular.to.pushNamed(
        '/home/order/chat',
        arguments: {
          'uuid': payload.uuid,
          'companyId': payload.companyId,
          'sid': payload.sid,
        },
      );
    }
  }

  Future<NotificationDetails> _notificationDetails() async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'channel id',
      'channel name',
      groupKey: 'com.example.flutter_push_notifications',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
      // largeIcon: FilePathAndroidBitmap(bigPicture),
      // styleInformation: BigPictureStyleInformation(
      //   FilePathAndroidBitmap(bigPicture),
      //   hideExpandedLargeIcon: false,
      // ),
      color: Colors.blue,
    );

    final details = await localNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {}

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    return platformChannelSpecifics;
  }

  Future<NotificationDetails> _groupedNotificationDetails() async {
    const List<String> lines = <String>[
      'group 1 First drink',
      'group 1   Second drink',
      'group 1   Third drink',
      'group 2 First drink',
      'group 2   Second drink'
    ];
    const InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
        lines,
        contentTitle: '5 messages',
        summaryText: 'missed drinks');
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'channel id',
      'channel name',
      groupKey: 'com.example.flutter_push_notifications',
      channelDescription: 'channel description',
      setAsGroupSummary: true,
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
      styleInformation: inboxStyleInformation,
      color: Color(0xff2196f3),
    );

    final details = await localNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {}

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    return platformChannelSpecifics;
  }

  Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await localNotifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> showPeriodicLocalNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await localNotifications.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.everyMinute,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> showGroupedNotifications({
    required String title,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    final groupedPlatformChannelSpecifics = await _groupedNotificationDetails();
    await localNotifications.show(
      0,
      "group 1",
      "First drink",
      platformChannelSpecifics,
    );
    await localNotifications.show(
      1,
      "group 1",
      "Second drink",
      platformChannelSpecifics,
    );
    await localNotifications.show(
      3,
      "group 1",
      "Third drink",
      platformChannelSpecifics,
    );
    await localNotifications.show(
      4,
      "group 2",
      "First drink",
      Platform.isIOS
          ? groupedPlatformChannelSpecifics
          : platformChannelSpecifics,
    );
    await localNotifications.show(
      5,
      "group 2",
      "Second drink",
      Platform.isIOS
          ? groupedPlatformChannelSpecifics
          : platformChannelSpecifics,
    );
    await localNotifications.show(
      6,
      Platform.isIOS ? "group 2" : "Attention",
      Platform.isIOS ? "Third drink" : "5 missed drinks",
      groupedPlatformChannelSpecifics,
    );
  }

  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    Modular.to.navigate('/home/');
  }

  void selectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {}
  }

  void cancelAllNotifications() => localNotifications.cancelAll();

  //CUSTOM

  Future<NotificationDetails> customNotificationDetails(
    String channelId,
    String channelName,
    String? groupKey,
    String? channelDescription,
  ) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      channelName,
      groupKey: groupKey,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
    );

    final details = await localNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {}

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    return platformChannelSpecifics;
  }

  Future<void> customShowLocalNotification({
    required String title,
    required String body,
    required String payload,
    required NotificationDetails notificationDetails,
  }) async {
    final platformChannelSpecifics = notificationDetails;
    await localNotifications.show(
      createId(),
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  int createId() {
    return _notificationIdCounter++;
  }
}
