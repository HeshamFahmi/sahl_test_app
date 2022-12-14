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
import 'addQuizQuestions.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({Key? key}) : super(key: key);

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  TextEditingController examCode = TextEditingController();
  TextEditingController examNumOfQuestions = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightColor,
      body: Column(
        children: [
          customSizedBox(0.0, getheight(context) * 0.05),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomTxt(
                ellipsis: false,
                title: "Please fill This Fields to complete Exam Questions",
                txtSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: appColor),
          ),
          customSizedBox(0.0, 20.h),
          CustomTextField(
              icon: Icons.code,
              textEditingController: examCode,
              keyboardType: TextInputType.number,
              hint: "Please Enter Exam Code",
              isPassword: false),
          customSizedBox(0.0, 10.h),
          CustomTextField(
              icon: Icons.numbers,
              textEditingController: examNumOfQuestions,
              keyboardType: TextInputType.number,
              hint: "Please Enter Numbers of Questions",
              isPassword: false),
          customSizedBox(0.0, 20.h),
          CustomButton(
              onpress: () {
                MyNavigetor().push(
                    QuizQuestions(
                        examCode: examCode.text.toString(),
                        numOfQuestions: examNumOfQuestions.text.toString()),
                    context);
              },
              color: appColor,
              title: "Start Exam",
              widht: getwidth(context) * 0.5),
        ],
      ),
    );
  }
}
