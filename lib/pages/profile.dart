// ignore_for_file: prefer_const_constructors

import 'package:chatapp/services/auth.dart';
import 'package:chatapp/pages/signIn.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  signOut() {
    final authService _service = authService();
    _service.signOut().then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => signInPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: signOut,
        style: TextButton.styleFrom(
            textStyle: TextStyle(
          fontSize: 17.0,
        )),
        child: Text("sign out"),
      ),
    );
  }
}
