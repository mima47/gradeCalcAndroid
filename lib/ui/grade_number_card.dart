import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';

class GradeNumberCard extends StatelessWidget {
  final String name;
  final String numberOfGrades;
  final Color backgroundColor;
  final Color numberBackground;
  BoxShape shape = BoxShape.circle;

  GradeNumberCard({@required this.name,@required this.numberOfGrades, this.backgroundColor, this.numberBackground, this.shape});

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
                fontFamily: Globals().font
            ),
          ),
          trailing: Container(
              width: 100,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: numberBackground,
//                border: Border.all(width: 2),
//                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      numberOfGrades,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: Globals().font,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}
