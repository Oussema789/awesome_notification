import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TopBarWidget extends StatelessWidget {
  final String title;
  const TopBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
