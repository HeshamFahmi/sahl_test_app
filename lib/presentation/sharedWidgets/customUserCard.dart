// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customText.dart';

class CustomUserCard extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;
  final dynamic screenName;
  const CustomUserCard({
    Key? key,
    required this.title,
    required this.color,
    required this.imagePath,
    required this.screenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => screenName)),
      child: Card(
        color: color,
        elevation: 8,
        shadowColor: Colors.green,
        margin: const EdgeInsets.all(20),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 1)),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 150,
                ),
              ),
              CustomTxt(
                  ellipsis: false,
                  title: title,
                  txtSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
