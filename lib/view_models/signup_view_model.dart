import 'package:flutter/material.dart';
import 'package:intern_training_app/services/auth_service.dart';

class SignupViewModel {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final AuthService _authService = AuthService();
  String? validateFullName(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.contains(RegExp(r'[^a-zA-Z\s]'))) {
      return 'Please enter valid name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(value)) {
      return 'Please enter valid Email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Please enter your valid password';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void togglePasswordVisibility(VoidCallback UpdateUI) {
    // Toggle password visibility
    obscurePassword = !obscurePassword;
    UpdateUI();
  }

  void toggleConfirmPasswordVisibility(VoidCallback UpdateUI) {
    // Toggle confirm password visibility
    obscureConfirmPassword = !obscureConfirmPassword;
    UpdateUI();
  }

  Future<String?> signup(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      final error = await _authService.signUp(email, password);
      if (error == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Signup successful")));
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error)));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill in all fields")));
    }
  }

  void dispose() {
    //dispose the controllers when the widget is disposed
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
