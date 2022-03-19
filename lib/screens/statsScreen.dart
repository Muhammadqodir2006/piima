// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:piima/extra/topAppBar.dart';
import 'package:piima/stats/Stats.dart';

import 'package:sqflite/sqlite_api.dart';

class StatsScreen extends StatefulWidget {
  StatsScreen(
      {Key? key,
      required this.values,
      required this.all,
      required this.correct,
      required this.incorrect,
      required this.notselected,
      required this.urinishlarSoni,
      required this.time})
      : super(key: key);
  List<Natija> values;
  int correct;
  int incorrect;
  int notselected;
  int time;
  int urinishlarSoni;

  int all = 1;
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  TextStyle textStyle1 = TextStyle(
    fontSize: 20,
    color: Colors.blue,
  );
  @override
  void initState() {
    widget.values = widget.values.reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "To'g'ri javoblar": (widget.correct / widget.all).toDouble(),
      "Noto'g'ri javoblar": (widget.incorrect / widget.all).toDouble(),
      "Belgilanmagan javoblar": (widget.notselected / widget.all).toDouble(),
    };
    int timeInSeconds = widget.time;
    int timeInMin = (timeInSeconds / 60 % 60).floor();
    int timeInHour = (timeInSeconds / 3600).floor();

    String time = '';

    if (timeInHour > 0) {
      time += "$timeInHour:";
    }
    if (timeInMin > 9) {
      time += "$timeInMin:";
    } else {
      time += "0$timeInMin:";
    }

    int a = timeInSeconds % 60;
    if (a > 9) {
      time += "$a";
    } else {
      time += "0$a";
    }

    return TopAppBar(
      appBarText: "Statistika",
      anotherChild: widget.values.length == 0
          ? Center(
              child: Text(
              'Bajarilgan testlar mavjud emas',
              style: TextStyle(fontSize: 18),
            ))
          : ListView(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0, bottom: 40),
                          child: PieChart(
                            animationDuration: Duration(milliseconds: 2000),
                            chartType: ChartType.ring,
                            centerText:
                                "${(widget.correct / widget.all * 100).round()} % ",
                            dataMap: dataMap,
                            centerTextStyle:
                                TextStyle(fontSize: 28, color: Colors.black87),
                            initialAngleInDegree: -90,
                            chartRadius: MediaQuery.of(context).size.width / 2,
                            colorList: const [
                              Colors.green,
                              Colors.red,
                              Colors.yellow
                            ],
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.bottom,
                              legendShape: BoxShape.rectangle,
                            ),
                            ringStrokeWidth: 60,
                            chartValuesOptions: const ChartValuesOptions(
                                decimalPlaces: 1,
                                showChartValuesInPercentage: true,
                                showChartValues: true,
                                showChartValuesOutside: true,
                                showChartValueBackground: true),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 40,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Jami urinishlar soni : ${widget.urinishlarSoni}",
                                style: textStyle1,
                              ),
                              Text(
                                "Jami savollar soni : ${widget.all}",
                                style: textStyle1,
                              ),
                              Text(
                                "Jami sarflangan vaqt : $time",
                                style: textStyle1,
                              ),
                              Text(
                                "\nTo'g'ri javoblar : ${widget.correct}",
                                style: textStyle1,
                              ),
                              Text(
                                "Noto'g'ri javoblar : ${widget.incorrect}",
                                style: textStyle1,
                              ),
                              Text(
                                "Belgilanmagan javoblar : ${widget.all - widget.correct - widget.incorrect}",
                                style: textStyle1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Table(
                      children: [
                        // ignore: unnecessary_const
                        TableRow(children: [
                          Text(
                            "T/r",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          Icon(
                            CupertinoIcons.list_number,
                            color: Colors.blueAccent,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red,
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.grey.shade400,
                          ),
                          Icon(
                            Icons.access_alarm,
                            color: Colors.blueAccent,
                          ),
                        ]),
                      ],
                    ),
                    Table(
                      border: TableBorder.all(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          style: BorderStyle.solid),
                      children: List.generate(
                        widget.values.length,
                        (index) {
                          Natija current = widget.values[index];
                          String time = '';
                          int timeInSeconds = current.timespent;
                          int timeInMin = (timeInSeconds / 60 % 60).floor();
                          int timeInHour = (timeInSeconds / 3600).floor();

                          if (timeInHour > 0) {
                            time += "$timeInHour:";
                          }
                          if (timeInMin > 9) {
                            time += "$timeInMin:";
                          } else {
                            time += "0$timeInMin:";
                          }

                          int a = timeInSeconds % 60;
                          if (a > 9) {
                            time += "$a";
                          } else {
                            time += "0${a}";
                          }

                          int notselected = current.savolsoni -
                              current.correctanswers -
                              current.incorrectanswers;
                          return TableRow(children: [
                            Center(
                                child: Text("${widget.values.length - index}")),
                            Center(
                                child:
                                    Text("${widget.values[index].savolsoni}")),
                            Center(
                                child: Text(
                                    "${widget.values[index].correctanswers}")),
                            Center(
                                child: Text(
                                    "${widget.values[index].incorrectanswers}")),
                            Center(child: Text("$notselected")),
                            Center(child: Text("$time")),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
    );
  }
}
