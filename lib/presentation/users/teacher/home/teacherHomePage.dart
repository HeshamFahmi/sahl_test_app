// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/presentation/users/teacher/auth/teacherLogin.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/myNavigator.dart';
import 'package:sahl_test_app/utils/contant/strings.dart';
import 'package:sahl_test_app/utils/contant/widthandheight.dart';
import '../../../../services/firebaseAuth/auth.dart';
import '../../../../utils/contant/customSizedBox.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customText.dart';
import '../../../sharedWidgets/customUserCard.dart';
import '../grades/showGrades.dart';
import '../quizes/createQuiz.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appLightColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              customSizedBox(0.0, getheight(context) * 0.2),
              CustomTxt(
                  ellipsis: false,
                  title: "Welcome Back ... Please Choose ....",
                  txtSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: appColor),
              customSizedBox(0.0, getheight(context) * 0.05),
              CustomUserCard(
                title: "Add A Quiz ....",
                color: appColor,
                imagePath: quizIcon,
                screenName: const AddQuiz(),
              ),
              CustomUserCard(
                  title: "Show Student Result",
                  color: appColor,
                  imagePath: gradeIcon,
                  screenName: const ShowGrades()),
              customSizedBox(0.0, 20.0.h),
              Container(
                alignment: Alignment.center,
                child: CustomButton(
                    onpress: () {
                      AuthenticationHelper().signOut().then((value) =>
                          MyNavigetor()
                              .pushReplacement(const TeacherLogin(), context));
                    },
                    color: appColor,
                    title: "Logout",
                    widht: getwidth(context) * 0.5),
              )
            ],
          ),
        ));
  }
}
