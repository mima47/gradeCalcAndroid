import 'package:flutter/material.dart';
import 'package:gradecalc/ui/doubleBack.dart';
import 'package:gradecalc/ui/drawer.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;
import 'package:gradecalc/ui/money_card.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Color fontColor;
  List<Map<String, dynamic>> currentListOfEvals;
  List<Map<String, dynamic>> lastListOfEvals;
  Future<int> lastMonth;
  Future<int> currentMonth;
  Map data = {};

  currentMonthList() async {
    var now = DateTime.now();
    var dateFrom = DateTime(now.year, now.month, 1);
    var dateTo = DateTime(now.year, now.month + 1, 1);
    this.currentListOfEvals = await dbhelper.givenMonth(dateFrom, dateTo);
    setState(() {});
  }
  lastMonthList() async {
    var now = DateTime.now();
    var dateFrom = DateTime(now.year, now.month - 1, 1);
    var dateTo = DateTime(now.year, now.month, 1);
    this.lastListOfEvals = await dbhelper.givenMonth(dateFrom, dateTo);
    setState(() {});
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
    return DoubleBackScaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            MoneyCard(
              cardTitle: 'Current Month',
              listOfEvals: currentListOfEvals,
              moneyValue: currentMonth,
            ),
            MoneyCard(
              cardTitle: 'Last Month',
              listOfEvals: lastListOfEvals,
              moneyValue: lastMonth,
            )
          ],
        )
      ),
    );
  }
}
