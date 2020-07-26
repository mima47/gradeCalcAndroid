import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradecalc/helpers/request_helper.dart' as requestHelper;
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;
import 'package:gradecalc/models/evaulation.dart';


class TestScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Map user = ModalRoute.of(context).settings.arguments;
    String username = user['username'];
    String password = user['password'];
    String instCode = user['instCode'];

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Username: '+username,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: 'Quicksand',
                  fontSize: 16
                ),
              ),
              Text(
                'Password: '+password,
                style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: 'Quicksand',
                    fontSize: 16
                ),
              ),
              Text(
                'InstCode: '+instCode,
                style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: 'Quicksand',
                    fontSize: 16
                ),
              ),
              Column(
                children: [
                  Center(
                    child: RaisedButton(
                      onPressed: () async {
                        String accessToken = await requestHelper.getToken(user: username, pass: password, instCode: instCode);
                        Navigator.pushNamed(context, '/tokenScreen', arguments: {
                          'token': accessToken
                        });
                      },
                      child: Text('Get token'),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () async {
                        getStudentAmi(username, password, instCode);
                      },
                      child: Text('Get studentAmi'),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () async{
                        print(await query());
                      },
                      child: Text('query'),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () async{
                        await dbhelper.deleteEval();
                      },
                      child: Text('delete all evals'),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () async{
//                        List asd = await dbhelper.givenMonth('2019-09-01', '2020-01-01');
//                        List asd = await dbhelper.calculate('2019-09-01', '2020-01-01');
//                        for (var i=0; i<asd.length; i++){
//                          print(asd[i]);
//                        }
//                        print(asd.length);
                      },
                      child: Text('TestDB'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// print all items in database

  query() async{
    List<Map<String, dynamic>> evals = await dbhelper.evals();
    for (var i=0; i<evals.length; i++){
      print(evals[i]);
    }
  }

  // Add all evaluations from studentAmi to database

  getStudentAmi(user, pass, instCode) async {
    String token = await requestHelper.getToken(user: user, pass: pass, instCode: instCode);

    List data = await requestHelper.getEvals(token);

    for (var i=0; i<data.length; i++){
      Evaluation eval = Evaluation(
          evaluationID: data[i]['EvaluationId'],
          type: data[i]['Type'],
          subject: data[i]['Subject'],
          weight: data[i]['Weight'],
          numberValue: data[i]['NumberValue'],
          creatingTime: data[i]['CreatingTime']
      );
      dbhelper.insertEval(eval);
    }
  }
}
