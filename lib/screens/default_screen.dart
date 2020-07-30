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

  Color fontColor;
  List<Map<String, dynamic>> currentListOfEvals;
  List<Map<String, dynamic>> lastListOfEvals;
  Future<String> lastMonth;
  Future<String> currentMonth;
  Map data = {};

  currentMonthList() async {
    var now = DateTime.now();
    var dateFrom = DateTime(now.year, now.month, 1);
    var dateTo = DateTime(now.year, now.month + 1, 1);
    currentListOfEvals = await dbhelper.givenMonth(dateFrom, dateTo);
  }
  lastMonthList() async {
    var now = DateTime.now();
    var dateFrom = DateTime(now.year, now.month - 1, 1);
    var dateTo = DateTime(now.year, now.month, 1);
    lastListOfEvals = await dbhelper.givenMonth(dateFrom, dateTo);
  }

  void initState() {
    lastMonth = dbhelper.queryValue('lastMonth');
    currentMonth = dbhelper.queryValue('currentMonth');
    currentMonthList();
    lastMonthList();
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
              child: InkWell(
                splashColor: Colors.grey[200],
                onTap: (){
                  Navigator.pushNamed(context, '/monthDetailsScreen', arguments: {
                    'listOfEvals': currentListOfEvals
                  });
                },
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
                                  color: fontColor = (int.parse(snapshot.data) < 0)? Colors.red : Colors.green,
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
            ),
            Card(
              child: InkWell(
                splashColor: Colors.grey[200],
                onTap: (){
                  Navigator.pushNamed(context, '/monthDetailsScreen', arguments: {
                    'listOfEvals': lastListOfEvals
                  });
                },
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
                                color: fontColor = (int.parse(snapshot.data) < 0)? Colors.red : Colors.green,
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
            ),
          ],
        )
      ),
    );
  }
}
