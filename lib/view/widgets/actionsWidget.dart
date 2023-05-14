import 'package:flutter/material.dart';
class ActionsWidget extends StatelessWidget {
   ActionsWidget({
    super.key,
    required this.text,
    required this.image,
    required this.score,
    required this.motivationText,
    required this.onPressed,

  });
  late String text ;
  late String image ;
  late String score ;
  late String motivationText ;
  late void Function() onPressed;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(text,style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 25),),
            const SizedBox(height: 10,),
            Image.asset(image,height: 200,fit:BoxFit.cover ,),
            const SizedBox(height: 10,),
            Text(score,style:const TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            Text(motivationText,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: onPressed, child: const Text('Back to home'), style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}