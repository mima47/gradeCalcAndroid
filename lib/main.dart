import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/screens/grade_averages_screen.dart';

import 'package:gradecalc/screens/month_details_screen.dart';
import 'package:gradecalc/screens/custom_time_screen.dart';
import 'package:gradecalc/screens/add_user_screen.dart';
import 'package:gradecalc/screens/default_screen.dart';
import 'package:gradecalc/screens/loading_screen.dart';
import 'package:gradecalc/screens/login_screen.dart';
import 'package:gradecalc/screens/stat_screen.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => LoginScreen(),
    '/statScreen': (context) => StatScreen(),
    '/mainScreen': (context) => MainScreen(),
    '/loadingScreen': (context) => LoadingScreen(),
    '/addUserScreen': (context) => AddUserScreen(),
    '/customTimeScreen': (context) => CustomTimeScreen(),
    '/monthDetailsScreen': (context) => MonthDetailsScreen(),
    '/gradeAveragesScreen': (context) => GradeAveragesScreen(),
  },
  theme: ThemeData(
    primaryColor: Colors.lightGreen,
    accentColor: Colors.lightGreenAccent,
    brightness: Brightness.dark,

    fontFamily: Globals().font
  ),
));