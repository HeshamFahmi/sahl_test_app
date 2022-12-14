// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/presentation/sharedWidgets/customText.dart';
import 'package:sahl_test_app/presentation/users/homepage.dart';
import 'package:sahl_test_app/presentation/users/student/quiz/studentQuiz.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/myNavigator.dart';
import 'package:sahl_test_app/utils/contant/strings.dart';
import 'package:sahl_test_app/utils/contant/widthandheight.dart';

import '../../../../services/firebaseAuth/auth.dart';
import '../../../../utils/contant/customSizedBox.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customUserCard.dart';

class StudentHomepage extends StatelessWidget {
  const StudentHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appLightColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              customSizedBox(0.0, getheight(context) * 0.2),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomTxt(
                    title: "Student Home Page",
                    txtSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: appColor,
                    ellipsis: false),
              ),
              CustomUserCard(
                title: "Start Quiz",
                color: appColor,
                imagePath: quizIcon,
                screenName: const StudentQuiz(),
              ),
              customSizedBox(0.0, 20.0.h),
              Container(
                alignment: Alignment.center,
                child: CustomButton(
                    onpress: () {
                      AuthenticationHelper().signOut().then((value) =>
                          MyNavigetor()
                              .pushReplacement(const Homepage(), context));
                    },
                    color: Colors.red,
                    title: "Logout",
                    widht: getwidth(context) * 0.5),
              )
            ],
          ),
        ));
  }
}
