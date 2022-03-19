// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:piima/quest/QuestInfo.dart';
import 'package:piima/extra/info.dart';

import 'package:piima/quest/gotoQuest.dart';
import 'package:piima/extra/topAppBar2.dart';
import 'package:piima/extra/image_catalog.dart';

class mirzo_ulugbek extends StatefulWidget {
  const mirzo_ulugbek({Key? key}) : super(key: key);

  @override
  _mirzo_ulugbekState createState() => _mirzo_ulugbekState();
}

class _mirzo_ulugbekState extends State<mirzo_ulugbek> {
  @override
  Widget build(BuildContext context) {
    return topAppBar2(
        appBarText: "Mirzo Ulug'bek maktabi",
        bottomPart: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            goToQuestPage(
              centerText: "7-sinf savollari",
              bazaTartibRaqam: mirzo_ulugbekBaza1,
              savolSoni: mirzo_ulugbekCount1,
            )
          ],
        ),
        maktab_haqida: mirzo_ulugbek_haqida,
        childWidget: ListView(
          children: [
            image_catalog(
                image_location: 'images/mirzo_ulugbek1.jpeg', width_factor: 1),
            image_catalog(
                image_location: 'images/mirzo_ulugbek2.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/mirzo_ulugbek3.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/mirzo_ulugbek4.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/mirzo_ulugbek5.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/mirzo_ulugbek6.jpeg', width_factor: 1),
            image_catalog(
                image_location: 'images/mirzo_ulugbek7.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/mirzo_ulugbek8.jpg', width_factor: 1),
            image_catalog(
                image_location: 'images/ulugbek.png', width_factor: 1),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10 + 30,
            )
          ],
        ));
  }
}
