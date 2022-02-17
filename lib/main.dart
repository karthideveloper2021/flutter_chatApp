// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, camel_case_types

import 'package:chatapp/pages/home.dart';
import 'package:chatapp/pages/groups.dart';
import 'package:chatapp/pages/profile.dart';
import 'package:chatapp/pages/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(chatApp());
}

class chatApp extends StatelessWidget {
  const chatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my first app made in flutter",
      home: authenticationCheck(),
    );
  }
}

class authenticationCheck extends StatefulWidget {
  const authenticationCheck({Key? key}) : super(key: key);

  @override
  _authenticationCheckState createState() => _authenticationCheckState();
}

class _authenticationCheckState extends State<authenticationCheck> {
  @override
  Widget build(BuildContext context) {
    return (FirebaseAuth.instance.currentUser != null)
        ? initiatePage()
        : signInPage();
  }
}

class initiatePage extends StatefulWidget {
  const initiatePage({Key? key}) : super(key: key);

  @override
  _initiatePageState createState() => _initiatePageState();
}

class _initiatePageState extends State<initiatePage> {
  int _pageIndexValue = 0;
  final List<Widget> pages = [
    HomePage(),
    PeoplePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("WE CHAT"),
        ),
        body: pages[_pageIndexValue],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Groups",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: "Profile",
            )
          ],
          currentIndex: _pageIndexValue,
          onTap: (int indexPage) {
            setState(() {
              _pageIndexValue = indexPage;
            });
          },
        ));
  }
}
