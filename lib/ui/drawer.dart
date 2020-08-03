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
              onTap: (){
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/mainScreen');
              },
              leading: Icon(Icons.dashboard),
              title: Text(
                'Dashboard',
                style: TextStyle(
                    fontFamily: Globals().font
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/customTimeScreen');
              },
              leading: Icon(Icons.date_range),
              title: Text(
                'Custom time period',
                style: TextStyle(
                    fontFamily: Globals().font
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text(
                'Statistics',
                style: TextStyle(
                  fontFamily: Globals().font,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/statScreen');
              },
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
            ),
          ],
        )
    );
  }
}
