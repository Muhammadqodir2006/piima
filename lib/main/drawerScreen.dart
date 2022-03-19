// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use, file_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piima/screens/bizHaqimizdaScreen.dart';
import 'package:piima/screens/homeScreen.dart';
import 'package:piima/screens/statsScreen.dart';
import 'package:piima/screens/saralanganScreen.dart';
import 'package:piima/screens/yordamScreen.dart';
import 'package:piima/stats/Stats.dart';
import 'constants.dart' as a;

import 'constants.dart';

void SetState() {
  isDrawerOpen = false;
  yoffset = 0;
  xoffset = 0;
  scaleFactor = 1;
  borderRadius = 0;
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: a.Gradient1
            /* [
            Color.fromRGBO(166, 192, 254, 1),
            Color.fromRGBO(246, 128, 132, 1),
          ],*/
            ),
      ),

      /*[
        Color.fromRGBO(65, 88, 208, 1),
        Color.fromRGBO(200, 80, 192, 1),
        Color.fromRGBO(255, 204, 112, 1),
      ]*/
      /*[
            Color.fromRGBO(9, 17, 95, 1),
            Color.fromRGBO(44, 12, 66, 0.6),
            Color.fromRGBO(80, 8, 38, 0.6),
            Color.fromRGBO(119, 2, 6, 0.69),
          ], */

      // begin: Alignment.topCenter,
      //end: Alignment.bottomCenter)),
      child: ListView(
        children: [
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, boxShadow: const [
                  BoxShadow(
                      blurRadius: 40,
                      spreadRadius: 7,
                      blurStyle: BlurStyle.solid,
                      color: Colors.blueAccent)
                ]),
                child: CircleAvatar(
                  radius: a.isDrawerOpen ? 95 : 0,
                  backgroundImage: AssetImage('images/piima_logo.jpg'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          listTileObject(
            title: 'Bosh sahifa',
            icon: Icon(
              Icons.home,
              color: whiteColor,
            ),
            navigation: HomeScreen(),
          ),
          listTileObject(
            title: 'Statistika',
            icon: Icon(
              CupertinoIcons.chart_bar_circle,
              color: whiteColor,
            ),
            navigation: HomeScreen(),
          ),
          listTileObject(
            title: 'Saralangan',
            icon: Icon(
              Icons.favorite_border_rounded,
              color: whiteColor,
            ),
            navigation: SaralanganScreen(),
          ),
          listTileObject(
            title: 'Biz haqimizda',
            icon: Icon(
              Icons.group,
              color: whiteColor,
            ),
            navigation: BizHaqimizdaScreen(),
          ),
          listTileObject(
            title: "Yordam",
            icon: Icon(
              Icons.help_outline_rounded,
              color: whiteColor,
            ),
            navigation: YordamScreen(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 680,
          ),
          Padding(
            padding:
                EdgeInsets.only(right: deviceWidth * 0.5, left: 10, bottom: 10),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: RaisedButton(
                  elevation: 6,
                  color: Colors.red.shade800,
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    exitDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(
                      5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'CHIQISH',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> exitDialog(BuildContext context) {
    return showDialog(
        barrierColor: Colors.black87,
        context: context,
        builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: Text(
                'Ilovadan chiqishni xohlaysizmi ? ',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        animationDuration: Duration(milliseconds: 100),
                        primary: Color.fromRGBO(157, 157, 157, 1)),
                    child: Text('Bekor qilish')),
                ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        animationDuration: Duration(milliseconds: 100),
                        primary: Color.fromRGBO(255, 0, 0, 1)),
                    child: Text('Ha')),
              ],
            ));
  }
}

// ignore: camel_case_types
class listTileObject extends StatefulWidget {
  listTileObject(
      {Key? key,
      required this.title,
      required this.icon,
      required this.navigation})
      : super(key: key);
  String title;
  Icon icon;
  Widget navigation;

  @override
  _listTileObjectState createState() => _listTileObjectState();
}

// ignore: camel_case_types
class _listTileObjectState extends State<listTileObject> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 5, 0, 0),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 0.5,
        child: RaisedButton(
          splashColor: Colors.black45,
          color: Colors.transparent,
          highlightElevation: 50,
          animationDuration: Duration(milliseconds: 50),
          padding: EdgeInsets.all(11),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            setState(() {
              isDrawerOpen = false;
              yoffset = 0;
              xoffset = 0;
              scaleFactor = 1;
              borderRadius = 0;
            });
            if (widget.title != 'Statistika') {
              Navigator.of(context, rootNavigator: false)
                  .push(MaterialPageRoute(builder: (context) {
                return widget.navigation;
              }));
            } else {
              getStatsScreen();
            }
          },
          child: Row(
            children: [
              widget.icon,
              SizedBox(
                width: 15,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 25,
                    fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getStatsScreen() async {
    List<Natija> vals = await StatsDatabase.instance.getStats();
    int cor = 0;
    int incor = 0;
    int notselected = 0;
    int timespent = 0;
    int all = 0;

    for (Natija i in vals) {
      cor += i.correctanswers;
      incor += i.incorrectanswers;
      notselected += i.savolsoni - i.correctanswers - i.incorrectanswers;
      timespent += i.timespent;
      all += i.savolsoni;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return StatsScreen(
        values: vals,
        all: all,
        correct: cor,
        incorrect: incor,
        notselected: notselected,
        time: timespent,
        urinishlarSoni: vals.length,
      );
    }));
  }
}
