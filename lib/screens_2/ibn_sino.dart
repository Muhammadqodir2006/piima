// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:piima/quest/QuestInfo.dart';

import '../extra/info.dart';

import 'package:piima/quest/gotoQuest.dart';
import 'package:piima/extra/topAppBar2.dart';
import 'package:piima/extra/image_catalog.dart';

class ibn_sino extends StatefulWidget {
  const ibn_sino({Key? key}) : super(key: key);

  @override
  _ibn_sinoState createState() => _ibn_sinoState();
}

class _ibn_sinoState extends State<ibn_sino> {
  @override
  Widget build(BuildContext context) {
    return topAppBar2(
        appBarText: "Ibn Sino maktabi",
        bottomPart: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            goToQuestPage(
              centerText: "7-sinf savollari",
              bazaTartibRaqam: ibn_sinoBaza1,
              savolSoni: ibn_sinoCount1,
            )
          ],
        ),
        maktab_haqida: ibn_sibo_haqida,
        childWidget: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            image_catalog(
                image_location: 'images/ibn_sino10.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino1.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino2.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino3.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino4.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino5.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino6.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino7.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino8.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ibn_sino9.jpg', width_factor: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image_catalog(
                    image_location: 'images/ibnSino.png', width_factor: 1.3),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10 + 30,
            )
          ],
        ));
  }
}
