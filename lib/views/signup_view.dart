import 'package:flutter/material.dart';
//import 'package:intern_training_app/views/login_view.dart';
import 'package:intern_training_app/view_models/signup_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final signupViewModel = SignupViewModel();
  @override
  void dispose() {
    //dispose the view model when the widget is disposed
    signupViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //this is the form widget that will be used to validate the form
      //it will use the _formKey to validate the form
      key: signupViewModel.formKey,

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
                    controller: signupViewModel.fullNameController,
                    //controller for the fullname text field
                    decoration: InputDecoration(labelText: "Full Name"),
                    validator: signupViewModel.validateFullName,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //controller for the email text field
                    //this controller will be used to get the text from the text field
                    controller: signupViewModel.emailController,

                    decoration: InputDecoration(labelText: "Email"),
                    //validation for the email text field
                    validator: signupViewModel.validateEmail,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    //controller for the password text field
                    controller: signupViewModel.passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          signupViewModel.togglePasswordVisibility(() {
                            setState(() {}); // Update the UI
                          });
                        },
                        icon: Icon(
                          signupViewModel.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: signupViewModel.validatePassword,
                  ),

                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    //controller for the confirm password text field
                    controller: signupViewModel.confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          signupViewModel.toggleConfirmPasswordVisibility(() {
                            setState(() {}); // Update the UI
                          });
                        },
                        icon: Icon(
                          signupViewModel.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: signupViewModel.validateConfirmPassword,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final signuperror = await signupViewModel.signup(
                          context,
                        );
                        if (signuperror == null) {
                          Navigator.pushReplacementNamed(context, '/login');
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(signuperror)));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 71, 68, 68),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
