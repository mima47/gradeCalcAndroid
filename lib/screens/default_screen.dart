import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/ui/drawer.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Future<String> lastMonth;
  Future<String> currentMonth;
  Map data = {};
//  String lastMonth;
//  String currentMonth;

//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    this.data = ModalRoute.of(context).settings.arguments;
//    setState(() {
//      lastMonth = data['lastMonth'];
//      currentMonth = data['currentMonth'];
//    });
//  }

  void initState() {
    lastMonth = dbhelper.queryValue('lastMonth');
    currentMonth = dbhelper.queryValue('currentMonth');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                  FutureBuilder(
                      future: currentMonth,
                      builder: (context, snapshot){
                        if (snapshot.connectionState == ConnectionState.done){
                          return Text(
                            snapshot.data + 'Ft',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 42,
                                fontFamily: Globals().font
                            ),
                          );
                        } else {
                          return SpinKitFadingCircle(color: Colors.white, size: 50,);
                        }
                      }
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
                  FutureBuilder(
                    future: lastMonth,
                    builder: (context, snapshot){
                      if (snapshot.connectionState == ConnectionState.done){
                        return Text(
                          snapshot.data + 'Ft',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 42,
                              fontFamily: Globals().font
                          ),
                        );
                      } else {
                        return SpinKitFadingCircle(color: Colors.white, size: 50,);
                      }
                    }
                  ),
                  SizedBox(height: 8,)
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
