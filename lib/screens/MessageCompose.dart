import 'package:flutter/material.dart';
import 'package:practice/Message.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = "";
  String body = "";



  final key = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Compose New Message'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: TextFormField(
                    validator: (value) {
                      if (!value.contains('@')) {
                        return "`To` must be valid email";
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      to = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'To',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    validator: (value) {
                      int len = value.length;
                      if (len == 0) {
                        return "`SUBJECT` cannot be empty";
                      } else if (len < 4) {
                        return "`SUBJECT` must be longer than 4 characters";
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      subject = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Subject',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  title: TextFormField(
                    onSaved: (value) {
                      body = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Message',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    maxLines: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: RaisedButton(
                    child: Text('SEND'),
                    onPressed: () {
                      // Check if the current state of the form is validated b4 submit
                      if (this.key.currentState.validate()) {
                        // Save the current state of the form stored in a GlobalKey
                        this.key.currentState.save();
                        
                        Message message = Message(subject, body);
                        Navigator.pop(context, message);
                        
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
