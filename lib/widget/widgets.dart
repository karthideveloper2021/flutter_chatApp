// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, duplicate_ignore, non_constant_identifier_names

import 'package:chatapp/pages/home.dart';
import 'package:chatapp/pages/groups.dart';
import 'package:flutter/material.dart';

Widget listNames(BuildContext context, String name) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    color: Color.fromARGB(82, 175, 171, 159),
    child: Row(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 255, 0, 64),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    ]),
  );
}

Widget SignInWithGoogle(context) {
  return OutlinedButton(
    style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        primary: Colors.black,
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        textStyle: TextStyle(
          fontSize: 18.0,
        )),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icon/google-logo.png",
          height: 20,
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Sign In with google"),
        ),
      ],
    ),
  );
}

Widget circleProgressindicator(bool loading,Color colors) {
  return (loading)
      ? Scaffold(
          backgroundColor: Color.fromARGB(139, 0, 0, 0),
          body: Center(
            child: CircularProgressIndicator(
              color: colors,
            ),
          ),
        )
      : Container();
}
