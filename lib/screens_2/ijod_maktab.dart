// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:piima/quest/QuestInfo.dart';
import 'package:piima/extra/info.dart';

import 'package:piima/quest/gotoQuest.dart';
import 'package:piima/extra/topAppBar2.dart';
import 'package:piima/extra/image_catalog.dart';

class ijod_maktab extends StatefulWidget {
  const ijod_maktab({Key? key}) : super(key: key);

  @override
  _ijod_maktabState createState() => _ijod_maktabState();
}

class _ijod_maktabState extends State<ijod_maktab> {
  @override
  Widget build(BuildContext context) {
    return topAppBar2(
        appBarText: "Ijod maktablari",
        bottomPart: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            goToQuestPage(
              centerText: '7-sinf savollari',
              bazaTartibRaqam: ijodBaza1,
              savolSoni: ijodCount1,
            ),
            goToQuestPage(
              centerText: '8-sinf savollari',
              bazaTartibRaqam: ijodBaza2,
              savolSoni: ijodCount2,
            ),
            goToQuestPage(
              centerText: '9-sinf savollari',
              bazaTartibRaqam: ijodBaza3,
              savolSoni: ijodCount3,
            ),
            goToQuestPage(
              centerText: '10-sinf savollari',
              bazaTartibRaqam: ijodBaza4,
              savolSoni: ijodCount4,
            ),
          ],
        ),
        maktab_haqida: ijod_haqida,
        childWidget: ListView(
          children: [
            image_catalog(image_location: 'images/ijod1.jpg', width_factor: 1),
            image_catalog(image_location: 'images/ijod2.jpg', width_factor: 1),
            image_catalog(image_location: 'images/ijod3.jpg', width_factor: 1),
            image_catalog(image_location: 'images/ijod4.jpg', width_factor: 1),
            image_catalog(image_location: 'images/ijod5.jpg', width_factor: 1),
            image_catalog(image_location: 'images/ijod6.jpg', width_factor: 1),
            image_catalog(image_location: 'images/ijod7.jpeg', width_factor: 1),
            image_catalog(image_location: 'images/ijod8.jpg', width_factor: 1),
            image_catalog(image_location: 'images/ijod9.jpg', width_factor: 1),
            image_catalog(image_location: 'images/ijod10.jpg', width_factor: 1),
            SizedBox(
              height: 55,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10 * 4 + 30,
            )
          ],
        ));
  }
}
