import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Map data = {};
  String lastMonth;
  String currentMonth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.data = ModalRoute.of(context).settings.arguments;
    setState(() {
      lastMonth = data['lastMonth'];
      currentMonth = data['currentMonth'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                dbhelper.deleteEval();
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
              title: Text(
                'Log Out'
              ),
            )
          ],
        )
      ),
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(
                      'Current Month',
                      style: TextStyle(
                        fontFamily: Globals().font
                      ),
                    ),
                  ),
                  Text(
                    currentMonth + 'Ft',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 42,
                      fontFamily: Globals().font
                    ),
                  ),
                  SizedBox(height: 8,)
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(
                      'Last Month',
                      style: TextStyle(
                          fontFamily: Globals().font
                      ),
                    ),
                  ),
                  Text(
                    lastMonth + 'Ft',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 42,
                        fontFamily: Globals().font
                    ),
                  ),
                  SizedBox(height: 8,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
