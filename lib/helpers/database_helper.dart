import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:gradecalc/models/evaulation.dart';

createdb () async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(

    join(await getDatabasesPath(), 'evaluationsDB.db'),
    onCreate: (db, version){
      return db.execute(
        "CREATE TABLE evaluations(evaluationID INTEGER PRIMARY KEY, type TEXT,"
            "subject TEXT, weight INTEGER, numberValue INTEGER, creatingTime TEXT)",
      );
    },

    version: 1,
  );
  return database;
}

Future<void> insertEval(Evaluation eval) async {
  final Database db = await createdb();

  await db.insert(
    'evaluations',
    eval.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> evals() async{
  final Database db = await createdb();

  final List<Map<String, dynamic>> maps = await db.query('evaluations');

  return maps;
}

Future<void> deleteEval() async {
  final Database db = await createdb();

  await db.execute('DELETE FROM evaluations');
}

Future<List<Map<String, dynamic>>> givenMonth(dateFrom, dateTo) async{
  final Database db = await createdbEval();

  final List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT * FROM evaluations "
          "WHERE creatingTime BETWEEN '$dateFrom' AND '$dateTo';"
  );

  return maps;
}

Future<int> lastMonth() async {

  var now = DateTime.now();
  var dateFrom = DateTime(now.year, now.month - 1, 1);
  var dateTo = DateTime(now.year, now.month, 1);
  return calculate(dateFrom, dateTo);
}

Future<int> currentMonth() async {

  var now = DateTime.now();
  var dateFrom = DateTime(now.year, now.month, 1);
  var dateTo = DateTime(now.year, now.month + 1, 1);
  return calculate(dateFrom, dateTo);
}

Future<int>calculate(dateFrom, dateTo) async {

  final Database db = await createdbEval();
  final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM evaluations WHERE "
      "subject NOT IN ('Művészetek', 'Testnevelés','Testnevelés és sport','Művészetek: zeneművészet')"
      "AND creatingTime BETWEEN '$dateFrom' AND '$dateTo' AND numberValue IN ('5', '4', '1')"
      "AND type IN ('MidYear')");
  print(maps.length);
  try {
    List<int> moneyValues = [];
    for (var i=0; i<maps.length; i++){
    bool isDouble;
    int numberValue;

    Evaluation eval = Evaluation(
    evaluationID: maps[i]['evaluationID'],
    type: maps[i]['type'],
    subject: maps[i]['subject'],
    weight: maps[i]['weight'],
    numberValue: maps[i]['numberValue'],
    creatingTime: maps[i]['creatingTime']
    );

    isDouble = (eval.weight == '200%') ? true : false;
    numberValue = eval.numberValue;

    int value = 100;

    value *= numberValue;

    if (numberValue == 1){
    value = -1000;
    }

    if (isDouble){
    value *= 2;
    }

    moneyValues.add(value);
    }

    var sum = moneyValues.reduce((a, b) => a + b);
    print(sum);
    print(moneyValues);
    return sum;
  } catch (e) {
    return 0;
  }
}