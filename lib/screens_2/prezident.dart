// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:piima/quest/QuestInfo.dart';
import 'package:piima/extra/info.dart';

import 'package:piima/quest/gotoQuest.dart';
import 'package:piima/extra/topAppBar2.dart';
import 'package:piima/extra/image_catalog.dart';

class prezident extends StatefulWidget {
  const prezident({Key? key}) : super(key: key);

  @override
  _prezidentState createState() => _prezidentState();
}

class _prezidentState extends State<prezident> {
  @override
  Widget build(BuildContext context) {
    return topAppBar2(
      maktab_haqida: prezident_haqida,
      appBarText: "Prezident maktabi",
      bottomPart: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          goToQuestPage(
            centerText: "A daraja savollari",
            bazaTartibRaqam: presidentBaza1,
            savolSoni: presidentCount1,
          ),
          goToQuestPage(
            centerText: "B daraja savollari",
            bazaTartibRaqam: presidentBaza2,
            savolSoni: presidentCount2,
          ),
          goToQuestPage(
            centerText: "C daraja savollari",
            bazaTartibRaqam: presidentBaza3,
            savolSoni: presidentCount3,
          ),
        ],
      ),
      childWidget: ListView(
        children: [
          image_catalog(
              image_location: 'images/prezident1.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident2.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident4.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident5.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident6.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident7.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident8.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident9.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident10.jpg', width_factor: 1),
          image_catalog(
              image_location: 'images/prezident11.jpg', width_factor: 1),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image_catalog(
                  image_location: 'images/piima.png', width_factor: 1.5),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10 * 3 + 30,
          )
        ],
      ),
    );
  }
}
