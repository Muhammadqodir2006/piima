// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, must_be_immutable, deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';
import 'package:piima/screens/homeScreen.dart';

//////////////////////////////////////////////////////////////////////////////

//Color primaryColor = Color.fromRGBO(64, 113, 186, 1);
Color primaryColor = Colors.blue.shade700;
Color whiteColor = Colors.white;

double containerwidth = 280;

List<Color> Gradient = <Color>[
  Color.fromRGBO(90, 154, 255, 0.7),
  Color.fromRGBO(117, 140, 200, 0.7),
  Color.fromRGBO(126, 67, 149, 0.7),
  Color.fromRGBO(182, 103, 109, 0.7),
  Color.fromRGBO(230, 178, 173, 0.7),
  Color.fromRGBO(114, 178, 199, 0.7),
  Color.fromRGBO(255, 190, 250, 0.7),
];
List<Color> Gradient2 = <Color>[
  Color.fromRGBO(250, 122, 142, 1),
  Color.fromRGBO(210, 170, 220, 1),
  Color.fromRGBO(150, 130, 193, 1),
  // Color.fromRGBO(218, 193, 236, 1),
  //Color.fromRGBO(258, 191, 240, 1),
  Color.fromRGBO(212, 215, 196, 0.6),
  Color.fromRGBO(164, 207, 254, 1),
];
List<Color> Gradient1 = <Color>[
//  Color.fromRGBO(44, 33, 75, 1),
  Color.fromRGBO(17, 16, 100, 1),
  Color.fromRGBO(17, 16, 115, 0.95),
  Color.fromRGBO(17, 16, 130, 0.9),
  Color.fromRGBO(17, 16, 130, 0.75),
  Color.fromRGBO(17, 16, 130, 0.6),

  Color.fromRGBO(17, 16, 130, 0.5),
  Colors.indigo.shade700.withOpacity(0.6),
  Colors.blue.shade800.withOpacity(0.7),
  //Colors.indigo.shade400,
  Colors.blue.shade700.withOpacity(0.7),
  //Color.fromRGBO(185, 147, 237, 0.7),
  //Color.fromRGBO(190, 152, 182, 1),
  //Color.fromRGBO(150, 130, 193, 1),
];

//Color.fromRGBO(150, 170, 220, 1),
//Color.fromRGBO(150, 188, 253, 1),
//Color.fromRGBO(117, 140, 200, 1),
//Color.fromRGBO(85, 6, 34, 1),
//Color.fromRGBO(153, 57, 118, 1),
////Color.fromRGBO(182, 103, 109, 0.7),
//Color.fromRGBO(210, 152, 152, 0.7),
// Color.fromRGBO(27, 48, 69, 1),
//Colors.blueAccent,
//double containerHeight = MediaQuery.of(context).size.height;

bool isDrawerOpen = false;

double yoffset = 0;
double xoffset = 0;
double scaleFactor = 1;
double borderRadius = 0;

Widget currentScreen = HomeScreen();

bool check = false;

// har bir bo'limdagi qo'yilgan rasmlar uchun umumiy shablon
//Bo'limlar

