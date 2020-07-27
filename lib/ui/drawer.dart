import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'GradeCalc',
                style: TextStyle(
                    fontFamily: Globals().font,
                    color: Colors.white,
                    fontSize: 32
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.lightGreen
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.date_range),
              title: Text(
                'Custom time period',
                style: TextStyle(
                    fontFamily: Globals().font
                ),
              ),
            ),
            Divider(color: Colors.grey[500]),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                dbhelper.deleteEval();
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
              title: Text(
                'Log Out',
                style: TextStyle(
                    fontFamily: Globals().font,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        )
    );
  }
}
