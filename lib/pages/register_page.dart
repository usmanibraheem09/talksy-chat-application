import 'package:chat_application/pages/home_page.dart';
import 'package:chat_application/services/auth/auth_methods.dart';
import 'package:chat_application/components/my_button.dart';
import 'package:chat_application/components/my_text_field.dart';
import 'package:chat_application/services/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:chat_application/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Registration Page',
          style: TextStyle(color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                  child: Mytextfield(
                    hintText: 'Enter Your Email',
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                  child: Mytextfield(
                    hintText: 'Enter Your Password',
                    controller: passwordController,
                    obsecureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                  child: Mytextfield(
                    hintText: 'Confirm Your Password',
                    controller: confirmPasswordController,
                    obsecureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value != passwordController.text) {
                        return 'Password does not match';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Mybutton(
                    btnText: 'Register',
                    fontSize: 18,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (passwordController.text.length >= 8 && passwordController.text == confirmPasswordController.text) {
                          AuthMethods().signUp(
                                emailController.text,
                                passwordController.text,
                              ).then((value) {
                                Utils().showToast('User Registered Successfully');
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                              })
                              .onError((error, StackTrace) {
                                Utils().showToast(error.toString());
                              });
                        }else if(passwordController.text.length < 8){
                          Utils().showToast('Passwords must be at least 8 characters long');
                        }else{
                          Utils().showToast('Passwords do not match');
                        }
                      }
                    },
                    btnHeight: 55,
                  ),
                ),

                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Login Now',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
