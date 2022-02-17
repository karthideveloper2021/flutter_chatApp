// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:chatapp/main.dart';
import 'package:chatapp/pages/home.dart';
import 'package:chatapp/services/databaseFirbase.dart';
import 'package:chatapp/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/services/auth.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  bool loading = false;

  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authService _Authservice = authService();
  final FbDatabaseService _fbDatabase = FbDatabaseService();

  signUpValidation() {
    if (signUpFormKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      FocusScope.of(context).unfocus();

      Map<String, String> userMap = {
        "name": nameController.text,
        "email": emailController.text,
      };

      _Authservice.signUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((value) {
        _fbDatabase.uploadUserDetails(userMap);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => initiatePage()));
      }).catchError((e) {
        setState(() {
          loading = false;
        });
      });
      // try {
      //   _service.signUpWithEmailAndPassword(
      //       emailController.text, passwordController.text);
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => initiatePage()));
      // } catch (e) {
      //   setState(() {
      //     loading = false;
      //   });
      // }
    }
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
                Form(
                  key: signUpFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          return value!.isEmpty
                              ? "Field should not be empty"
                              : null;
                        },
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 17.0,
                          ),
                          label: Text(
                            "Name",
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!)
                              ? null
                              : "Enter valid email";
                        },
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 17.0,
                          ),
                          label: Text(
                            "Email",
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          return value!.isEmpty || value.length < 8
                              ? "Password minimum length is 8"
                              : null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 17.0,
                          ),
                          label: Text(
                            "password",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: signUpValidation,
                  style: TextButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width, 45.0),
                      textStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  child: Text("Sign up"),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 10.0),
                SignInWithGoogle(context),
              ],
            ),
          ),
        ),
        circleProgressindicator(loading, Colors.red),
      ],
    );
  }
}
