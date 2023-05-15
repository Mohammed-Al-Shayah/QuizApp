import 'package:flutter/cupertino.dart';
import 'package:quizapp/controller/quize_db_controller.dart';
import 'package:quizapp/model/process_response.dart';
import 'package:quizapp/model/quize.dart';

class QuizProvider extends ChangeNotifier {

  List<Quiz> quizzes = <Quiz>[];
 final  QuizDbController _quizDbController =QuizDbController();

  Future<bool> create({required Quiz quiz})async{
    int newRowId=await _quizDbController.create(quiz);
    if(newRowId !=0){
      quiz.id=newRowId;
      quizzes.add(quiz);
      notifyListeners();
    }
    return newRowId !=0;
  }



  Future<bool> deleteQuiz({required int id}) async {
    bool deleted = await _quizDbController.delete(id);
    if (deleted) {
      quizzes.removeWhere((element) => element.id == id);
      notifyListeners();
    }
    return deleted;
  }


  Future<ProcessResponse>update({required Quiz updateQuiz,required int index})async{
    bool updated =await _quizDbController.update(updateQuiz);
    if(updated){
      quizzes[index]=updateQuiz;
      notifyListeners();
    }
    return ProcessResponse(message:updated?'updated successfully':'Filed to updated',success:updated );
  }

  Future<void>read()async{
    quizzes =await _quizDbController.read();
    notifyListeners();
  }

}