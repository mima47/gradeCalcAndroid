import 'package:flutter/material.dart';

import '../globals.dart';

class UserListScreen extends StatelessWidget {

  final List list;

  UserListScreen({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: ListView.separated(
          itemCount: list.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey),
          itemBuilder: (BuildContext, int index){
            return ListTile(
              title: Text(
                list[index].nick,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: Globals().font
                ),
              ),
              subtitle: Text(
                '${list[index].username}, ${list[index].password}, ${list[index].instCode}',
                style: TextStyle(
                  color: Colors.grey[500]
                ),
              ),
              onTap: (){
                Navigator.pop(context, list[index]);
              },
            );
          }
        ),
      ),
    );
  }
}
