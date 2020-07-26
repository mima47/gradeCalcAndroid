import 'package:flutter/material.dart';
import 'package:gradecalc/screens/default_screen.dart';
import 'package:gradecalc/screens/login_screen.dart';
import 'package:gradecalc/screens/main_screen.dart';
import 'package:gradecalc/screens/token_screen.dart';
import 'package:gradecalc/screens/loading_screen.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => LoginScreen(),
    '/testScreen': (context) => TestScreen(),
    '/mainScreen': (context) => MainScreen(),
    '/tokenScreen': (context) => TokenScreen(),
    '/loadingScreen': (context) => LoadingScreen(),
  },
));