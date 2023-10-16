import 'package:awesome_local_notif_app/main.dart';
import 'package:awesome_local_notif_app/screens/ThirdScreen.dart';
import 'package:awesome_local_notif_app/screens/second_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: "high_importance_channel",
            channelKey: "high_importance_channel",
            channelName: "Basic notification",
            channelDescription: "Notification channel for basic tests",
            defaultColor: const Color(0xFF9050DD),
            ledColor: Colors.white,
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            onlyAlertOnce: true,
            playSound: true,
            criticalAlerts: true),
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: "high_importance_channel",
            channelGroupName: "Group 1"),
      ],
      debug: true,
    );
    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint("onNotificationCreatedMethod");
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint("onNotificationDisplayedMethod");
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint("onDismissActionReceivedMethod");
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint("onActionReceivedMethod");
    final payload = receivedAction.payload ?? {};
    if (payload["navigate"] == "true") {
      MyApp.navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => SecondScreenView(
            title: receivedAction.title ?? '',
            body: receivedAction.body ?? '',
          ),
        ),
      );
    } else if (payload["navigateToThird"] == "true") {
      MyApp.navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => ThirdScreenView(
            title: receivedAction.title ?? '',
            body: receivedAction.body ?? '',
            imageUrl: receivedAction.bigPicture,
          ),
        ),
      );
    }
  }

  static Future<void> showNotification(
      {required final String title,
      required final String body,
      final String? summary,
      final Map<String, String>? payload,
      final ActionType actionType = ActionType.Default,
      final NotificationLayout notificationLayout = NotificationLayout.Default,
      final NotificationCategory? notificationCategory,
      final String? bigPicture,
      final List<NotificationActionButton>? actionButtons,
      final bool scheduled = false,
      final int? interval}) async {
    assert(!scheduled || (scheduled && interval != null));
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: notificationCategory,
        payload: payload,
        bigPicture: bigPicture,
      ),
      actionButtons: actionButtons,
      schedule: scheduled
          ? NotificationInterval(
              interval: interval,
              timeZone:
                  await AwesomeNotifications().getLocalTimeZoneIdentifier(),
              preciseAlarm: true,
            )
          : null,
    );
  }
}
