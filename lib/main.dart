import 'package:flutter/material.dart';
import 'package:intern_training_app/views/login_view.dart';
import 'package:intern_training_app/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //firebase initialization
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const MyApp());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intern Training App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/signup': (context) => SignupView(),
      },
    );
  }
}
