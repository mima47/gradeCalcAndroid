import 'package:flutter/material.dart';
import 'package:gradecalc/globals.dart';
import 'package:gradecalc/ui/grade_number_card.dart';

class MonthDetailsScreen extends StatelessWidget {
  Widget widget;
  FontWeight fontWeight;
  Color fontColor;
  int grade5Number = 0;
  int grade4Number = 0;
  int grade1Number = 0;

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    List listOfEvals = args['listOfEvals'];

    for(var i=0; i<listOfEvals.length; i++) {
      if (listOfEvals[i]['numberValue'] == 5){
        grade5Number++;
      } else if (listOfEvals[i]['numberValue'] == 4){
        grade4Number++;
      } else {
        grade1Number++;
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GradeNumberCard(
              name: 'Grade 5',
              numberOfGrades: grade5Number.toString(),
              backgroundColor: Colors.green[800],
              numberBackground: Colors.lightGreen,
            ),
            GradeNumberCard(
              name: 'Grade 4',
              numberOfGrades: grade4Number.toString(),
              backgroundColor: Colors.amber[700],
              numberBackground: Colors.amberAccent,
            ),
            GradeNumberCard(
              name: 'Grade 1',
              numberOfGrades: grade1Number.toString(),
              backgroundColor: Colors.red[800],
              numberBackground: Colors.redAccent,
            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  border: Border.all(color: Colors.grey[900], width: 4),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listOfEvals.length,
                    separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey),
                    itemBuilder: (BuildContext, int index){
                      return ListTile(
                        title: Text(
                          listOfEvals[index]['subject'],
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontFamily: Globals().font
                          ),
                        ),
                        subtitle: Text(
                          '${listOfEvals[index]['creatingTime']}',
                          style: TextStyle(
                              color: Colors.grey[500]
                          ),
                        ),
                        trailing: Text(
                          '${listOfEvals[index]['numberValue']}',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: Globals().font,
                            color: fontColor = (listOfEvals[index]['weight'] == '200%') ? Colors.red : Colors.white,
                            fontWeight: fontWeight = (listOfEvals[index]['weight'] == '200%') ? FontWeight.bold : FontWeight.normal
                          ),
                        ),
                      );
                    }, // itemBuilder
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}