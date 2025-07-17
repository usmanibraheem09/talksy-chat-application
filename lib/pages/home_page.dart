import 'package:chat_application/components/my_drawer.dart';
import 'package:chat_application/components/user_tile.dart';
import 'package:chat_application/pages/chat_page.dart';
import 'package:chat_application/services/auth/auth_methods.dart';
import 'package:chat_application/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ChatService _chatService = ChatService();
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Home',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: StreamBuilder(stream: _chatService.getUsersStream(),
       builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColorDark,
                ),
                SizedBox(height: 20),
                Text('Loading users...'),
              ],
            ),
          );
        }
        return ListView(
          children:
            snapshot.data!.map<Widget>((userData)=> _buildUserListItem(userData, context)).toList(),
        );
       }
       ),
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
    if(userData['email']!= _authMethods.getCurrentUser()!.email){
      return UserTile(
      text: userData['email'],
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
          recieverEmail: userData['email'],
          recieverID: userData['uid'],
        ),
        ),
        );
      },
    );
    }else{
      return Container();
    }
  }
}