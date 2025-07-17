import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String recieverID;
  final String message;
  final Timestamp timeStamp;

  Message({
    required this.senderID,
    required this.recieverID,
    required this.senderEmail,
    required this.message,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap(){
    return {
      'sender': senderID,
      'reciever': recieverID,
      'senderEmail': senderEmail,
      'message': message,
      'timeStamp': timeStamp,
    };
  }
}