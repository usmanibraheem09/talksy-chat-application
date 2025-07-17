import 'package:flutter/material.dart';

class messageBubble extends StatelessWidget {
  const messageBubble({
    super.key,
    required this.isCurrentUser,
    required this.data,
  });

  final bool isCurrentUser;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      constraints: BoxConstraints(maxWidth: 250),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blue[300] : Colors.grey[500],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: isCurrentUser
              ? Radius.circular(12)
              : Radius.circular(0),
          bottomRight: isCurrentUser
              ? Radius.circular(0)
              : Radius.circular(12),
        ),
      ),
      child: Text(data['message'], style: TextStyle(fontSize: 16)),
    );
  }
}