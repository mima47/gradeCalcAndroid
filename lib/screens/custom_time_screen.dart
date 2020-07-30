import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/ui/drawer.dart';
import 'package:intl/intl.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;

class CustomTimeScreen extends StatefulWidget {
  @override
  _CustomTimeScreenState createState() => _CustomTimeScreenState();
}

class _CustomTimeScreenState extends State<CustomTimeScreen> {
  List<Map<String, dynamic>> evalList;
  Color fontColor;
  Future<int> value;
  DateTime selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String fromDate;
  String toDate;

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        String formatted = formatter.format(picked);
        fromDate = formatted;
      });
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        String formatted = formatter.format(picked);
        toDate = formatted;
      });
  }

  getEvalList(dateFrom, dateTo) async {
    evalList = await dbhelper.givenMonth(dateFrom, dateTo);
  }

  @override
  void initState() {
    fromDate = formatter.format(selectedDate);
    toDate = formatter.format(selectedDate);
    getEvalList(fromDate, toDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    value = dbhelper.calculate(fromDate, toDate);
    getEvalList(fromDate, toDate);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Custom time period'),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                _selectFromDate(context);
              },
              color: Colors.grey[850],
              child: Text(
                'From: ' + fromDate.toString(),
                style: TextStyle(
                  fontFamily: Globals().font,
                  color: Colors.grey[300]
                ),
              ),
            ),
            FlatButton(
              onPressed: (){
                _selectToDate(context);
              },
              color: Colors.grey[850],
              child: Text(
                'To: ' + toDate,
                style: TextStyle(
                    fontFamily: Globals().font,
                    color: Colors.grey[300]
                ),
              ),
            ),
            SizedBox(height: 25),
            Card(
              child: InkWell(
                splashColor: Colors.grey[200],
                onTap: (){
                  Navigator.pushNamed(context, '/monthDetailsScreen', arguments: {
                    'listOfEvals': evalList
                  });
                },
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text(
                        'Money',
                        style: TextStyle(
                          fontFamily: Globals().font
                        ),
                      ),
                    ),
                    FutureBuilder(
                      future: value,
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          return Text(
                            snapshot.data.toString() + 'Ft',
                            style: TextStyle(
                              color: fontColor = (snapshot.data < 0)? Colors.red : Colors.green,
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
        ),
      ),
    );
  }
}
