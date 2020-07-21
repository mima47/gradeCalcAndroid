import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestScreen extends StatelessWidget {

  Map user = {
    'username': '',
    'password': '',
    'instCode': ''
  };

  @override
  Widget build(BuildContext context) {

    user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                user['username'],
                style: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: 'Quicksand',
                  fontSize: 32
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
