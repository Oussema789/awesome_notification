import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton(
      {required this.onPressed, required this.text, super.key});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
        bottom: 10,
      ),
      child: SizedBox(
        width: context.screenWidth,
        height: 50,
        child: ElevatedButton(onPressed: onPressed, child: Text(text)),
      ),
    );
  }
}
