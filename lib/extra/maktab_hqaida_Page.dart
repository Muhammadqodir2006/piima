// ignore_for_file: file_names, camel_case_types, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class maktabHaqidaPage extends StatefulWidget {
  maktabHaqidaPage({Key? key, required this.haqidaText}) : super(key: key);

  String haqidaText;
  @override
  _maktabHaqidaPageState createState() => _maktabHaqidaPageState();
}

class _maktabHaqidaPageState extends State<maktabHaqidaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(30, 79, 149, 1),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              widget.haqidaText,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
