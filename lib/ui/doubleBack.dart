import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class DoubleBackScaffold extends StatelessWidget {
  Widget body;
  Color backgroundColor;
  Widget drawer;
  AppBar appBar;

  DoubleBackScaffold({this.body, this.backgroundColor, this.appBar, this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.backgroundColor,
      appBar: this.appBar,
      drawer: this.drawer,
      body: DoubleBackToCloseApp(
        child: this.body,
        snackBar: SnackBar(
          content: Text('Press again to leave'),
        ),
      ),
    );
  }
}