// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class iq extends StatefulWidget {
  const iq({Key? key}) : super(key: key);

  @override
  _iqState createState() => _iqState();
}

class _iqState extends State<iq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("IQ savollari"),
      ),
    );
  }
}
