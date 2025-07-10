import "package:flutter/material.dart";

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  //controllers for the text fields
  //these controllers will be used to get the text from the text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //this function will be used to show a snackbar with a message
  //it will be called when the user clicks the login button
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
    return Scaffold(
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
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "password"),
                ),

                SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    //this is the function that will be called when the user clicks the login button
                    //it will get the text from the text fields and show a snackbar with the message
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      if (email.isEmpty || password.isEmpty) {
                        showSnackBar("Please fill in all fields");
                      } else {
                        showSnackBar("logged in as $email");
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 71, 68, 68),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
