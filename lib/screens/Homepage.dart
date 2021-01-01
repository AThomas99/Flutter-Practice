import 'package:flutter/material.dart';
import 'package:practice/MessageList.dart';
import 'package:practice/Widgets/Drawer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(        
        appBar: AppBar(
            title: Text('Email Application'),
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  // Set state to handle refresh from the data change.
                  // setState(() {
                  //   future = Message.browse();
                  // });
                })
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(child: Text('Important'),),
                Tab(child: Text('Others'),),
              ],
            ),
          ),
          drawer: MessageDrawer(),
          body: TabBarView(children: [
            MessageList(status: 'important',),      
            MessageList(status: 'other',)      
          ],),
      ),
    );
  }
}