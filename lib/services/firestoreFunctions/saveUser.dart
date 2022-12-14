// ignore_for_file: file_names

import 'package:sahl_test_app/utils/contant/customToast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaveUser {
  Future<void> addAdmin(String name, String email, String uid) {
    CollectionReference users = FirebaseFirestore.instance.collection('admin');
    return users
        .doc(uid)
        .set({'name': name, 'email': email})
        .then((value) => showSuccessToast("Success"))
        .catchError((error) => showFailedToast("error in : $error"));
  }

  Future<void> addStudent(String name, String email, String uid) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('student');
    return users
        .doc(uid)
        .set({'name': name, 'email': email})
        .then((value) => showSuccessToast("Success"))
        .catchError((error) => showFailedToast("error in : $error"));
  }
}
