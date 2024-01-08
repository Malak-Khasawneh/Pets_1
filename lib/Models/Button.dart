import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(310, 54),
  primary: Color(0xff3A4D39),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);

final ButtonStyle buttonSecondary = ElevatedButton.styleFrom(
  minimumSize: Size(280, 54),
  primary: Color(0xff4F6F52),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
  ),
);

final ButtonStyle ThirdButton = ElevatedButton.styleFrom(
  minimumSize: Size(170, double.infinity),
  primary: Color(0xff4F6F52),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
  ),
);
