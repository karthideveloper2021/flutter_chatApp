// ignore_for_file: prefer_const_constructors

import 'package:chatapp/widget/widgets.dart';
import 'package:flutter/material.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  List groups = [
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
        itemCount: groups.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(groups[index]),
            onTap: () {},
          );
        },
      ),
    );
  }
}
