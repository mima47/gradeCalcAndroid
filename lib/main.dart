import 'package:flutter/material.dart';
import 'package:gradecalc/screens/add_user.dart';
import 'package:gradecalc/screens/login_screen.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => LoginScreen(),
    '/addUser': (context) => AddUser()
  },
));