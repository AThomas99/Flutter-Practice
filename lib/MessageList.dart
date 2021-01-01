import 'package:flutter/material.dart';
import 'package:practice/screens/MessageDetail.dart';
import 'Message.dart';

// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageList extends StatefulWidget {
  final String title;
  final String status;

  const MessageList({Key key, this.title, this.status = 'important'})
      : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages;

  void fetch() async {
    future = Message.browse(status: widget.status); 
    messages = await future;
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text("Snapshot has Error: ${snapshot.error}");
                var messages = snapshot.data;
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                  ),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    Message message = messages[index];

                  return Slidable(
                      key: ObjectKey(message),
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Archive',
                          color: Colors.blue,
                          icon: Icons.archive,
                          onTap: () {},
                        ),
                        IconSlideAction(
                          caption: 'Share',
                          color: Colors.indigo,
                          icon: Icons.share,
                          onTap: () {},
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'More',
                          color: Colors.black45,
                          icon: Icons.more_horiz,
                          onTap: () {},
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            setState(() {
                              messages.removeAt(index);
                            });
                          },
                        ),
                      ],
                      
                      
                      child: ListTile(
                        leading: CircleAvatar(child: Icon(Icons.ac_unit)),
                        title: Text(message.subject),
                        subtitle: Text(
                          message.body,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        isThreeLine: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MessageDetail(message.subject, message.body),
                            ),
                          );
                        },
                      ),
                    
                  );
                },
              );
            }
            return null;
          }),
    );
  }
}
