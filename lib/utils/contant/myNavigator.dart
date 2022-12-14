// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyNavigetor {
  push(screenName, BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => screenName));
  }

  pushReplacement(screenName, BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screenName));
  }

  pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
