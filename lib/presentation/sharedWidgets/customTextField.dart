// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/utils/contant/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final String hint;
  final IconData icon;
  bool? minLines;
  bool isPassword;
  // Function(String) onSubmit;
  CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.keyboardType,
    required this.hint,
    required this.icon,
    this.minLines = false,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      // color: myWhite,
      child: TextField(
        //onSubmitted: widget.onSubmit ?? (value) {},
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        minLines: widget.minLines! ? 3 : 1,
        maxLines: widget.minLines! ? 5 : 1,
        obscureText: widget.isPassword ? true : false,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: myWhite, size: 24.sp),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget.isPassword = !widget.isPassword;
                    });
                  },
                  child: Icon(
                      widget.isPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: myWhite,
                      size: 24))
              : SizedBox(
                  width: 10.w,
                  height: 10.h,
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelStyle: TextStyle(
            color: myGrey,
            fontWeight: FontWeight.normal,
          ),
          labelText: widget.hint,
        ),
      ),
    );
  }
}
