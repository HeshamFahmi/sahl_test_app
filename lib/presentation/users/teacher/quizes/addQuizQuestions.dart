// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/presentation/users/teacher/home/teacherHomePage.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/customSizedBox.dart';
import 'package:sahl_test_app/utils/contant/myNavigator.dart';
import 'package:sahl_test_app/utils/contant/widthandheight.dart';

import '../../../../services/firestoreFunctions/questionsFunctions.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customText.dart';
import '../../../sharedWidgets/customTextField.dart';

class QuizQuestions extends StatefulWidget {
  final String examCode;
  final String numOfQuestions;
  const QuizQuestions({
    Key? key,
    required this.examCode,
    required this.numOfQuestions,
  }) : super(key: key);

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  TextEditingController question = TextEditingController();
  List<TextEditingController> answers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  TextEditingController correctAnswer = TextEditingController();
  int countQuestions = 1;

  @override
  void initState() {
    super.initState();
    QuestionFunctions()
        .addQuestionNumbers(widget.examCode, widget.numOfQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customSizedBox(0.0, getheight(context) * 0.1),
            CustomTxt(
                ellipsis: false,
                title: "Please fill This Fields to complete Exam Questions",
                txtSize: 20,
                fontWeight: FontWeight.bold,
                color: appColor),
            customSizedBox(0.0, 20.0.h),
            CustomTextField(
                icon: Icons.question_mark,
                textEditingController: question,
                keyboardType: TextInputType.name,
                hint: "Please Enter Question $countQuestions",
                isPassword: false),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    CustomTextField(
                        icon: Icons.question_answer,
                        textEditingController: answers[index],
                        keyboardType: TextInputType.name,
                        hint: "Please Enter Answer ${index + 1}",
                        isPassword: false),
                    customSizedBox(0.0, 10.0.h),
                  ],
                );
              },
            ),
            customSizedBox(0.0, 10.h),
            CustomTextField(
                icon: Icons.question_answer,
                textEditingController: correctAnswer,
                keyboardType: TextInputType.name,
                hint: "Please Enter The Correct Answer",
                isPassword: false),
            customSizedBox(0.0, 20.0.h),
            countQuestions < int.parse(widget.numOfQuestions)
                ? CustomButton(
                    onpress: () {
                      setState(() {
                        QuestionFunctions().addQuestion(
                            widget.examCode,
                            countQuestions.toString(),
                            question.text.toString(),
                            answers[0].text.toString(),
                            answers[1].text.toString(),
                            answers[2].text.toString(),
                            answers[3].text.toString(),
                            answers[4].text.toString(),
                            correctAnswer.text.toString());

                        question.clear();
                        answers[0].clear();
                        answers[1].clear();
                        answers[2].clear();
                        answers[3].clear();
                        answers[4].clear();
                        correctAnswer.clear();

                        countQuestions++;
                      });
                    },
                    color: appColor,
                    title: "Next Question ...",
                    widht: getwidth(context) * 0.5)
                : CustomButton(
                    onpress: () {
                      QuestionFunctions().addQuestion(
                          widget.examCode,
                          countQuestions.toString(),
                          question.text.toString(),
                          answers[0].text.toString(),
                          answers[1].text.toString(),
                          answers[2].text.toString(),
                          answers[3].text.toString(),
                          answers[4].text.toString(),
                          correctAnswer.text.toString());

                      MyNavigetor()
                          .pushReplacement(const TeacherHome(), context);
                    },
                    color: appColor,
                    title: "End Exam",
                    widht: getwidth(context) * 0.5),
          ],
        ),
      ),
    );
  }
}
