// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piima/quest/QuestInfo.dart';
import 'package:piima/extra/info.dart';
import 'package:piima/quest/gotoQuest.dart';
import 'package:piima/extra/topAppBar2.dart';
import 'package:piima/extra/image_catalog.dart';

class al_xorazmiy extends StatefulWidget {
  const al_xorazmiy({Key? key}) : super(key: key);

  @override
  _al_xorazmiyState createState() => _al_xorazmiyState();
}

class _al_xorazmiyState extends State<al_xorazmiy> {
  @override
  Widget build(BuildContext context) {
    return topAppBar2(
      maktab_haqida: al_xorazmiy_haqida,
      appBarText: "Muhammad al-Xorazmiy maktabi",
      bottomPart: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          goToQuestPage(
            centerText: "5-sinf savollari",
            bazaTartibRaqam: al_xorazmiyBaza1,
            savolSoni: al_xorazmiyCount1,
          ),
          goToQuestPage(
            centerText: "10-sinf savollari",
            bazaTartibRaqam: al_xorazmiyBaza2,
            savolSoni: al_xorazmiyCount2,
          )
        ],
      ),
      childWidget: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          image_catalog(
            image_location: 'images/al_xorazmiy1.jpg',
            width_factor: 1,
          ),
          /*Row(
            children: [
              image_catalog(
                image_location: 'images/al_xorazmiy2.png',
                width_factor: 2,
              ),
              image_catalog(
                image_location: 'images/al_xorazmiy3.png',
                width_factor: 2,
              ),
            ],
          ),*/
          image_catalog(
            image_location: 'images/al_xorazmiy4.jpg',
            width_factor: 1,
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy19.jpg',
            width_factor: 1,
          ),
          /*image_catalog(
            image_location: 'images/al_xorazmiy18.jpg',
            width_factor: 1,
          ),*/
          image_catalog(
            image_location: 'images/al_xorazmiy5.jpg',
            width_factor: 1,
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy6.jpg',
            width_factor: 1,
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy7.jpg',
            width_factor: 1,
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy8.jpg',
            width_factor: 1,
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy9.jpg',
            width_factor: 1,
          ),
          Row(
            children: [
              image_catalog(
                image_location: 'images/al_xorazmiy11.jpg',
                width_factor: 2,
              ),
              image_catalog(
                image_location: 'images/al_xorazmiy10.jpeg',
                width_factor: 2,
              ),
            ],
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy12.jpg',
            width_factor: 1,
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy13.jpg',
            width_factor: 1,
          ),
          /*image_catalog(
            image_location: 'images/al_xorazmiy14.jpg',
            width_factor: 1,
          ),*/
          image_catalog(
            image_location: 'images/al_xorazmiy15.jpg',
            width_factor: 1,
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy123.jpg',
            width_factor: 1,
          ),
          image_catalog(
            image_location: 'images/al_xorazmiy16.jpg',
            width_factor: 1,
          ),
          /*image_catalog(
            image_location: 'images/al_xorazmiy20.jpeg',
            width_factor: 1,
          ),*/
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image_catalog(
                    image_location: 'images/logo.png', width_factor: 2),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5 + 30,
          )
        ],
      ),
    );
  }
}
