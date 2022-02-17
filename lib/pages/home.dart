// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:chatapp/pages/chat.dart';
import 'package:chatapp/pages/groups.dart';
import 'package:chatapp/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widget/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey,
            ),
            title: Text(
              "user" + users[index],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            subtitle: Text("Hey there"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chatPage(),
                  ));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => searchUserPage()));
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
