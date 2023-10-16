import 'package:awesome_local_notif_app/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ThirdScreenView extends StatelessWidget {
  final String title;
  final String body;
  final String? imageUrl;

  const ThirdScreenView({
    required this.title,
    required this.body,
    Key? key,
    required this.imageUrl,
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
            TopBarWidget(title: "bigPicture Notification Screen"),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            imageUrl != null
                ? Image.network(
                    imageUrl!,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                : Container(), // Add a placeholder or error widget if imageUrl is null
          ],
        ),
      ),
    );
  }
}
