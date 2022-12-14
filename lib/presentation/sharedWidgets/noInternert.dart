// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../utils/contant/colors.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: appColor,
              ),
            ),
            Image.asset('assets/no_internet.png')
          ],
        ),
      ),
    );
  }
}
