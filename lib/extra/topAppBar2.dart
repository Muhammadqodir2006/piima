// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'maktab_hqaida_Page.dart';

class topAppBar2 extends StatefulWidget {
  topAppBar2(
      {Key? key,
      required this.appBarText,
      required this.bottomPart,
      required this.maktab_haqida,
      required this.childWidget})
      : super(key: key);

  Widget childWidget;
  String appBarText;
  Widget bottomPart;
  String maktab_haqida;
  @override
  _topAppBar2State createState() => _topAppBar2State();
}

class _topAppBar2State extends State<topAppBar2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(30, 79, 149, 1),
        title: Text(widget.appBarText),
      ),
      body: Stack(
        children: [
          widget.childWidget,
          widget.bottomPart,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15)),
                child: FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return maktabHaqidaPage(haqidaText: widget.maktab_haqida);
                    }));
                  },
                  child: const Center(
                    child: Text(
                      "Maktab haqida",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
