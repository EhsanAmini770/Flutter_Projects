import 'package:flash_chat_starting_project/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageText, messageSender;
  final isMe;

  const MessageBubble(
      {super.key,
      required this.isMe,
      required this.messageText,
      required this.messageSender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isMe! ? Alignment.centerRight : Alignment.centerLeft,
        child: Material(
          borderRadius: BorderRadius.only(
            topLeft:
                isMe! ? const Radius.circular(20) : const Radius.circular(0),
            topRight:
                isMe! ? const Radius.circular(0) : const Radius.circular(20),
            bottomRight: const Radius.circular(20),
            bottomLeft: const Radius.circular(20),
          ),
          color: isMe! ? kSendButtonColor : kSenderBoxColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment:
                  isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !isMe!,
                  child: Text(messageSender.split('@').first,
                      style: const TextStyle(
                          fontSize: 10, color: kChatEmailColor)),
                ),
                Text(messageText,
                    style: const TextStyle(fontSize: 16, color: kWhiteColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
