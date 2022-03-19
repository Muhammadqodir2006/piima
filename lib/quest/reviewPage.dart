import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:piima/main/mainPage.dart';
import 'package:piima/quest/Quest.dart';
import 'package:piima/main/constants.dart' as a;
import 'package:piima/screens/statsScreen.dart';
import 'package:piima/stats/Stats.dart';

class ReviewPage extends StatefulWidget {
  ReviewPage(
      {Key? key,
      required this.baza,
      required this.selectedAnswers,
      required this.selectedQuestions,
      required this.q_correct,
      required this.q_incorrect,
      required this.q_notSlected,
      required this.CorrectAnswers,
      required this.timeDone})
      : super(key: key);

  final List selectedQuestions;
  final List selectedAnswers;
  final List baza;

  List<String> CorrectAnswers;
  int q_correct;
  int q_incorrect;
  int q_notSlected;
  int timeDone;

  int percent = 0;
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  String getTimeInString() {
    String time = '';
    int seconds = widget.timeDone;
    int timeInHour = seconds ~/ 3600;
    if (timeInHour >= 1) {
      time += "$timeInHour:";
    }

    int timeInMin = seconds ~/ 60;
    timeInMin %= 60;
    if (timeInMin > 9) {
      time += "$timeInMin:";
    } else {
      time += "0$timeInMin:";
    }
    int timeInSec = seconds % 60;
    if (timeInSec > 9) {
      time += "$timeInSec";
    } else {
      time += "0$timeInSec";
    }
    return time;
  }

  List<Widget> getSavollar() {
    List<Widget> savollar = [
      const SizedBox(
        height: 20,
      ),
      Result(
          timeDone: getTimeInString(),
          persent: widget.percent,
          savollarSoni: widget.selectedQuestions.length,
          correctAnswersNum: widget.q_correct,
          inCorrectAnswersNum: widget.q_incorrect,
          notselectedAnswersNum: widget.q_notSlected),
      const downArrow(),
      const downArrow(),
    ];
    for (int savoltartibRaqami = 0;
        savoltartibRaqami < widget.selectedQuestions.length;
        savoltartibRaqami++) {
      String selectedAnswer = widget.selectedAnswers[savoltartibRaqami];
      Quest currentQuest =
          widget.baza[widget.selectedQuestions[savoltartibRaqami]];
      List Vars = currentQuest.vars;
      List<Widget> getVariantlar() {
        List<Widget> variantlar = [];
        for (int variantTartibRaqami = 0;
            variantTartibRaqami < currentQuest.vars.length;
            variantTartibRaqami++) {
          String currentVariant = currentQuest.vars[variantTartibRaqami];
          bool RedColor = (selectedAnswer == currentVariant &&
              selectedAnswer != widget.CorrectAnswers[savoltartibRaqami]);
          bool GreenColor =
              (currentVariant == widget.CorrectAnswers[savoltartibRaqami]);
          bool isTheUsersAnswer =
              (selectedAnswer == currentQuest.vars[variantTartibRaqami]);
          variantlar.add(Padding(
            padding: GreenColor
                ? const EdgeInsets.all(0)
                : RedColor
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.all(10),
            child: Container(
              width: MediaQuery.of(context).size.width - 35,
              decoration: BoxDecoration(
                  borderRadius: GreenColor
                      ? BorderRadius.circular(30)
                      : RedColor
                          ? BorderRadius.circular(30)
                          : BorderRadius.circular(16),
                  border: Border.all(
                      width: GreenColor
                          ? 5
                          : RedColor
                              ? 5
                              : 1,
                      color: GreenColor
                          ? Colors.green
                          : RedColor
                              ? Colors.red
                              : Colors.black38)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Text(
                        Vars[variantTartibRaqami],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        isTheUsersAnswer
                            ? Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Icon(
                                  CupertinoIcons.checkmark_alt_circle_fill,
                                  color: GreenColor ? Colors.green : Colors.red,
                                ),
                              )
                            : const Text('')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
        }
        return variantlar;
      }

      int currentQuestNum = savoltartibRaqami + 1;
      int savollarSoni = widget.selectedQuestions.length;
      savollar.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(3, 6),
                    color: Colors.black12)
              ],
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '$currentQuestNum/$savollarSoni',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        currentQuest.text,
                        style: const TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      currentQuest.rasmBor
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Image(
                                image:
                                    AssetImage('rasm/${currentQuest.rasmLoc}'),
                              ),
                            )
                          : Text('')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: getVariantlar(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: (widget.selectedAnswers[savoltartibRaqami] ==
                                  widget.CorrectAnswers[savoltartibRaqami])
                              ? Colors.green
                              : Colors.redAccent,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Text(
                        (widget.selectedAnswers[savoltartibRaqami] ==
                                widget.CorrectAnswers[savoltartibRaqami])
                            ? '1/1'
                            : '0/1',
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return savollar;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    //
    //
    //
    //
    //
    //
    //
    //

    return WillPopScope(
      onWillPop: goTwice,
      child: Scaffold(
        backgroundColor: Colors.blueAccent.shade700,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: a.Gradient2,
          )),
          child: SafeArea(
            child: ScrollWrapper(
              promptAnimationType: PromptAnimation.size,
              promptTheme: PromptButtonTheme(
                  color: Colors.blueAccent.shade700,
                  elevation: 7,
                  iconPadding: const EdgeInsets.all(15),
                  padding: const EdgeInsets.only(right: 30, bottom: 20)),
              promptAlignment: Alignment.bottomRight,
              scrollToTopCurve: Curves.fastOutSlowIn,
              promptDuration: const Duration(milliseconds: 1000),
              scrollToTopDuration: const Duration(milliseconds: 1000),
              builder: (context, prop) => ListView(
                children: getSavollar(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> goTwice() async {
    int count = 0;
    Navigator.of(context).popUntil((route) => count++ >= 3);
    return true;
  }
}

//
//
//
//
//
//
//
//
//
//

class downArrow extends StatelessWidget {
  const downArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      CupertinoIcons.chevron_down,
      color: Colors.white,
      size: 35,
    );
  }
}

class Result extends StatefulWidget {
  Result(
      {Key? key,
      required this.correctAnswersNum,
      required this.inCorrectAnswersNum,
      required this.notselectedAnswersNum,
      required this.savollarSoni,
      required this.persent,
      required this.timeDone})
      : super(key: key);

  final int correctAnswersNum;
  final int inCorrectAnswersNum;
  final int notselectedAnswersNum;
  final int savollarSoni;
  int persent;
  String timeDone;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
        upperBound: widget.correctAnswersNum / widget.savollarSoni * 100);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.forward();

    controller.addListener(() {
      setState(() {
        widget.persent = controller.value.toInt();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int persent =
        (widget.correctAnswersNum / widget.savollarSoni * 100).toInt();
    Map<String, double> dataMap = {
      "Noto'g'ri": 100 - persent.toDouble(),
      "Tog'ri": persent.toDouble(),
    };
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Container(
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            blurRadius: 25,
            spreadRadius: 15,
            color: Colors.black26,
            blurStyle: BlurStyle.normal,
            offset: Offset(4, 7),
          ),
        ], borderRadius: BorderRadius.circular(35), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 2000),
                chartRadius: MediaQuery.of(context).size.width * 0.5,
                chartType: ChartType.ring,
                ringStrokeWidth: 15,
                gradientList: [
                  [Colors.grey.shade200, Colors.grey.shade300],
                  [
                    Colors.lightBlueAccent,
                    Colors.blueAccent.shade700,
                  ],
                ],
                legendOptions: const LegendOptions(
                  legendShape: BoxShape.circle,
                  legendPosition: LegendPosition.left,
                  showLegendsInRow: false,
                  showLegends: false,
                ),
                centerText: controller.value.toInt().toString() + " %",
                centerTextStyle:
                    const TextStyle(fontSize: 50, color: Colors.blueAccent),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  showChartValueBackground: false,
                ),
                colorList: [
                  Colors.lightBlueAccent.shade700,
                  Colors.grey.shade900,
                ],
                initialAngleInDegree: 270 + 360 / 100 * persent,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "To'g'ri javoblar:   ${widget.correctAnswersNum}\n Noto'g'ri javoblar:  ${widget.inCorrectAnswersNum}\nBelgilanmaganlar:   ${widget.notselectedAnswersNum}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blueAccent, fontSize: 22),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Sarflangan vaqt:  ${widget.timeDone}',
                style: TextStyle(color: Colors.blue.shade700, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              goTo(
                text: "Bosh shifa",
                where: const HomePage(),
              ),
              goTo(
                text: "Statistika",
                where: HomePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class goTo extends StatelessWidget {
  goTo({Key? key, required this.text, required this.where}) : super(key: key);

  String text;
  Widget where;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          autofocus: true,
          style: ElevatedButton.styleFrom(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            if (this.text != "Statistika") {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return where;
              }));
            } else {
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
                  notselected +=
                      i.savolsoni - i.correctanswers - i.incorrectanswers;
                  timespent += i.timespent;
                  all += i.savolsoni;
                }
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
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

              getStatsScreen();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          )),
    );
  }
}
