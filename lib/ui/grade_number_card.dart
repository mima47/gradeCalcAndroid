import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';

class GradeNumberCard extends StatelessWidget {
  final String name;
  final String numberOfGrades;
  final Color backgroundColor;
  final Color numberBackground;

  GradeNumberCard({@required this.name,@required this.numberOfGrades, this.backgroundColor, this.numberBackground});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 3,
      child: ListTile(
          title: Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: Globals().font
            ),
          ),
          trailing: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: numberBackground,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    numberOfGrades,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: Globals().font,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              )
          )
      ),
    );
  }
}
