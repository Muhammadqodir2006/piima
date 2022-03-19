// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piima/main/drawerScreen.dart';
import 'package:sqflite/sqflite.dart';
import '../main/constants.dart';

// ignore: must_be_immutable
class TopAppBar extends StatefulWidget {
  TopAppBar({
    Key? key,
    required this.appBarText,
    required this.anotherChild,
  }) : super(key: key);

  Widget anotherChild;
  String appBarText;

  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  Color backgroundOfPage = Colors.white;

  bool asd() {
    setState(() {
      xoffset = isDrawerOpen ? 0 : MediaQuery.of(context).size.width * 0.5 + 50;
      yoffset = isDrawerOpen ? 0 : 300;
      scaleFactor = isDrawerOpen ? 1 : 0.6;
      borderRadius = isDrawerOpen ? 0 : 40;
      isDrawerOpen = isDrawerOpen ? false : true;
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => asd(),
      child: Scaffold(
        body: Stack(children: [
          DrawerScreen(),
          SafeArea(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: backgroundOfPage,
              ),
              transform: Matrix4.translationValues(xoffset, yoffset, 0)
                ..scale(scaleFactor),
              curve: Curves.easeInCirc,
              duration: const Duration(milliseconds: 230),
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              isDrawerOpen
                                  ? Icons.arrow_back_ios_new
                                  : Icons.menu_rounded,
                              size: 40,
                            ),
                            iconSize: isDrawerOpen ? 60 : 50,
                            color: Colors.black45,
                            onPressed: () {
                              setState(() {
                                xoffset =
                                    MediaQuery.of(context).size.width * 0.6 +
                                        30;
                                yoffset =
                                    MediaQuery.of(context).size.height * 0.35;
                                scaleFactor = 0.6;
                                isDrawerOpen = true;
                                borderRadius = 40;
                                backgroundOfPage = Colors.white;
                              });
                            },
                          ),
                          Text(
                            widget.appBarText,
                            style: TextStyle(
                              fontSize: 18,
                              color: primaryColor,
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              "images/piima_logo1.jpg",
                            ),
                            backgroundColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Text(''),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: widget.anotherChild,
                ),
                isDrawerOpen
                    ? Scaffold(
                        backgroundColor: Colors.transparent,
                        body: GestureDetector(
                          onTap: () => setState(() {
                            isDrawerOpen = false;
                            yoffset = 0;
                            xoffset = 0;
                            scaleFactor = 1;
                            borderRadius = 0;
                          }),
                        ))
                    : Text(''),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
