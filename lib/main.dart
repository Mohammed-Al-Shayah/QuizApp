import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/database/db_provider.dart';
import 'package:quizapp/state_mangments/quiz_provider.dart';
import 'package:quizapp/view/addQuestion/addQuestion.dart';
import 'package:quizapp/view/createScreen/createScreen.dart';
import 'package:quizapp/view/homeScreen/HomeScreen.dart';
import 'package:quizapp/view/splashscreen.dart';
import 'package:quizapp/view/startQuiz/startQuiz.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<QuizProvider>(create:((context) => QuizProvider()) ),
        ],
        builder: (context, child) {
         return  MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute:"splashScreen" ,
            routes: {
              "splashScreen": (context)=>const SplashScreen(),
              "homeScreen": (context)=>const HomeScreen(),
              "CreateQuiz": (context)=>const CreateQuiz(),
              "AddQuestion": (context)=>const AddQuestion(),
              "StartQuiz": (context)=>const StartQuiz(),
            },
          );

        },
      );
  }
}
