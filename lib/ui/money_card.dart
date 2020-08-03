import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MoneyCard extends StatefulWidget {
  final String cardTitle;
  final List<Map<String, dynamic>> listOfEvals;
  final Future<int> moneyValue;

  MoneyCard({this.cardTitle, this.listOfEvals, this.moneyValue});

  @override
  _MoneyCardState createState() => _MoneyCardState();
}

class _MoneyCardState extends State<MoneyCard> {
  Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.grey[200],
        onTap: (){
          Navigator.pushNamed(context, '/monthDetailsScreen', arguments: {
            'listOfEvals': widget.listOfEvals
          });
        },
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
            ),
            FutureBuilder(
                future: widget.moneyValue,
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.done){
                    int value = (snapshot.data != null) ? snapshot.data : 0;
                    return Text(
                      value.toString() + 'Ft',
                      style: TextStyle(
                          color: fontColor = (value < 0)? Colors.red : Colors.green,
                          fontSize: 42,
                          fontFamily: Globals().font
                      ),
                    );
                  } else {
                    return SpinKitFadingCircle(color: Colors.white, size: 50,);
                  }
                }
            ),
            SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }
}
