import 'package:quizapp/database/db_operation.dart';
import 'package:quizapp/database/db_provider.dart';
import 'package:quizapp/model/quize.dart';
import 'package:sqflite/sqflite.dart';

class QuizDbController extends DbOperations<Quiz> {

 final Database database = DbController().database;

  @override
  Future<int> create(Quiz model) async{
    // TODO: implement create
    int newRowId =  await database.insert('quiz', model.toMap());
    return newRowId;
    }

  @override
  Future<bool> delete(int id) async {
    // TODO: implement delete
    int countOfDeletedRows = await database.delete('quiz',where: 'id=?', whereArgs:[id]);
    return countOfDeletedRows >0 ;
  }


  @override
  Future<List<Quiz>> read() async{
    // TODO: implement read
    List<Map<String,dynamic>> rowsMaps= await database.query('quiz');
      return rowsMaps.map((rowMap) => Quiz.fromMap(rowMap: rowMap)).toList();

  }

  @override
  Future<Quiz?> show(int id) async{
    // TODO: implement show
    List<Map<String,dynamic>> rowsMaps= await database.query('quiz',where: 'id=?',whereArgs: [id]);
    return rowsMaps.isNotEmpty?Quiz.fromMap(rowMap: rowsMaps.first):null;  }

  @override
  Future<bool> update(Quiz model) async{
    // TODO: implement update
    int countOfUpdatedRows = await database.update('quiz',model.toMap(),where: 'id=?', whereArgs: [model.id]);
    return countOfUpdatedRows >0;  }

}
