// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/presentation/users/student/auth/studentLogin.dart';

import '../../../../services/firebaseAuth/auth.dart';
import '../../../../utils/contant/colors.dart';
import '../../../../utils/contant/customSizedBox.dart';
import '../../../../utils/contant/customToast.dart';
import '../../../../utils/contant/myNavigator.dart';
import '../../../../utils/contant/widthandheight.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customText.dart';
import '../../../sharedWidgets/customTextField.dart';
import '../../../sharedWidgets/showAndHideLoader.dart';

class StudentResetPassword extends StatefulWidget {
  const StudentResetPassword({Key? key}) : super(key: key);

  @override
  State<StudentResetPassword> createState() => _StudentResetPasswordState();
}

class _StudentResetPasswordState extends State<StudentResetPassword> {
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
                    title: "Student Reset Password",
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
                            .pushReplacement(const StudentLogin(), context);
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
