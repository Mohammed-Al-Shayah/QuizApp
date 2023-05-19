import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/state_mangments/quiz_provider.dart';
import 'package:quizapp/view/widgets/correctAnswer.dart';


class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  Future<void> deleteQuestion({required int id}) async {
    bool delete = await Provider.of<QuizProvider>(context, listen: false)
        .deleteQuiz(id: id);
    if (delete) {
      showSnackBar(
          context: context,
          message: 'Question deleted successfully',
          error: false);
    } else {
      showSnackBar(
          context: context, message: 'Failed to delete question', error: true);
    }
  }

  void showSnackBar(
      {required BuildContext context,
        required String message,
        bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<QuizProvider>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Quiz',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal,
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
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('+  Add New question'),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<QuizProvider>(
              builder: (context, value, child) {
                if (value.quizzes.isEmpty) {
                  return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                }else{
                  return Expanded(
                    child: Consumer<QuizProvider>(
                      builder: (context, value, child) {
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
                                          Flexible(
                                              child: Text(
                                                  value.quizzes[index].question)),
                                          IconButton(
                                            onPressed: () async {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    scrollable: true,
                                                    title:
                                                    const Text('Delete question'),
                                                    content: Column(
                                                      children: [
                                                        const Text(
                                                          "Are you sure you want to delete this question?",
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () async {
                                                                deleteQuestion(
                                                                    id: value
                                                                        .quizzes[
                                                                    index]
                                                                        .id!);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Delete'),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                            ),
                                          ),
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
                      },
                    ),
                  );

              }
              },
            ),
          ],
        ),
      ),
    );
  }
}
