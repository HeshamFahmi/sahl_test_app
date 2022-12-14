import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sahl_test_app/presentation/sharedWidgets/customText.dart';
import 'package:sahl_test_app/presentation/sharedWidgets/userCard.dart';
import 'package:sahl_test_app/presentation/users/student/auth/studentLogin.dart';
import 'package:sahl_test_app/presentation/users/teacher/auth/teacherLogin.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/strings.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTxt(
                title: "Welcome to Sahl Company ...",
                txtSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: appColor,
                ellipsis: false),
            const UserCard(
              avatar: teacherAvater,
              type: "Teacher",
              screenName: TeacherLogin(),
            ),
            const UserCard(
              avatar: studentAvater,
              type: "Student",
              screenName: StudentLogin(),
            )
          ],
        ),
      ),
    );
  }
}
