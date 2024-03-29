class Quiz {
  late int? id;
  late String question;
  late String answer1;
  late String answer2;
  late String answer3;
  late String answer4;
  late int correctAnswer;

  Quiz({
    this.id,
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.correctAnswer,
  });
  Quiz.fromMap({required Map<String,dynamic>rowMap}){
    id=rowMap['id'];
    question=rowMap['question'];
    correctAnswer=rowMap['correctAnswer'];
    answer1=rowMap['answer1'];
    answer2=rowMap['answer2'];
    answer3=rowMap['answer3'];
    answer4=rowMap['answer4'];

  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map= <String,dynamic> {};
    map['question']=question;
    map['correctAnswer']=correctAnswer;
    map['answer1']=answer1;
    map['answer2']=answer2;
    map['answer3']=answer3;
    map['answer4']=answer4;

    return map;
  }
}