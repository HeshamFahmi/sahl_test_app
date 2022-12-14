// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customText.dart';

class CustomGradeRow extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  const CustomGradeRow({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTxt(
          title: title,
          txtSize: 20.0.sp,
          fontWeight: FontWeight.bold,
          color: color,
          ellipsis: false,
        ),
        CustomTxt(
            ellipsis: false,
            title: value,
            txtSize: 18.0.sp,
            fontWeight: FontWeight.normal,
            color: color)
      ],
    );
  }
}
