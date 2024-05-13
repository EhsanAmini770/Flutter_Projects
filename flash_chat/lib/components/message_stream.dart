import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_starting_project/components/message_bubble.dart';
import 'package:flash_chat_starting_project/services/auth_service.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
    required FirebaseFirestore fireStore,
  }) : _fireStore = fireStore;

  final FirebaseFirestore _fireStore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fireStore.collection('messages').orderBy('date' , descending: false).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlue,
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          final messages = snapshot.data?.docs;
          List<Widget> messageWidgets = [];
          for (var message in messages!) {
            final messageText = message['text'];
            final messageSender = message['sender'];
            Widget messageWidget = MessageBubble(
              messageText: messageText,
              messageSender: messageSender,
              isMe: AuthService().currentUser!.email == messageSender,
            );
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: messageWidgets,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('Loading...'),
          );
        }
      },
    );
  }
}