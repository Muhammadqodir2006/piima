// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:piima/extra/topAppBar.dart';

class YordamScreen extends StatefulWidget {
  const YordamScreen({Key? key}) : super(key: key);

  @override
  _YordamScreenState createState() => _YordamScreenState();
}

class _YordamScreenState extends State<YordamScreen> {
  @override
  Widget build(BuildContext context) {
    return TopAppBar(
      appBarText: "Yordam",
      anotherChild: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: Text('Yordam sahifasi'),
          )
        ],
      ),
    );
  }
}
