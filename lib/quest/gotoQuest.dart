// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:piima/baza.dart';
import 'package:piima/quest/Quest.dart';
import 'dart:math';

import 'package:piima/quest/questPage.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:piima/saralangan/Saralangan.dart';

class goToQuestPage extends StatefulWidget {
  goToQuestPage(
      {Key? key,
      required this.centerText,
      required this.bazaTartibRaqam,
      required this.savolSoni})
      : super(key: key);

  String centerText;
  int bazaTartibRaqam;
  int savolSoni;

  @override
  _goToQuestPageState createState() => _goToQuestPageState();
}

class _goToQuestPageState extends State<goToQuestPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 6),
      child: Container(
        decoration: BoxDecoration(
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(2, 3),
                  color: Colors.blueGrey),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue, width: 2.5)),
        height: MediaQuery.of(context).size.height / 10,
        child: FlatButton(
          onPressed: () async {
            int bazaTartib = widget.bazaTartibRaqam;
            Database db = await DatabaseHelper.instance.database;
            List<SaralanganQuest> saraQuest =
                await DatabaseHelper.instance.getQuestions();

            List<bool> isSaralangan =
                List.generate(widget.savolSoni, (index) => false);
            List<String> selectedAnswers =
                List.generate(widget.savolSoni, (index) => ' ');
            List<int> selectedQuestions =
                List.generate(widget.savolSoni, (index) => 0);
            List<String> CorrectAnswers =
                List.generate(widget.savolSoni, (index) => '');
            for (int i = 0; i < widget.savolSoni; i++) {
              bool a = false;
              int randomNum = 0;
              while (!a) {
                randomNum =
                    Random().nextInt(baza11[widget.bazaTartibRaqam].length);
                if (!selectedQuestions.contains(randomNum)) {
                  a = true;
                }
              }
              for (SaralanganQuest q in saraQuest) {
                if (q.bazaTartibRaqami == bazaTartib &&
                    randomNum == q.tartibRaqam) {
                  isSaralangan[i] = true;
                  break;
                }
              }
              selectedQuestions[i] = (randomNum);
              Quest currentQuest = baza11[widget.bazaTartibRaqam][randomNum];
              String corAnswer = currentQuest.correctAnswer;
              CorrectAnswers[i] = (corAnswer);
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return QuestPage(
                isSaralangan: isSaralangan,
                bazaTartibRaqami: widget.bazaTartibRaqam,
                correcctAnswers: CorrectAnswers,
                selectedAnswers: selectedAnswers,
                selectedQuestions: selectedQuestions,
                savollarBazasi: baza11[widget.bazaTartibRaqam],
              );
            }));
          },
          highlightColor: Colors.blueAccent,
          child: Center(
            child: Text(widget.centerText),
          ),
        ),
      ),
    );
  }
}
