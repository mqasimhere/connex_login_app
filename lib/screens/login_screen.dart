import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controllers for the text fields
  //these controllers will be used to get the text from the text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // this is the key for the form
  //it will be used to validate the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //this function will be used to show a snackbar with a message
  //it will be called when the user clicks the login button
  bool _obscurePassword = true;
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  //this function will be called when the widget is disposed to keep memory clean
  @override
  void dispose() {
    //dispose the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //this is the form widget that will be used to validate the form
    return Form(
      //this is the form widget that will be used to validate the form
      //it will use the _formKey to validate the form
      key: _formKey,
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
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email"),
                    //this is the validation for the email text field
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ).hasMatch(value)) {
                        return 'Please enter valid email';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: _obscurePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          // Toggle password visibility
                          setState(() {
                            // Logic to toggle password visibility
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your valid password';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      //this is the function that will be called when the user clicks the login button
                      //it will get the text from the text fields and show a snackbar with the message
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final email = emailController.text;
                          final password = passwordController.text;

                          showSnackBar("Logged in with email: $email");
                        } else {
                          showSnackBar("Please fill in all fields");
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
