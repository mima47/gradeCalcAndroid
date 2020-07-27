import 'package:flutter/material.dart';
import 'package:gradecalc/models/user.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;
import 'package:gradecalc/screens/add_user_screen.dart';
import 'package:gradecalc/screens/default_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future<List<User>> future;
  User _selectedUser;
  String user;
  String password;
  String instCode;

  Future<List<User>> _getUsers() async {
    List list = await dbhelper.users();
    List users = <User>[];
    User currUser;
    for (var i=0; i<list.length; i++){
      currUser = User(
        nick: list[i]['nick'],
        username: list[i]['username'],
        password: list[i]['password'],
        instCode: list[i]['instCode']
      );
      users.add(currUser);
    }
    return users;
  }

  addUserScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddUserScreen())
    );

    setState(() {
      future = _getUsers();
    });
  }

  @override
  void initState() {
    future = _getUsers();
    super.initState();
  }

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
              )),
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
                      color: Colors.grey[300]),
                ),
              ),
              FutureBuilder <List<User>>(
                future: future,
                builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){
                  if (!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      DropdownButton<User>(
                        hint: Text('Choose a user'),
                        value: _selectedUser,
                        onChanged: (User value) {
                          setState(() {
                            _selectedUser = value;
                          });
                        },
                        isExpanded: false,
                        items: snapshot.data.map((User user) {
                          return DropdownMenuItem<User>(
                            value: user,
                            child: Text(
                                user.nick,
                              style: TextStyle(
                                fontFamily: Globals().font,
                                color: Colors.blueAccent
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      RaisedButton(
                        onPressed: () {
                          user = _selectedUser.username;
                          password = _selectedUser.password;
                          instCode = _selectedUser.instCode;

                          Navigator.pushReplacementNamed(context, '/loadingScreen',
                              arguments: {
                                'username': user,
                                'password': password,
                                'instCode': instCode
                              });
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontFamily: 'Quicksand'),
                        ),
                        color: Colors.green,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: RaisedButton(
                                onPressed: (){
                                  addUserScreen(context);
                                },
                                child: Text(
                                  'Add user',
                                  style: TextStyle(fontFamily: Globals().font),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: RaisedButton(
                              color: Colors.red,
                              onPressed: (){
                                dbhelper.deleteUser(_selectedUser);
                                // try-catch(?)
                              },
                              child: Text(
                                'Delete user',
                                style: TextStyle(
                                    fontFamily: Globals().font
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
