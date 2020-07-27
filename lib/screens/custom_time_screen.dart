import 'package:flutter/material.dart';
import 'package:gradecalc/ui/drawer.dart';

class CustomTimeScreen extends StatefulWidget {
  @override
  _CustomTimeScreenState createState() => _CustomTimeScreenState();
}

class _CustomTimeScreenState extends State<CustomTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom time period'),
      ),
      drawer: MainDrawer(),
    );
  }
}
