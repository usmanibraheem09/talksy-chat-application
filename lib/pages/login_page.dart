import 'package:chat_application/components/my_button.dart';
import 'package:chat_application/components/my_text_field.dart';
import 'package:chat_application/pages/home_page.dart';
import 'package:chat_application/services/auth/auth_methods.dart';
import 'package:chat_application/services/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:chat_application/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 10),
            Text("Welcome Back... You've been missed!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
            ),
            SizedBox(height: 10),
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
            child: Mytextfield(
              hintText: 'Enter Your Email',
              controller: emailController,
            ),
            ),
            SizedBox(height: 10),
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
            child: Mytextfield(
              hintText: 'Enter Your Password',
              controller: passwordController,
              obsecureText: true,
            ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Mybutton(
                btnText: 'Login',
                fontSize: 18,
                onTap: (){
                  setState(() {
                    isLoading = true;
                  });
                  if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                    AuthMethods().signIn(emailController.text, passwordController.text).then((value){
                      Utils().showToast('User Logged in Successfully');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      setState(() {
                      isLoading = false;
                    });
                    }).onError((error, StackTrace){
                      Utils().showToast(error.toString());
                    setState(() {
                      isLoading = false;
                    });
                    });
                  }
                },
                isLoading: isLoading,
                btnHeight: 55,
                ),
            ),

            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not registered yet?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
                ),
                TextButton(
                  child: Text(
                    'Register Now',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                  },
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}