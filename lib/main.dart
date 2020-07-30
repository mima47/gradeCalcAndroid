import 'package:flutter/material.dart';

import 'package:gradecalc/screens/month_details_screen.dart';
import 'package:gradecalc/screens/custom_time_screen.dart';
import 'package:gradecalc/screens/add_user_screen.dart';
import 'package:gradecalc/screens/default_screen.dart';
import 'package:gradecalc/screens/loading_screen.dart';
import 'package:gradecalc/screens/login_screen.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => LoginScreen(),
    '/mainScreen': (context) => MainScreen(),
    '/loadingScreen': (context) => LoadingScreen(),
    '/addUserScreen': (context) => AddUserScreen(),
    '/customTimeScreen': (context) => CustomTimeScreen(),
    '/monthDetailsScreen': (context) => MonthDetailsScreen(),
  },
  theme: ThemeData(
    primaryColor: Colors.lightGreen,
  ),
));