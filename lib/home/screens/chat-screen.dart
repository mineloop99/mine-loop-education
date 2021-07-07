import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('/chats/0N1Xde8AIx916b1kOUBL/messages')
                    .snapshots(),
                builder: (ctx, streamSnapShot) {
                  if (streamSnapShot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());

                  final documents = streamSnapShot.data.docs;
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(documents[index]['text']),
                    ),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('/chats/0N1Xde8AIx916b1kOUBL/messages')
                      .add({'text': 'This was added by clickingbutton'});
                },
              ),
            ),
    );
  }
}
