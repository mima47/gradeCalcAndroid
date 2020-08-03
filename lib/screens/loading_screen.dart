import 'package:flutter/material.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;
import 'package:gradecalc/helpers/request_helper.dart' as requestHelper;
import 'package:gradecalc/models/evaulation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradecalc/models/money.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int lastMonth;
  int currentMonth;

  getStudentAmi() async {
    Map auth = ModalRoute.of(context).settings.arguments;
    String instCode = auth['instCode'];
    String token = await requestHelper.getToken(
        user: auth['username'],
        pass: auth['password'],
        instCode: auth['instCode']);

    List data = await requestHelper.getEvals(token, instCode);

    for (var i = 0; i < data.length; i++) {
      Evaluation eval = Evaluation(
          evaluationID: data[i]['EvaluationId'],
          type: data[i]['Type'],
          subject: data[i]['Subject'],
          weight: data[i]['Weight'],
          numberValue: data[i]['NumberValue'],
          creatingTime: data[i]['CreatingTime']);
      dbhelper.insertEval(eval);
    }

    int lastMonth = await dbhelper.lastMonth();
    int currentMonth = await dbhelper.currentMonth();

    this.lastMonth = lastMonth;
    this.currentMonth = currentMonth;

    Money lastMonthMoney = Money(this.lastMonth, 'lastMonth');
    Money currentMonthMoney = Money(this.currentMonth, 'currentMonth');

    dbhelper.insertMoneyVal(lastMonthMoney);
    dbhelper.insertMoneyVal(currentMonthMoney);

    Navigator.pushReplacementNamed(context, '/mainScreen');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStudentAmi(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data);
          } else {
            return Scaffold(
              body: SpinKitFadingCircle(
                color: Colors.grey,
                size: 50,
              ),
            );
          }
        });
  }
}
