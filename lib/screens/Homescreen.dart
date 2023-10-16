import 'package:awesome_local_notif_app/services/notification_services.dart';
import 'package:awesome_local_notif_app/widgets/Notification_button.dart';
import 'package:awesome_local_notif_app/widgets/top_bar.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
        child: Column(children: [
          TopBarWidget(title: "Awesome Notification"),
          NotificationButton(
            text: "Normal Notification",
            onPressed: () async {
              await NotificationService.showNotification(
                  title: "Title of Normal Notification",
                  body: "Body of Normal Notification");
            },
          ),
          NotificationButton(
            text: "Notification with summary",
            onPressed: () async {
              await NotificationService.showNotification(
                title: "Title of Notification with summary",
                body: "Body of Notification with summary",
                summary: "Small summary",
                notificationLayout: NotificationLayout.Inbox,
              );
            },
          ),
          NotificationButton(
            text: "Progress Notification",
            onPressed: () async {
              await NotificationService.showNotification(
                title: "Title of Progress Notification",
                body: "Body of Progress Notification",
                summary: "Small summary",
                notificationLayout: NotificationLayout.ProgressBar,
              );
            },
          ),
          NotificationButton(
            text: "Message Notification",
            onPressed: () async {
              await NotificationService.showNotification(
                title: "Title of Message Notification",
                body: "Body of Message Notification",
                summary: "Small summary",
                notificationLayout: NotificationLayout.Messaging,
              );
            },
          ),
          NotificationButton(
            text: "Big Image Notification",
            onPressed: () async {
              await NotificationService.showNotification(
                  title: "Title of Big Image Notification",
                  body: "Body of Big Image Notification",
                  summary: "Small summary",
                  notificationLayout: NotificationLayout.BigPicture,
                  bigPicture:
                      "https://www.pushengage.com/wp-content/uploads/2022/10/How-to-Add-a-Push-Notification-Icon.png",
                  notificationCategory: NotificationCategory.Service,
                  payload: {
                    "navigateToThird": "true",
                  },
                  actionButtons: [
                    NotificationActionButton(
                        key: 'SHOW_SERVICE_DETAILS', label: 'Show details')
                  ]);
            },
          ),
          NotificationButton(
            text: "Action Button Notification",
            onPressed: () async {
              await NotificationService.showNotification(
                  title: "Title of Action Button Notification",
                  body: "Body of Action Button Notification",
                  payload: {
                    "navigate": "true",
                  },
                  actionButtons: [
                    NotificationActionButton(
                        key: "check",
                        label: "chech it out",
                        actionType: ActionType.SilentAction)
                  ]);
            },
          ),
          NotificationButton(
            text: "Schedule Notification",
            onPressed: () async {
              await NotificationService.showNotification(
                title: "Title of Schedule Notification",
                body: "Body of Schedule Notification after 5 seconds",
                scheduled: true,
                interval: 5,
              );
            },
          ),
        ]),
      ),
    );
  }
}
