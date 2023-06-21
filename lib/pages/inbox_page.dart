import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<String> messages = [
    'Message 1',
    'Message 2',
    'Message 3',
    'Message 4',
    'Message 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(messages[index]),
            onTap: () {
              // Open the message or perform an action
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InboxPage(),
  ));
}
