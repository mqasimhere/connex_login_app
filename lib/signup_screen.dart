import 'package:flutter/material.dart';
import 'package:intern_training_app/loginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //controllers for the text fields
  //these controllers will be used to get the text from the text fields
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //this function will be used to show a snackbar with a message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  //this function will be called when the widget is disposed to keep memory clean
  @override
  void dispose() {
    //dispose the controllers when the widget is disposed
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("connex Signup", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 102, 100, 100),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlutterLogo(size: 80),
                SizedBox(height: 20),
                TextField(
                  controller: fullnameController,
                  //controller for the fullname text field
                  decoration: InputDecoration(labelText: "Full Name"),
                ),
                SizedBox(height: 20),
                TextField(
                  //controller for the email text field
                  //this controller will be used to get the text from the text field
                  controller: emailController,

                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  //controller for the password text field
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  //controller for the confirm password text field
                  controller: confirmPasswordController,
                  decoration: InputDecoration(labelText: "Confirm Password"),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //this is the function that will be called when the user clicks the signup button
                      //it will get the text from the text fields and show a snackbar with the message
                      final fullName = fullnameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;
                      final confirmPassword = confirmPasswordController.text;

                      if (fullName.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty ||
                          confirmPassword.isEmpty) {
                        showSnackBar("please fill in all fields");
                      } else if (password != confirmPassword) {
                        showSnackBar("passwords do not match");
                      } else {
                        showSnackBar(
                          "Signed up as $fullName with email $email",
                        );
                      }
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 71, 68, 68),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to the login screen
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
