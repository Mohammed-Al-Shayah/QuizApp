import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/model/process_response.dart';
import 'package:quizapp/model/quize.dart';
import 'package:quizapp/state_mangments/quiz_provider.dart';
import 'package:quizapp/utils/helpers.dart';
import 'package:quizapp/view/addQuestion/widgets/addAnswerWidget.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> with Helpers {

  late TextEditingController _questionTextController;

 late List<TextEditingController> _answerTextControllers = [
   TextEditingController(),
   TextEditingController(),
   TextEditingController(),
   TextEditingController(),
 ];

 late int _correctAnswerIndex = 0;


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _questionTextController = TextEditingController();
   _correctAnswerIndex=0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _questionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Add New Question'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _questionTextController,
                decoration: InputDecoration(
                  labelText: 'Question',
                  hintText: 'Enter The Question',
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: const Icon(
                    Icons.question_mark_sharp,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:const BorderSide(color: Colors.teal)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const  BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                ),
                cursorColor: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),
              AddAnswerWidget(
                controller: _answerTextControllers[0],
                optionsColors: Colors.amber,
                optionsText: 'A',
                labelText: 'First Answer',
                hintText: 'First Answer',
              ),
              const SizedBox(
                height: 10,
              ),
              AddAnswerWidget(
                controller: _answerTextControllers[1],
                optionsColors: Colors.green,
                optionsText: 'B',
                labelText: 'Second Answer',
                hintText: 'Second Answer',
              ),
              const SizedBox(
                height: 10,
              ),
              AddAnswerWidget(
                controller: _answerTextControllers[2],
                optionsColors: Colors.black38,
                optionsText: 'C',
                labelText: 'Third Answer',
                hintText: 'Third Answer',
              ),
              const SizedBox(
                height: 10,
              ),
              AddAnswerWidget(
                controller: _answerTextControllers[3],
                optionsColors: Colors.pinkAccent,
                optionsText: 'D',
                labelText: 'Fourth Answer',
                hintText: 'Fourth Answer',
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select the correct answer",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    child: DropdownButton<int>(
                      style: const TextStyle(color: Colors.teal, fontSize: 20),
                      value: _correctAnswerIndex,
                      onChanged: (int? newValue) {
                        setState(() {
                          _correctAnswerIndex = newValue!;
                        });
                      },
                      items: List.generate(4, (index) {
                        return DropdownMenuItem(
                          value: index,
                          child: Text('${index+1}'),);
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async{
                  await _preformSave();
                },
                child: const Text('Add question'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _preformSave() async {
    if (_checkData()) {
      await save();
    }
  }

  bool _checkData() {
    if (_questionTextController.text.isNotEmpty &&
    _answerTextControllers.isNotEmpty
    ) {
      return true;
    }
    showSnackBar(context: context,message: 'Enter required data ',error: true);
    return false;
  }




  Quiz get quiz {
    Quiz newQuiz =Quiz();
    newQuiz.answer1=_answerTextControllers[0].text;
    newQuiz.answer2=_answerTextControllers[1].text;
    newQuiz.answer3=_answerTextControllers[2].text;
    newQuiz.answer4=_answerTextControllers[3].text;
    newQuiz.question=_questionTextController.text;
    newQuiz.correctAnswer=_correctAnswerIndex;
    return newQuiz;
  }

  Future<void> save() async {
    bool created = await Provider.of<QuizProvider>(context,listen: false).create(quiz:quiz);
      String message =created ? "Created Successfuly" : "Create failed";
    showSnackBar(context: context,message:message, error: !created);

  }
}
