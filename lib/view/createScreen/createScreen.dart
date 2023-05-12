import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/model/process_response.dart';
import 'package:quizapp/state_mangments/quiz_provider.dart';
import 'package:quizapp/utils/helpers.dart';
import 'package:quizapp/view/widgets/correctAnswer.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> with Helpers {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QuizProvider>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Create Quiz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "AddQuestion");
              },
              child: Text('+  Add New question'),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<QuizProvider>(
                builder: (context, QuizProvider value, child) {
                  if (value.quizzes.isEmpty) {
                    return Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.warning_amber,
                          color: Colors.teal,
                          size: 80,
                        ),
                        Text(
                          "You didn't add questions ",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: value.quizzes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(child: Text(value.quizzes[index].question)),
                                      IconButton(
                                          onPressed: () async {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  scrollable: true,
                                                  title:
                                                     const  Text('Delete question'),
                                                  content: Column(children: [
                                                  const  Text(
                                                        "Are you sure you want to delete this question ?"),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child:const Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            await deleteQuestion(id: value.quizzes[index].id);
                                                            Navigator.pop(context);
                                                          },
                                                          child:const Text('Delete'),
                                                        ),
                                                      ],
                                                    )
                                                  ]),
                                                );
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.grey.shade600,
                                          ))
                                    ],
                                  ),
                                ),
                                CorrectAnswer(
                                    text: value.quizzes[index].answer1,
                                    isCorrect:
                                        value.quizzes[index].correctAnswer == 0
                                            ? true
                                            : false),
                                CorrectAnswer(
                                    text: value.quizzes[index].answer2,
                                    isCorrect:
                                        value.quizzes[index].correctAnswer == 1
                                            ? true
                                            : false),
                                CorrectAnswer(
                                    text: value.quizzes[index].answer3,
                                    isCorrect:
                                        value.quizzes[index].correctAnswer == 2
                                            ? true
                                            : false),
                                CorrectAnswer(
                                    text: value.quizzes[index].answer4,
                                    isCorrect:
                                        value.quizzes[index].correctAnswer == 3
                                            ? true
                                            : false),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteQuestion({required int id}) async {
    bool deleted =
        await Provider.of<QuizProvider>(context, listen: false).delete(id: id);
    String message = deleted ? "deleted Successfully" : "deleted failed";
    showSnackBar(context: context, message: message, error: !deleted);
  }
}
