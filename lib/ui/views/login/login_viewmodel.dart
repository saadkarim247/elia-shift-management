import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

enum Type { password, email }

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  bool _passHasFocus = false;
  bool _emailHasFocus = false;

  bool get passFocus => _passHasFocus;
  bool get emailFocus => _emailHasFocus;

  void setFocus(Type input, BuildContext context) {
    if (input == Type.password) {
      _emailHasFocus = false;
      _passHasFocus = true;
      FocusScope.of(context).requestFocus(passFocusNode);
    } else {
      _emailHasFocus = true;
      _passHasFocus = false;
      FocusScope.of(context).requestFocus(emailFocusNode);
    }
    notifyListeners();
  }

  bool isFormValid = false;

  void validateForm() {
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      isFormValid = true;
    } else {
      isFormValid = false;
    }
    notifyListeners();
  }
}
