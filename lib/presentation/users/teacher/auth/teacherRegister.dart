// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/presentation/sharedWidgets/showAndHideLoader.dart';
import 'package:sahl_test_app/presentation/users/teacher/auth/teacherLogin.dart';
import 'package:sahl_test_app/presentation/users/teacher/home/teacherHomePage.dart';
import 'package:sahl_test_app/services/firestoreFunctions/saveUser.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/customToast.dart';
import 'package:sahl_test_app/utils/contant/myNavigator.dart';
import 'package:sahl_test_app/utils/contant/widthandheight.dart';

import '../../../../services/firebaseAuth/auth.dart';
import '../../../../utils/contant/customSizedBox.dart';
import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customText.dart';
import '../../../sharedWidgets/customTextField.dart';

class TeacherRegister extends StatefulWidget {
  const TeacherRegister({Key? key}) : super(key: key);

  @override
  State<TeacherRegister> createState() => _TeacherRegisterState();
}

class _TeacherRegisterState extends State<TeacherRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
                    title: "Create New Account ...",
                    txtSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: appColor),
              ),
              customSizedBox(0.0, 10.0.h),
              CustomTextField(
                icon: Icons.email,
                textEditingController: emailController,
                keyboardType: TextInputType.emailAddress,
                hint: "Please Enter Your Email ...",
                isPassword: false,
              ),
              customSizedBox(0.0, 10.0.h),
              CustomTextField(
                icon: Icons.man,
                textEditingController: nameController,
                keyboardType: TextInputType.name,
                hint: "Please Enter Your Name ...",
                isPassword: false,
              ),
              customSizedBox(0.0, 10.0.h),
              CustomTextField(
                icon: Icons.password,
                textEditingController: passwordController,
                keyboardType: TextInputType.visiblePassword,
                hint: "Please Enter Your Password ...",
                isPassword: true,
              ),
              customSizedBox(0.0, 10.0.h),
              CustomButton(
                  onpress: () {
                    showLoading(context);
                    AuthenticationHelper()
                        .signUp(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    )
                        .then((result) {
                      if (result == null) {
                        hideLoading(context);
                      } else {
                        showFailedToast(result);
                        hideLoading(context);
                      }

                      final FirebaseAuth auth = FirebaseAuth.instance;

                      final user = auth.currentUser;

                      String userId = user!.uid;

                      debugPrint(userId);

                      SaveUser()
                          .addAdmin(nameController.text.toString(),
                              emailController.text.toString(), userId)
                          .then((value) => MyNavigetor()
                              .pushReplacement(const TeacherHome(), context));
                    });
                  },
                  widht: double.infinity,
                  color: appColor,
                  title: "Register Now ..."),
              customSizedBox(0.0, 15.0.h),
              InkWell(
                onTap: () {
                  MyNavigetor().push(const TeacherLogin(), context);
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: CustomTxt(
                    ellipsis: false,
                    color: myGrey,
                    fontWeight: FontWeight.normal,
                    title: "Do You Have An Account ... Login Now ...",
                    txtSize: 17.0.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
