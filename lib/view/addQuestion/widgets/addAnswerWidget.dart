import 'package:flutter/material.dart';
class AddAnswerWidget extends StatelessWidget {
   const AddAnswerWidget({
    Key? key,
    required this.optionsColors,
     required this.optionsText,
     required this.labelText,
     required this.hintText,
     required this.controller,




   }) : super(key: key);

  final Color optionsColors;
  final String optionsText;
   final String labelText;
   final String hintText;
   final TextEditingController controller;


   @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Container(
            width: 50,
            height: 50,
            color: optionsColors,
            child: Center(
                child: Text(
                  optionsText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              labelStyle: TextStyle(color: Colors.grey.shade600),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:const BorderSide(color: Colors.teal)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:const BorderSide(
                  color: Colors.teal,
                ),
              ),
            ),
            cursorColor: Colors.teal,
          ),
        ),

      ],
    );
  }
}
