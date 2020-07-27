import 'package:flutter/material.dart';
import 'package:gradecalc/screens/custom_time_screen.dart';
import 'package:gradecalc/screens/default_screen.dart';
import 'package:gradecalc/screens/login_screen.dart';
import 'package:gradecalc/screens/main_screen.dart';
import 'package:gradecalc/screens/loading_screen.dart';
import 'package:gradecalc/screens/add_user_screen.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => LoginScreen(),
    '/testScreen': (context) => TestScreen(),
    '/mainScreen': (context) => MainScreen(),
    '/loadingScreen': (context) => LoadingScreen(),
    '/addUserScreen': (context) => AddUserScreen(),
    '/customTimeScreen': (context) => CustomTimeScreen(),
  },
  theme: ThemeData(
    primaryColor: Colors.lightGreen,
  ),
));