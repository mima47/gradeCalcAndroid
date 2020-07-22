import 'package:flutter/material.dart';
import 'package:gradecalc/screens/login_screen.dart';
import 'package:gradecalc/screens/main_screen.dart';
import 'package:gradecalc/screens/token_screen.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => LoginScreen(),
    '/mainScreen': (context) => TestScreen(),
    '/tokenScreen': (context) => TokenScreen(),
  },
));