// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahl_test_app/utils/contant/myNavigator.dart';

import '../../utils/contant/colors.dart';
import 'customText.dart';

class UserCard extends StatelessWidget {
  final String type;
  final String avatar;
  final Widget screenName;
  const UserCard({
    Key? key,
    required this.type,
    required this.avatar,
    required this.screenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MyNavigetor().push(screenName, context);
      },
      child: Container(
        width: 230.w,
        height: 200.h,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: appColor, borderRadius: BorderRadius.circular(100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              avatar,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
            CustomTxt(
                title: type,
                txtSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: myWhite,
                ellipsis: false)
          ],
        ),
      ),
    );
  }
}
