import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/ui/drawer.dart';
import 'package:gradecalc/ui/money_card.dart';
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
        getEvalList(fromDate, toDate);
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
        getEvalList(fromDate, toDate);
      });
  }

  getEvalList(dateFrom, dateTo) async {
    List evallist = await dbhelper.givenMonth(dateFrom, dateTo);
    setState(() {
      this.evalList = evallist;
    });
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom time period'),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)
              ),
              child: FlatButton(
                onPressed: (){
                  _selectFromDate(context);
                },
                child: Text(
                  'From: ' + fromDate.toString(),
                  style: TextStyle(
                    fontFamily: Globals().font,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: FlatButton(
                onPressed: (){
                  _selectToDate(context);
                },
                child: Text(
                  'To: ' + toDate,
                  style: TextStyle(
                      fontFamily: Globals().font,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            MoneyCard(
              cardTitle: 'Money',
              listOfEvals: this.evalList,
              moneyValue: value,
            )
          ],
        ),
      ),
    );
  }
}
