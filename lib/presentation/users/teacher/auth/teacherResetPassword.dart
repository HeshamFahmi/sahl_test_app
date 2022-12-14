// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/presentation/sharedWidgets/customTextField.dart';
import 'package:sahl_test_app/presentation/sharedWidgets/showAndHideLoader.dart';
import 'package:sahl_test_app/presentation/users/teacher/auth/teacherLogin.dart';
import 'package:sahl_test_app/services/firebaseAuth/auth.dart';

import '../../../../utils/contant/colors.dart';
import '../../../../utils/contant/customSizedBox.dart';
import '../../../../utils/contant/customToast.dart';
import '../../../../utils/contant/myNavigator.dart';
import '../../../../utils/contant/widthandheight.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customText.dart';

class TeacherResetPassword extends StatefulWidget {
  const TeacherResetPassword({Key? key}) : super(key: key);

  @override
  State<TeacherResetPassword> createState() => _TeacherResetPasswordState();
}

class _TeacherResetPasswordState extends State<TeacherResetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              customSizedBox(0.0, getheight(context) * 0.1),
              Container(
                alignment: Alignment.centerLeft,
                child: CustomTxt(
                    ellipsis: false,
                    title: "Teacher Reset Password",
                    txtSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: appColor),
              ),
              customSizedBox(0.0, getheight(context) * 0.05),
              CustomTextField(
                icon: Icons.email,
                textEditingController: emailController,
                keyboardType: TextInputType.name,
                hint: "Please Enter Your E-mail ...",
                isPassword: false,
              ),
              customSizedBox(0.0, 10.0.w),
              CustomButton(
                  onpress: () {
                    showLoading(context);

                    AuthenticationHelper()
                        .resetpassword(emailController.text.toString())
                        .then((result) {
                      if (result == null) {
                        hideLoading(context);
                        MyNavigetor()
                            .pushReplacement(const TeacherLogin(), context);
                      } else {
                        hideLoading(context);
                        showFailedToast(result);
                      }
                    });
                  },
                  widht: double.infinity,
                  color: appColor,
                  title: "Send Instractions Mail"),
            ],
          ),
        ),
      ),
    );
  }
}
