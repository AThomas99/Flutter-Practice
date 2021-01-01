import 'package:flutter/material.dart';
import 'package:practice/Message.dart';
import 'package:practice/screens/MessageCompose.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages;

  ComposeButton(this.messages);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MessageCompose(),
          ),
        );

        if (message != null) {
          messages.add(message);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Your text has been sent."),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          print('Message not sent');
        }
      },
    );
  }
}
