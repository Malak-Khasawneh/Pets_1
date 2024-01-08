
import 'package:flutter/material.dart';

mainText(String title) {
  return Text(title,
     style: TextStyle(color: Color(0xff3A4D39),fontWeight: FontWeight.bold, fontSize: 25),)
  ;
}
secondaryText(String title) {
  return Text(title,
    style: TextStyle(color: Color(0xff739072),fontSize: 15),)
  ;
}
subText(String title) {
  return Text(title,
    style: TextStyle(color: Colors.black54,fontSize: 15),)
  ;
}

beigeText(String title, double size) {
  return Text(title,
    style: TextStyle(color: Color(0xffF0ECE5),fontSize: size,),)
  ;
}

secondaryBold(String title) {
  return Text(title,
    style: TextStyle(color: Color(0xff739072),fontSize: 20,fontWeight: FontWeight.bold),)
  ;
}