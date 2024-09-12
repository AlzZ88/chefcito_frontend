import 'package:frontend_template/shared/providers/my_auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignupWidgetController extends GetxController {
  String code = '';
  Future<String> signup(
      String email, String name, String password, BuildContext context) async {
    final authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    try {
      await authProvider.signup(
        email,
        password,
        name,
      );
      code = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        code = e.code;
      } else if (e.code == 'email-already-in-use') {
        code = e.code;
      }
    } finally {
      return code;
    }
  }
}
