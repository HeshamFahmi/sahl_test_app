// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/presentation/users/student/home/studentHomePage.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/myNavigator.dart';
import 'package:sahl_test_app/utils/contant/widthandheight.dart';

import '../../../../utils/contant/customSizedBox.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customGradeRow.dart';
import '../../../sharedWidgets/customText.dart';

class StudentQuizQestions extends StatefulWidget {
  final String examCode;
  const StudentQuizQestions({
    Key? key,
    required this.examCode,
  }) : super(key: key);

  @override
  State<StudentQuizQestions> createState() => _StudentQuizQestionsState();
}

class _StudentQuizQestionsState extends State<StudentQuizQestions> {
  List<String> questions = [];
  List<String> answers1 = [];
  List<String> answers2 = [];
  List<String> answers3 = [];
  List<String> answers4 = [];
  List<String> answers5 = [];
  List<String> correctAnswers = [];
  int questionCount = 0;
  bool loaded = true;
  int? numOfQuestions;
  int score = 0;

  @override
  void initState() {
    super.initState();
    getQuizQuestion(widget.examCode);
    getQuizQuestionsNum(widget.examCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightColor,
      body: Center(
        child: loaded
            ? CircularProgressIndicator(
                color: appColor,
              )
            : questionCount >= numOfQuestions!
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTxt(
                          ellipsis: false,
                          title: "Exam Ended",
                          txtSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: appColor),
                      customSizedBox(0.0, 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CustomGradeRow(
                          title: "Your Score : ",
                          value: "$score / ${numOfQuestions!}",
                          color: appColor,
                        ),
                      ),
                      CustomButton(
                        widht: double.infinity,
                        color: appColor,
                        title: "Go to Homepage",
                        onpress: () {
                          MyNavigetor().pushReplacement(
                              const StudentHomepage(), context);
                        },
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customSizedBox(0.0, getheight(context) * 0.05),
                      CustomTxt(
                          ellipsis: false,
                          title:
                              "Q.No ${(questionCount) + 1} :- ${questions[questionCount]}",
                          txtSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: myWhite),
                      CustomButton(
                          onpress: () {
                            setState(() {
                              if (answers1[questionCount] ==
                                  correctAnswers[questionCount]) {
                                score++;
                              }
                              questionCount++;
                            });
                          },
                          color: appColor,
                          title: answers1[questionCount],
                          widht: double.infinity),
                      CustomButton(
                          onpress: () {
                            setState(() {
                              if (answers2[questionCount] ==
                                  correctAnswers[questionCount]) {
                                score++;
                              }
                              questionCount++;
                            });
                          },
                          color: appColor,
                          title: answers2[questionCount],
                          widht: double.infinity),
                      CustomButton(
                          onpress: () {
                            setState(() {
                              if (answers3[questionCount] ==
                                  correctAnswers[questionCount]) {
                                score++;
                              }
                              questionCount++;
                            });
                          },
                          color: appColor,
                          title: answers3[questionCount],
                          widht: double.infinity),
                      CustomButton(
                          onpress: () {
                            setState(() {
                              if (answers4[questionCount] ==
                                  correctAnswers[questionCount]) {
                                score++;
                              }
                              questionCount++;
                            });
                          },
                          color: appColor,
                          title: answers4[questionCount],
                          widht: double.infinity),
                      CustomButton(
                          onpress: () {
                            setState(() {
                              if (answers5[questionCount] ==
                                  correctAnswers[questionCount]) {
                                score++;
                              }
                              questionCount++;
                            });
                          },
                          color: appColor,
                          title: answers5[questionCount],
                          widht: double.infinity),
                    ],
                  ),
      ),
    );
  }

  getQuizQuestion(String examCode) {
    FirebaseFirestore.instance
        .collection('Quizes')
        .doc(examCode)
        .collection("Questions")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        questions.add(doc["question"]);
        answers1.add(doc["answer1"]);
        answers2.add(doc["answer2"]);
        answers3.add(doc["answer3"]);
        answers4.add(doc["answer4"]);
        answers5.add(doc["answer5"]);
        correctAnswers.add(doc["correctAnswer"]);
        setState(() {
          loaded = false;
        });
      }
    });
  }

  getQuizQuestionsNum(String examCode) {
    FirebaseFirestore.instance
        .collection('Quizes')
        .doc(examCode)
        .get()
        .then((value) => numOfQuestions = int.parse(value["NumOfQuestions"]));
  }
}
