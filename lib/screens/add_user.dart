import 'package:flutter/material.dart';
import 'package:gradecalc/models/user.dart';
import 'package:gradecalc/helpers/database_helper.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController idField = TextEditingController();
  TextEditingController nickField = TextEditingController();
  TextEditingController usernameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  TextEditingController instCodeField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'ID:',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 24,
                    color: Colors.grey[300]
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: idField,
                decoration: InputDecoration(
                    hintText: '\'1\'',
                    hintStyle: TextStyle(
                        color: Colors.grey[700]
                    )
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Nickname:',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  color: Colors.grey[300]
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: nickField,
                decoration: InputDecoration(
                  hintText: '\'Martin\'',
                  hintStyle: TextStyle(
                    color: Colors.grey[700]
                  )
                ),
              ),
              SizedBox(height: 45),
              Text(
                'Username:',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 24,
                    color: Colors.grey[300]
                ),
              ),
              TextField(
                controller: usernameField,
                decoration: InputDecoration(
                    hintText: '\'student-id\'',
                    hintStyle: TextStyle(
                        color: Colors.grey[700]
                    )
                ),
              ),
              SizedBox(height: 45),
              Text(
                'Password:',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 24,
                    color: Colors.grey[300]
                ),
              ),
              TextField(
                controller: passwordField,
                decoration: InputDecoration(
                    hintText: '\'yyyy-mm-dd\'',
                    hintStyle: TextStyle(
                        color: Colors.grey[700]
                    )
                ),
              ),
              SizedBox(height: 45),
              Text(
                'Institue Code:',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 24,
                    color: Colors.grey[300]
                ),
              ),
              TextField(
                controller: instCodeField,
                decoration: InputDecoration(
                    hintText: '\'paszc-faller\'',
                    hintStyle: TextStyle(
                        color: Colors.grey[700]
                    )
                ),
              ),
              SizedBox(height: 82),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      _sendBackData(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendBackData(BuildContext context){
    int id = int.parse(idField.text);
    String nickname = nickField.text;
    String username = usernameField.text;
    String password = passwordField.text;
    String instCode = instCodeField.text;

    User user = new User(id: id, nick: nickname, username: username, password: password, instCode: instCode);
    DBProvider.db.newUser(user);
  }
}