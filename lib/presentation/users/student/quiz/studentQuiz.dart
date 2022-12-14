// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/myNavigator.dart';
import 'package:sahl_test_app/utils/contant/widthandheight.dart';

import '../../../../utils/contant/customSizedBox.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customText.dart';
import '../../../sharedWidgets/customTextField.dart';
import 'quizQuestion.dart';

class StudentQuiz extends StatefulWidget {
  const StudentQuiz({Key? key}) : super(key: key);

  @override
  State<StudentQuiz> createState() => _StudentQuizState();
}

class _StudentQuizState extends State<StudentQuiz> {
  TextEditingController examCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightColor,
      body: Column(
        children: [
          customSizedBox(0.0, getheight(context) * 0.1),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomTxt(
                ellipsis: false,
                title: "Please fill This Fields to complete Exam Questions",
                txtSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: appColor),
          ),
          CustomTextField(
              icon: Icons.code,
              textEditingController: examCode,
              keyboardType: TextInputType.number,
              hint: "Please Enter Exam Code",
              isPassword: false),
          customSizedBox(0.0, 20.h),
          CustomButton(
              onpress: () {
                MyNavigetor().push(
                    StudentQuizQestions(
                      examCode: examCode.text.toString(),
                    ),
                    context);
              },
              color: appColor,
              title: "Start Quiz",
              widht: getwidth(context) * 0.5),
        ],
      ),
    );
  }
}
