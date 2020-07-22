import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:gradecalc/helpers/request_helper.dart' as requestHelper;
import 'dart:convert';

class TestScreen extends StatelessWidget {

  Map user = {
    'username': '',
    'password': '',
    'instCode': ''
  };

  @override
  Widget build(BuildContext context) {

    user = ModalRoute.of(context).settings.arguments;

    String username = user['username'];
    String password = user['password'];
    String instCode = user['instCode'];

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: 'Quicksand',
                  fontSize: 16
                ),
              ),
              Text(
                password,
                style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: 'Quicksand',
                    fontSize: 16
                ),
              ),
              Text(
                instCode,
                style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: 'Quicksand',
                    fontSize: 16
                ),
              ),
              Column(
                children: [
                  Center(
                    child: RaisedButton(
                      onPressed: () async {
                        String accessToken = await requestHelper.getToken(user: username, pass: password, instCode: instCode);
                        Navigator.pushNamed(context, '/tokenScreen', arguments: {
                          'token': accessToken
                        });
                      },
                      child: Text('Get token'),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () async {
                        String token = await requestHelper.getToken(user: username, pass: password, instCode: instCode);
                        requestHelper.getStudentAmi(token: token);
                      },
                      child: Text('Get studentAmi'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}