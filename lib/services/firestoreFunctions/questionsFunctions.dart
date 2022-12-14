// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahl_test_app/utils/contant/customToast.dart';

class QuestionFunctions {
  Future<void> addQuestion(
      String examCode,
      String questionNum,
      String question,
      String answer1,
      String answer2,
      String answer3,
      String answer4,
      String answer5,
      String correctAnswer) {
    CollectionReference questions = FirebaseFirestore.instance
        .collection('Quizes')
        .doc(examCode)
        .collection("Questions");
    return questions
        .doc(questionNum)
        .set({
          "question": question,
          "answer1": answer1,
          "answer2": answer2,
          "answer3": answer3,
          "answer4": answer4,
          "answer5": answer5,
          "correctAnswer": correctAnswer
        })
        .then((value) => showSuccessToast("Success"))
        .catchError((error) => showFailedToast("error in : $error"));
  }

  Future<void> addQuestionNumbers(
    String examCode,
    String questionNums,
  ) {
    CollectionReference questions =
        FirebaseFirestore.instance.collection('Quizes');

    return questions
        .doc(examCode)
        .set({
          "NumOfQuestions": questionNums,
        })
        .then((value) => showSuccessToast("Success"))
        .catchError((error) => showFailedToast("error in : $error"));
  }
}
