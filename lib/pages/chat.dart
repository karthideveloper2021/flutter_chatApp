// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:web_socket_channel/status.dart' as status;

class chatPage extends StatefulWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  late IOWebSocketChannel channel;
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    channel = IOWebSocketChannel.connect("ws://10.0.2.2:8000/");
    print('connected to srever');
    listeningServer();
    super.initState();
  }

  listeningServer() {
    channel.stream.listen((message) {
      print(message);
      // channel.sink.close(status.goingAway);
    }, onDone: () => print("Stream closed"));
  }

  backToHome() {
    channel.sink.close();
    Navigator.pop(context);
  }

  sendMessage() {
    if (messageController.text != "") {
      channel.sink.add(messageController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: backToHome,
            ),
            title: Text("name")),
        // body:,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            child: TextFormField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Message",
              ),
            ),
          ),
          Container(
            child: IconButton(
              onPressed: sendMessage,
              icon: Icon(Icons.send),
            ),
          ),
        ]));
  }
}
