import "package:flutter/material.dart";
import "package:intern_training_app/view_models/login_view_model.dart";

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //login view model instance
  final loginViewModel = LoginViewModel();
  //dispose the view model when the widget is disposed
  @override
  void dispose() {
    loginViewModel.dispose();
    super.dispose();
  }

  //this function will be called when the widget is disposed to keep memory clean

  @override
  Widget build(BuildContext context) {
    //this is the form widget that will be used to validate the form
    return Form(
      //it will use the formKey to validate the form
      key: loginViewModel.formKey,
      //it is used to validate the form automatically when the user interacts with the form
      //it will show validation errors immediately when the user interacts with the form
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        //this is the app bar
        appBar: AppBar(
          title: Text(
            "Connex Login Screen Demo",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 102, 100, 100),
        ),
        //this is the body of the screen
        body: Center(
          //this is the center widget that will contain the login form
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                //this is the column that will contain the login form
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterLogo(size: 80),
                  SizedBox(height: 10.0),
                  TextFormField(
                    //controller for the email text field
                    controller: loginViewModel.emailController,
                    decoration: InputDecoration(labelText: "Email"),
                    //this is the validation for the email text field
                    validator: loginViewModel.validateEmail,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    //password visiblity
                    obscureText: loginViewModel.obscurePassword,
                    //controller for the password text field
                    controller: loginViewModel.passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginViewModel.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          // Toggle password visibility
                          loginViewModel.togglePasswordVisibility(() {
                            setState(() {}); // Update the UI
                          });
                        },
                      ),
                    ),
                    //this is the validation for the password text field
                    validator: loginViewModel.validatePassword,
                  ),

                  SizedBox(height: 10.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      //this is the function that will be called when the user clicks the login button
                      onPressed: () async {
                        final errorMessage = await loginViewModel.login();
                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(errorMessage)));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 71, 68, 68),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          // Navigate to the signup screen
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: Text("Sign Up"),
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
