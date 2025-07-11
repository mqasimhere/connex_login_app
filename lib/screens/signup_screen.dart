import 'package:flutter/material.dart';
import 'package:intern_training_app/screens/login_screen.dart';

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
  // this is the key for the form
  //it will be used to validate the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
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
    return Form(
      //this is the form widget that will be used to validate the form
      //it will use the _formKey to validate the form
      key: _formKey,

      //it is used to validate the form automatically when the user interacts with the form
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Connex Signup", style: TextStyle(color: Colors.white)),
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
                  TextFormField(
                    controller: fullnameController,
                    //controller for the fullname text field
                    decoration: InputDecoration(labelText: "Full Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //controller for the email text field
                    //this controller will be used to get the text from the text field
                    controller: emailController,

                    decoration: InputDecoration(labelText: "Email"),
                    //validation for the email text field
                    validator: (value) =>
                        (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value))
                        ? 'please enter valid email'
                        : null,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    //controller for the password text field
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty || value.length < 6)
                        ? 'please enter valid password'
                        : null,
                  ),

                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    //controller for the confirm password text field
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //this is the function that will be called when the user clicks the signup button
                        //it will get the text from the text fields and show a snackbar with the message
                        if (_formKey.currentState!.validate()) {
                          final fullname = fullnameController.text;
                          final email = emailController.text;
                          final password = passwordController.text;
                          final confirmPassword =
                              confirmPasswordController.text;

                          if (password == confirmPassword) {
                            showSnackBar("Signed up with email: $email");
                          } else {
                            showSnackBar("Passwords do not match");
                          }
                        } else {
                          showSnackBar("Please fill in all fields");
                        }
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
      ),
    );
  }
}
