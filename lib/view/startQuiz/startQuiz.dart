import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/model/quize.dart';
import 'package:quizapp/state_mangments/quiz_provider.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {

  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QuizProvider>(context, listen: false).read();
  }
  @override
  Widget build(BuildContext context) {
    List<Quiz> quizzes = Provider.of<QuizProvider>(context).quizzes;

    if (quizzes.isEmpty || quizzes.length<5) {
      // show error widget
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Quiz App'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
               const Text("Sorry!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                const SizedBox(height: 10,),
                const Text('You must add at least 5 question to start'),
                const SizedBox(height: 10),
                Image.asset('assets/images/faq.png',height: 200),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "homeScreen");
                  },
                  child: const Text("Back to home"),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.teal,


                  ),
                ),              ],
            )),
      );
    }
    Quiz quiz = quizzes[_currentIndex];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Quiz App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "Question ${_currentIndex + 1}",
                  style:const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  " / ${quizzes.length}",
                  style:const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25,),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding:const  EdgeInsets.symmetric(vertical: 7,horizontal: 15),
                child: Text(
                quiz.question ,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                String answer;
                switch (index) {
                  case 0:
                    answer = quiz.answer1;
                    break;
                  case 1:
                    answer = quiz.answer2;
                    break;
                  case 2:
                    answer = quiz.answer3;
                    break;
                  case 3:
                    answer = quiz.answer4;
                    break;
                  default:
                    answer = '';
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Ink(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.teal,
                        ),
                      ),
                    child: ListTile(

                      title: Text(
                        answer,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        if (_currentIndex < quizzes.length - 1) {
                          setState(() {
                            _currentIndex++;
                          });
                        } else {
                          // show result widget
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
