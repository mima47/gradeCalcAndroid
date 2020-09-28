import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradecalc/ui/doubleBack.dart';
import 'package:gradecalc/ui/drawer.dart';
import 'package:gradecalc/helpers/database_helper.dart' as dbhelper;
import 'package:gradecalc/ui/grade_number_card.dart';

class GradeAveragesScreen extends StatefulWidget {
  @override
  _GradeAveragesScreenState createState() => _GradeAveragesScreenState();
}

class _GradeAveragesScreenState extends State<GradeAveragesScreen> {
  List<Map<String, dynamic>> averages;

  Future<List<Map<String, dynamic>>> getAverages() async {
    averages = await dbhelper.queryAverages();
    return averages;
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBackScaffold(
      appBar: AppBar(
        title: Text('Averages'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: FutureBuilder(
          future: getAverages(),
          builder: (BuildContext context, snapshot){
            if (snapshot.connectionState == ConnectionState.done){
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index){
                      return GradeNumberCard(
                          name: snapshot.data[index]['subject'],
                          numberOfGrades: snapshot.data[index]['value'].toString() == 'null' ? '¯\\_(ツ)_/¯' : snapshot.data[index]['value'],
                        );
                    },
                  ),
                ),
              );
            } else {
              return SpinKitChasingDots(color: Colors.grey);
            }
          },
        ),
      ),
    );
  }
}
