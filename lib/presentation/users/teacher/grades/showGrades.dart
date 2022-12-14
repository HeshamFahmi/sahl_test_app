// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';
import 'package:sahl_test_app/utils/contant/customSizedBox.dart';
import 'package:sahl_test_app/utils/contant/widthandheight.dart';

import '../../../sharedWidgets/customButton.dart';
import '../../../sharedWidgets/customGradeRow.dart';
import '../../../sharedWidgets/customTextField.dart';

class ShowGrades extends StatefulWidget {
  const ShowGrades({Key? key}) : super(key: key);

  @override
  State<ShowGrades> createState() => _ShowGradesState();
}

class _ShowGradesState extends State<ShowGrades> {
  TextEditingController examCode = TextEditingController();
  List<String> studentsName = [];
  List<int> studentsGrades = [];
  bool gradesLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightColor,
      body: Column(
        children: [
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.1),
          CustomTextField(
              icon: Icons.code,
              textEditingController: examCode,
              keyboardType: TextInputType.number,
              hint: "Please Enter Exam Code",
              isPassword: false),
          customSizedBox(0.0, 10.h),
          CustomButton(
              onpress: () {
                setState(() {
                  gradesLoaded = true;
                  studentsGrades.clear();
                  studentsName.clear();
                  getStudentsGrades(examCode.text.toString());
                  FocusScope.of(context).unfocus();
                });
              },
              color: appColor,
              title: "Show Grades",
              widht: getwidth(context) * 0.5),
          gradesLoaded
              ? Center(
                  child: CircularProgressIndicator(
                  color: appColor,
                ))
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: appLightColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView.builder(
                        itemCount: studentsGrades.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: appColor,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            width: getwidth(context) * 0.5,
                            child: Column(children: [
                              CustomGradeRow(
                                title: "Name : ",
                                value: studentsName[index],
                                color: myWhite,
                              ),
                              CustomGradeRow(
                                  title: "Grade : ",
                                  value: studentsGrades[index].toString(),
                                  color: myWhite)
                            ]),
                          );
                        },
                      )),
                )
        ],
      ),
    );
  }

  getStudentsGrades(String examCode) {
    FirebaseFirestore.instance
        .collection('Grades')
        .doc("StudentsGrade")
        .collection(examCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        studentsName.add(doc["name"]);
        studentsGrades.add(doc["grade"]);
      }
      setState(() {
        gradesLoaded = false;
      });
    });
  }
}
