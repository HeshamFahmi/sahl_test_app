// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/contant/colors.dart';

class CustomButton extends StatelessWidget {
  final double widht;
  final Color color;
  final String title;
  final double? height;
  final VoidCallback onpress;
  const CustomButton({
    Key? key,
    required this.widht,
    required this.color,
    required this.title,
    this.height,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.all(8),
        width: widht.w,
        height: height ?? 50.h,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 15.0.sp,
              fontWeight: FontWeight.bold,
              color: color == myWhite ? appColor : myWhite),
        )),
      ),
    );
  }
}
