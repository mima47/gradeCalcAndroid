import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  Widget child;
  GradientBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.teal]
        )
      ),
      child: this.child,
    );
  }
}
