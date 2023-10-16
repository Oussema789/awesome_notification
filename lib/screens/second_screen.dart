import 'package:awesome_local_notif_app/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SecondScreenView extends StatelessWidget {
  final String title;
  final String body;

  const SecondScreenView({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
        child: Column(
          children: [
            TopBarWidget(title: "Action Button Notification Screen"),
            SizedBox(height: 50),
            Text(
              'Title:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Body:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              body,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
