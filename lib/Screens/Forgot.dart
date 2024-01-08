import 'package:flutter/material.dart';
import '../Models/Button.dart';
import 'Login.dart';


class Forgot extends StatelessWidget {
  const Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.0,),
              Center(
                  child: Column(
                    children: [
                      Text('Forgot your password?',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),
                      SizedBox(height:10.0),
                      Text('Enter email associated with your account \n and we’ll send and email with instructions to \n reset your password'),
                    ],
                  )
              ),
              SizedBox(height: 20.0),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller:TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:60),
              Center(
                child: ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  LogIn()));
                  },
                  child: Text(
                    'Confirm New Password', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w700),textAlign: TextAlign.center,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
