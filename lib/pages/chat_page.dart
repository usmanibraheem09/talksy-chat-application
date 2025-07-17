import 'package:chat_application/components/message_bubble.dart';
import 'package:chat_application/components/my_text_field.dart';
import 'package:chat_application/services/auth/auth_methods.dart';
import 'package:chat_application/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String recieverEmail;
  final String recieverID;
  ChatPage({super.key, required this.recieverEmail, required this.recieverID});

  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthMethods _authMethods = AuthMethods();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(recieverID, _messageController.text);
    }
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recieverEmail,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authMethods.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(senderID, recieverID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        return ListView(
          reverse: true,
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: snapshot.data!.docs.reversed
              .map((doc) => _buildMessageItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final currentUserID = _authMethods.getCurrentUser()!.uid;

    final isCurrentUser = data['sender'] == currentUserID;

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: messageBubble(isCurrentUser: isCurrentUser, data: data),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 20, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Mytextfield(
              hintText: 'Type Message',
              controller: _messageController,
              obsecureText: false,
              
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
            icon: Icon(Icons.send, color: Colors.white,), 
            onPressed: sendMessage
            ),
            ),
        ],
      ),
    );
  }
}


