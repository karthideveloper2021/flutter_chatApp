// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, file_names

import 'package:chatapp/services/auth.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/pages/signup.dart';
import 'package:chatapp/widget/widgets.dart';
import 'package:flutter/material.dart';

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  _signInPageState createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  signIn() {
    setState(() {
      loading = true;
    });

    FocusScope.of(context).unfocus();

    authService _service = authService();
    _service
        .signInWithEmailAndPassword(
            _usernameController.text, _passwordController.text)
        .then((value) {
      print(value.toString() + "ohho");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => initiatePage()));
    }).catchError((e) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                    )),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 15.0),
                TextButton(
                  onPressed: signIn,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  child: Text("Sign in"),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 15.0),
                SignInWithGoogle(context),
                SizedBox(height: 50.0),
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signUpPage(),
                        ));
                  },
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        circleProgressindicator(loading, Colors.blue),
      ],
    );
  }
}
