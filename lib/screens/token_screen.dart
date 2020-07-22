import 'package:flutter/material.dart';
import 'package:gradecalc/helpers/request_helper.dart';

class TokenScreen extends StatefulWidget {
  @override
  _TokenScreenState createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    String accessToken = data['token'];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(accessToken)
          ],
        ),
      ),
    );
  }
}
