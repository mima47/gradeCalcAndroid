import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/models/user.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;

class AddUserScreen extends StatelessWidget {
  final FocusNode nickFocus = FocusNode();
  final FocusNode userFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  final FocusNode instFocus = FocusNode();

  User user = User(nick: '',username: '',password: '',instCode: '');

  _storeUser(User user) async {
    dbhelper.insertUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Add user'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFormField(
              onChanged: (value){
                this.user.nick = value;
              },
              onFieldSubmitted: (term){
                FocusScope.of(context).requestFocus(userFocus);
              },
              focusNode: nickFocus,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.grey[300]
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightGreen
                  )
                ),
                icon: Icon(Icons.face),
                labelText: 'Nickname',
                labelStyle: TextStyle(
                  color: Colors.grey[300]
                ),
              ),
              style: TextStyle(
                color: Colors.grey[300],
                fontFamily: Globals().font
              ),
            ),
//            SizedBox(height: 30),
            TextFormField(
              onChanged: (value){
                this.user.username = value;
              },
              onFieldSubmitted: (term){
                FocusScope.of(context).requestFocus(passFocus);
              },
              focusNode: userFocus,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.grey[300]
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.lightGreen
                    )
                ),
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
                labelStyle: TextStyle(
                    color: Colors.grey[300]
                ),
              ),
              style: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: Globals().font
              ),
            ),
//            SizedBox(height: 30),
            TextFormField(
              onFieldSubmitted: (term){
                FocusScope.of(context).requestFocus(instFocus);
              },
              onChanged: (value){
                this.user.password = value;
              },
              focusNode: passFocus,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.grey[300]
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.lightGreen
                    )
                ),
                icon: Icon(Icons.lock_outline),
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: Colors.grey[300]
                ),
              ),
              style: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: Globals().font
              ),
            ),
//            SizedBox(height: 30),
            TextFormField(
              onChanged: (value){
                this.user.instCode = value;
              },
              focusNode: instFocus,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.grey[300]
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.lightGreen
                    )
                ),
                icon: Icon(Icons.account_balance),
                labelText: 'Institute Code',
                labelStyle: TextStyle(
                    color: Colors.grey[300]
                ),
              ),
              style: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: Globals().font
              ),
            ),
//            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  color: Colors.grey[850],
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: Globals().font,
                      color: Colors.blueAccent
                    ),
                  ),
                ),
                SizedBox(width: 10),
                RaisedButton(
                  onPressed: (){
                    _storeUser(user);
                    Navigator.pop(context);
                  },
                  color: Colors.grey[300],
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontFamily: Globals().font,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
