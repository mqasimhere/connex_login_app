import 'package:flutter/material.dart';
import 'package:intern_training_app/loginScreen.dart';
import 'package:intern_training_app/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intern Training App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => Loginscreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
