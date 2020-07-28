import 'package:flutter/material.dart';
import 'package:gradecalc/models/user.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;
import 'package:gradecalc/screens/add_user_screen.dart';
import 'package:gradecalc/screens/user_list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future<List<User>> future;
  User selectedUser = User(nick: '', username: '', password: '', instCode: '');
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
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddUserScreen())
    );

    setState(() {
      future = _getUsers();
    });
  }

  selectUserScreen(BuildContext context) async {
    List list = await _getUsers();
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserListScreen(list: list))
    );
    setState(() {
      selectedUser = result;
    });
  }

  @override
  void initState() {
    future = _getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedUser == null){
      selectedUser = User(nick: 'No user selected', username: '', password: '', instCode: '');
    }
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
              FlatButton(
                color: Colors.grey[850],
                onPressed: (){
                  selectUserScreen(context);
                },
                child: Text(
                  'Selected user: ${selectedUser.nick}',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: Globals().font,
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: (){
                  dbhelper.deleteMoney();
                  dbhelper.deleteEval();
                  Navigator.pushReplacementNamed(context, '/loadingScreen', arguments: {
                    'username': selectedUser.username,
                    'password': selectedUser.password,
                    'instCode': selectedUser.instCode
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: Globals().font
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      onPressed: (){
                        addUserScreen(context);
                      },
                      child: Text(
                        'Add User',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontFamily: Globals().font,
                        ),
                      ),
                      color: Colors.blue[600],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: RaisedButton(
                        onPressed: (){
                          dbhelper.deleteUser(selectedUser);
                          setState(() {
                            selectedUser = User(nick: '', username: '', password: '', instCode: '');
                          });
                        },
                        child: Text(
                          'Delete User',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontFamily: Globals().font,
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
