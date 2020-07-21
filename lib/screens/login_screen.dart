import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String user;
  String password;
  String instCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/calc.jpg'),
                  radius: 128,
                )
              ),
              Center(
                child: SizedBox(height: 20),
              ),
              Center(
                child: Text(
                    'Grade Calculator',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    letterSpacing: 0,
                    color: Colors.grey[300]
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey[700]
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: Colors.grey[300]
                ),
                onChanged: (String str) {
                  user = str;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey[700]
                  ),
                ),
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey[300]
                ),
                onChanged: (String str){
                  password = str;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Institute Code',
                  hintStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey[700]
                  ),
                ),
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey[300]
                ),
                onChanged: (String str){
                  instCode = str;
                },
              ),
              RaisedButton(
                onPressed: () {
                  print(user);
                  print(password);
                  print(instCode);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Quicksand'
                  ),
                ),
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}