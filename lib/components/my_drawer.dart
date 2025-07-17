import 'package:chat_application/pages/home_page.dart';
import 'package:chat_application/pages/login_page.dart';
import 'package:chat_application/pages/settings_page.dart';
import 'package:chat_application/services/auth/auth_methods.dart';
import 'package:chat_application/services/utils/utils.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/drawerImg.png', 
                  height: 90,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Talksy',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            contentPadding: EdgeInsets.only(left: 30),
            leading: Icon(Icons.home,
            color: Theme.of(context).colorScheme.primary,
            ),
            title: Text('H O M E',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          ListTile(
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage())); 
            }, 
            contentPadding: EdgeInsets.only(left: 30),
            leading: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.primary,
            ),
            title: Text('S E T T I N G S',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          ListTile(
            onTap: (){
              AuthMethods().signOut().then((value){
                Utils().showToast('User Logged Out Successfully');
              });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            contentPadding: EdgeInsets.only(left: 30),
            leading: Icon(Icons.logout,
            color: Theme.of(context).colorScheme.primary,
            ),
            title: Text('L O G O U T',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
