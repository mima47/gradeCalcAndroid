import 'package:flutter/material.dart';
import 'package:gradecalc/helpers/database_helper.dart';
import 'package:gradecalc/db_test.dart' as dbTest;
import 'package:gradecalc/models/user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String userValue = 'Martin';
  List<String> list;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }

//  void getList() async {
//    list = await DBProvider.db.getNicknames();
//    print(list);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/calc.jpg'),
                  radius: 128,
                )
              ),
              Center(
                child: SizedBox(height: 20),
              ),
              Center(
                child: Text(
                    'Grade Calculator',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    letterSpacing: 0,
                    color: Colors.grey[300]
                  ),
                ),
              ),
              SizedBox(height: 60),
              Text(
                'Select User',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  color: Colors.grey[300]
                ),
              ),
              DropdownButton<String>(
                value: userValue,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontFamily: 'Quicksand'
                ),
                onChanged: (String newValue) {
                  setState(() {
                    userValue = newValue;
                  });
                },
                items: <String>['Martin']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 25),
              RaisedButton(
                onPressed: (){},
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightGreen[600],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () async {
                        await Navigator.pushNamed(context, '/addUser');
                      },
                      child: Text(
                          'Add User',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.white
                        ),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        dbTest.main();
//                        DBProvider.db.deleteDB();
                      },
                      child: Text(
                          'Edit User',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.grey,
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
}

Future<void> users() async {
  dynamic test = await DBProvider.db.getAllPersons();
  print(await test);
}