import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pets_1/Models/Text.dart';

import '../Models/Button.dart';

class Rate extends StatefulWidget {
   Rate({super.key});

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Column(
        children: [
          Container(width: double.infinity,
              height: 300.0,
              child: Image.asset('assets/Images/Capture.PNG')
          ),
          SizedBox(height: 80,),
          Text('Your opinion matters to us!',style: TextStyle(color:Color(0xff3A4D39),fontWeight: FontWeight.bold,fontSize: 25),),
          SizedBox(height: 10,),
          subText('We work super hard to serve you better and would \n love to know how would you rate our app?'),
          SizedBox(height: 10,),
          Center(
            child: RatingBar.builder(
                initialRating:0 ,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding:EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context,_)=>Icon(Icons.star, color: Color(0xff739072),),
                onRatingUpdate: (rating){}),
          ),
          SizedBox(height: 80,),
        ElevatedButton(
        style: buttonPrimary,
        onPressed: () {},

        child: Text(
        'Submit', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w700),textAlign: TextAlign.center,
    ),
    ),
      ],),
      
    );
  }
}
