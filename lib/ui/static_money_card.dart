import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StaticMoneyCard extends StatefulWidget {
  final String cardTitle;
  final Future<int> moneyValue;

  StaticMoneyCard({this.cardTitle, this.moneyValue});

  @override
  _StaticMoneyCardState createState() => _StaticMoneyCardState();
}

class _StaticMoneyCardState extends State<StaticMoneyCard> {
  Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text(
              widget.cardTitle,
              style: TextStyle(
                  fontFamily: Globals().font
              ),
            ),
            trailing: FutureBuilder(
              future: widget.moneyValue,
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.done){
                  int value = (snapshot.data != null) ? snapshot.data : 0;
                  return Text(
                    value.toString() + 'Ft',
                    style: TextStyle(
                      color: fontColor = (value < 0)? Colors.red : Colors.green,
                      fontFamily: Globals().font,
                      fontSize: 24
                    ),
                  );
                } else {
                  return SpinKitFadingCircle(color: Colors.white, size: 50,);
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}
