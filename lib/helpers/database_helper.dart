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