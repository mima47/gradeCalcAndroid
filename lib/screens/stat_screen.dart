import 'package:flutter/material.dart';
import 'package:gradecalc/ui/doubleBack.dart';
import 'package:gradecalc/ui/drawer.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;
import 'package:gradecalc/ui/static_money_card.dart';

class StatScreen extends StatefulWidget {
  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  Future<int> allYearMoneyValue;

  @override
  void initState() {
    allYearMoneyValue = dbhelper.allYear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBackScaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            StaticMoneyCard(
              moneyValue: allYearMoneyValue,
              cardTitle: 'All year',
            )
          ],
        ),
      ),
    );
  }
}
