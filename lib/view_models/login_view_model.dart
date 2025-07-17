import 'package:flutter/material.dart';
import 'package:intern_training_app/services/auth_service.dart';

class LoginViewModel {
  //controllers for the text fields
  //these controllers will be used to get the text from the text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // this is the key for the form
  //it will be used to validate the form
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  final AuthService _authService = AuthService();
  String? validateEmail(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your valid password';
    }
    return null;
  }

  void togglePasswordVisibility(VoidCallback UpdateUI) {
    // Toggle password visibility
    obscurePassword = !obscurePassword;
    UpdateUI();
  }

  Future<String?> login() async {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      return await _authService.signIn(email, password);
    } else {
      return "Please fill all fields correctly.";
    }
  }

  void dispose() {
    //dispose the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
  }
}
