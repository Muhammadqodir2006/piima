// ignore_for_file: prefer_const_constructors, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:piima/extra/topAppBar.dart';

class BizHaqimizdaScreen extends StatefulWidget {
  const BizHaqimizdaScreen({Key? key}) : super(key: key);

  @override
  _BizHaqimizdaScreenState createState() => _BizHaqimizdaScreenState();
}

class _BizHaqimizdaScreenState extends State<BizHaqimizdaScreen> {
  @override
  Widget build(BuildContext context) {
    return TopAppBar(
      appBarText: 'Biz haqimizda',
      anotherChild: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(width: 1, color: Colors.blue.shade700),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 15,
                    ),
                  ]),
              child: Image(
                  image: AssetImage('images/granite_logo.jpg'),
                  width: MediaQuery.of(context).size.width - 40),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Ilova Muhammad al-Xorazmiy nomidagi axborot texnologiyalariga ixtisoslashtirilgan maktab 9-sinf o'quvchisi  Muhammadqodir  Rustamov tomonidan ishlab chiqilgan",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Granite Software mahsuloti",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
