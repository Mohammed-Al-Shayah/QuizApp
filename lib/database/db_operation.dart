

import 'package:quizapp/database/db_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbOperations<Model>{
  final Database database = DbController().database;

  Future<int> create (Model model);
  Future<List<Model>> read ();
  Future<Model?> show (int id);
  Future<bool> update (Model model);
  Future<bool> delete (int id);

}