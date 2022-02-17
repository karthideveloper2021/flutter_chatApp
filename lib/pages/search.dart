// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/services/databaseFirbase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class searchUserPage extends StatefulWidget {
  const searchUserPage({Key? key}) : super(key: key);

  @override
  _searchUserPageState createState() => _searchUserPageState();
}

class _searchUserPageState extends State<searchUserPage> {
  FbDatabaseService _Fbdatabase = FbDatabaseService();
  TextEditingController searchController = TextEditingController();

  QuerySnapshot? searchResultSnapshot;
  bool loading = false;
  final _searchKey = GlobalKey<FormState>();

  searchUser() {
    if (_searchKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _Fbdatabase.getUserDetails(searchController.text).then((snapshot) {
        setState(() {
          searchResultSnapshot = snapshot;
          loading = false;
        });
        // print(searchResultSnapshot!.docs.length);
      });
    } else {
      setState(() {
        searchResultSnapshot = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: _searchKey,
                    child: TextFormField(
                      validator: (value) {
                        return (value!.isEmpty) ? "Enter user name" : null;
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: searchUser,
                  icon: Icon(Icons.search),
                )
              ],
            ),
          ),
          Expanded(
            child: loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (searchResultSnapshot != null)
                    ? (searchResultSnapshot!.docs.isNotEmpty)
                        ? ListView.builder(
                            itemCount: searchResultSnapshot!.docs.length,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                title: Text(searchResultSnapshot!.docs[index]
                                    .get('name')),
                                subtitle: Text(searchResultSnapshot!.docs[index]
                                    .get('email')),
                                trailing: TextButton(
                                  onPressed: () {},
                                  child: Text("message"),
                                ),
                              );
                            }))
                        : Container(
                            padding: EdgeInsets.all(10.0),
                            alignment: Alignment.topLeft,
                            child: Text("Oops..user not found"))
                    : Container(),
          )
        ],
      ),
    );
  }
}
