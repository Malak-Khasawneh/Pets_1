import 'package:flutter/material.dart';
import '../Models/Button.dart';
import 'SignUp.dart';
import '../Models/Text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height:180),
                  Image.asset('assets/Images/Splash Screen.png',width:250 ,height:230 ),
                  mainText('Care Crew',),
                  SizedBox(height: 90,),
                  secondaryText('Welcome!'),
                  Text('Our place is the place \nwhere pets care meets expertise!', style: TextStyle(fontSize: 19),),
                  SizedBox(height:80),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SignUp()));
                    },
                    child: Text(
                      'Get started', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w700),textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
