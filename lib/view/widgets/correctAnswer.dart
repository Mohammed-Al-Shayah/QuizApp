import 'package:flutter/material.dart';

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({
    Key? key,
    required this.text,
    required this.isCorrect

  }) : super(key: key);
 final String text;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isCorrect?Colors.green:Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}