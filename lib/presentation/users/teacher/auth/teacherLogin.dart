// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/presentation/sharedWidgets/showAndHideLoader.dart';
import 'package:sahl_test_app/presentation/users/teacher/auth/teacherRegister.dart';
import 'package:sahl_test_app/presentation/users/teacher/auth/teacherResetPassword.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/customToast.dart';
import 'package:sahl_test_app/utils/contant/myNavigator.dart';
import 'package:sahl_test_app/utils/contant/widthandheight.dart';

import '../../../../services/firebaseAuth/auth.dart';
import '../../../../utils/contant/customSizedBox.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customText.dart';
import '../../../sharedWidgets/customTextField.dart';
import '../home/teacherHomePage.dart';

class TeacherLogin extends StatefulWidget {
  const TeacherLogin({Key? key}) : super(key: key);

  @override
  State<TeacherLogin> createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    title: "Teacher Login",
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
              customSizedBox(0.0, 15.0),
              CustomTextField(
                icon: Icons.password,
                textEditingController: passwordController,
                keyboardType: TextInputType.visiblePassword,
                hint: "Please Enter Your Password ...",
                isPassword: true,
              ),
              customSizedBox(0.0, 5.0),
              InkWell(
                onTap: () {
                  MyNavigetor().push(const TeacherResetPassword(), context);
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: CustomTxt(
                    ellipsis: false,
                    color: myGrey,
                    fontWeight: FontWeight.normal,
                    title: "Forget Your Password ??",
                    txtSize: 17.0.sp,
                  ),
                ),
              ),
              customSizedBox(0.0, 10.0),
              CustomButton(
                  onpress: () async {
                    showLoading(context);
                    AuthenticationHelper()
                        .signIn(emailController.text.toString(),
                            passwordController.text.toString())
                        .then((result) {
                      if (result == null) {
                        hideLoading(context);
                        MyNavigetor()
                            .pushReplacement(const TeacherHome(), context);
                      } else {
                        hideLoading(context);
                        showFailedToast(result);
                      }
                    });
                  },
                  widht: double.infinity,
                  color: appColor,
                  title: "Login Now ..."),
              customSizedBox(0.0, 10.0.w),
              CustomTxt(
                  ellipsis: false,
                  title: "--- OR ---",
                  txtSize: 20.0.sp,
                  fontWeight: FontWeight.normal,
                  color: myGrey),
              customSizedBox(0.0, 10.0.w),
              CustomButton(
                  onpress: () {
                    MyNavigetor().push(const TeacherRegister(), context);
                  },
                  widht: double.infinity,
                  color: myBlack,
                  title: "Create a New Account ..."),
            ],
          ),
        ),
      ),
    );
  }
}
