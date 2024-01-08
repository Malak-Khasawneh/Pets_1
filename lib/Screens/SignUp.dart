import 'package:flutter/material.dart';
import 'package:pets_1/Screens/authentication.dart';
import '../Models/Button.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
    SignUp({super.key});

  @override
  State<SignUp> createState() => _CreateState();
}

class _CreateState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column( crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.0,),
              Center(
                  child: Text('Create your Account',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),)),
              SizedBox(height: 20.0),
              SizedBox(height:350, width: 310,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                    SizedBox(height:20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                        SizedBox(height:20),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(hintText: 'Password'),
                      obscureText: true,
                    ),
                        SizedBox(height:20),
                    TextField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(hintText: 'Confirm Password'),
                      obscureText: true,
                    ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () async {
                  // Check if passwords match
                  if (passwordController.text == confirmPasswordController.text) {
                    await AuthService().registerUser(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                    );
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Passwords do not match. Please try again.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  'Sign Up', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w700),textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
                  TextButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  LogIn()));
                  }, child: Text('Log In',style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14,decoration: TextDecoration.underline)))


                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}
