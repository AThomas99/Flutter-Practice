import 'package:flutter/material.dart';

class MessageDrawer extends StatefulWidget {
  @override
  _MessageDrawerState createState() => _MessageDrawerState();
}

class _MessageDrawerState extends State<MessageDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Allan Thomas'),
            accountEmail: Text('allanthomas@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('AT'),
            ),
            otherAccountsPictures: [
              CircleAvatar(child: Icon(Icons.add)),
            ],
          ),
          ListTile(
            leading: Icon(Icons.inbox),
            title: Text('Inbox'),
            trailing: Chip(
              label: Text( 
                '19',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue[100],
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text('Draft'),
          ),
          ListTile(
            leading: Icon(Icons.send),
            title: Text('Sent'),
          ),
          ListTile(
            leading: Icon(Icons.takeout_dining),
            title: Text('Trash'),
          ),
          Divider(),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          )),
        ],
      ),
    );
  }
}
