import 'package:flutter/material.dart';
import 'package:pets_1/Screens/authentication.dart';

import '../Models/Button.dart';
import 'Forgot.dart';
import 'package:pets_1/Models/NavBar.dart';
import 'SignUp.dart';

class LogIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.0,
              ),
              Center(
                  child: Text(
                'Log in to your Account',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              )),
              SizedBox(height: 20.0),
              SizedBox(
                height: 350,
                width: 310,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                          obscureText: true,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forgot()),
                              );
                            },
                            child: Text(
                              'Forgot password?',
                              textAlign: TextAlign.right,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  NavBar()),);


                  // await AuthService().signInUser(
                  //   emailController.text,
                  //   passwordController.text,
                  // );
                  // if (AuthService().authStateChanges != null) {
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => NavBar()),
                  //   );
                  // }
                  // ;
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
