import 'dart:async' show Future, Timer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:piima/quest/Quest.dart';
import 'package:piima/main/constants.dart' as a;
import 'package:piima/quest/reviewPage.dart';
import 'package:piima/saralangan/Saralangan.dart';
import 'package:piima/stats/Stats.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class QuestPage extends StatefulWidget {
  QuestPage(
      {Key? key,
      required this.savollarBazasi,
      required this.correcctAnswers,
      required this.selectedQuestions,
      required this.selectedAnswers,
      required this.isSaralangan,
      required this.bazaTartibRaqami})
      : super(key: key);

  final List<int> selectedQuestions;
  final List<String> correcctAnswers;
  final List savollarBazasi;
  final int bazaTartibRaqami;
  List<String> selectedAnswers;
  int questNum = 1;
  int index = 0;
  List<bool> isSaralangan;
  late List<bool> belgilangan =
      List.generate(selectedQuestions.length, (index) => false);

  final ItemScrollController _itemScrollController = ItemScrollController();
  final ScrollController _scrollController = ScrollController();
  late int savolSoni = selectedQuestions.length;

  int time = 0;

  @override
  _QuestPageState createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      widget.time++;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    bool isLike = widget.isSaralangan[widget.index];
    final int savollarSoni = widget.selectedQuestions.length;
    final double deviceWidth = MediaQuery.of(context).size.width;

    int questNum = widget.questNum;
    Quest currentQuest =
        widget.savollarBazasi[widget.selectedQuestions[widget.questNum - 1]];
    String rasmLoc = currentQuest.rasmLoc;
    String _rasmLoc = 'rasm/$rasmLoc';

    //
    //
    // VARIANTLAR
    //
    //
    List<Padding> getVars() {
      List<Padding> variantlar = [];
      Quest currentQuest =
          widget.savollarBazasi[widget.selectedQuestions[questNum - 1]];
      List<String> Vars = currentQuest.vars;
      Vars.shuffle();
      for (String variant in Vars) {
        bool isSelectedVariant =
            (widget.selectedAnswers[questNum - 1] == variant);
        variantlar.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: SizedBox(
              width:
                  isSelectedVariant ? deviceWidth * 0.83 : deviceWidth * 0.77,
              child: FlatButton(
                  highlightColor: Colors.blue.shade600,
                  padding: EdgeInsets.symmetric(
                    vertical: isSelectedVariant ? 27 : 17,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isSelectedVariant
                          ? Colors.deepPurpleAccent.shade400
                          : Colors.black26,
                      width: isSelectedVariant ? 5 : 1.5,
                    ),
                    borderRadius: isSelectedVariant
                        ? BorderRadius.circular(45)
                        : BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    if (widget.selectedAnswers[widget.index] != variant) {
                      widget.selectedAnswers[widget.index] = variant;
                    }
                    widget.belgilangan[widget.index] = true;
                    setState(() {
                      animate(true);
                    });
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          variant,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: isSelectedVariant
                                ? 22
                                : 16, /*color: isSelectedVariant? Colors.white : Colors.black87*/
                          ),
                        ),
                      ),
                      isSelectedVariant
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    CupertinoIcons.checkmark_alt_circle_fill,
                                    color: Colors.deepPurpleAccent.shade400,
                                    size: 30,
                                  ),
                                ),
                              ],
                            )
                          : const Text(''),
                    ],
                  ))),
        ));
      }
      return variantlar;
    }

    Future<bool> showExitPopup() async {
      return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    title: const Text(
                      'Diqqat !',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32),
                    ),
                    content: const Text(
                      "Tasdiqlashingiz bilan test yakunlanadi, ma'lumotlar saqlab qolinmaydi ",
                      style: TextStyle(fontSize: 20),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              animationDuration:
                                  const Duration(milliseconds: 100),
                              primary: const Color.fromRGBO(157, 157, 157, 1)),
                          child: const Text('Bekor qilish')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              animationDuration:
                                  const Duration(milliseconds: 100),
                              primary: const Color.fromRGBO(255, 0, 0, 1)),
                          child: const Text('Testdan chiqish')),
                    ],
                  )) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: Stack(children: [
          //
          //
          //    BACKGROUND
          //
          //
          //

          Container(
            decoration: BoxDecoration(
                // ignore: prefer_const_literals_to_create_immutables
                gradient: LinearGradient(
                    colors: a.Gradient,
                    /* [
              Color.fromRGBO(23, 10, 144, 1),
              Color.fromRGBO(12, 55, 160, 1),
              Color.fromRGBO(5, 100, 170, 1),
              Color.fromRGBO(1, 132, 190, 1),
              Color.fromRGBO(15, 184, 170, 1),
            ], */
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          //
          //
          // ANSWERS SECTION
          //
          //

          SafeArea(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 120),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: ListView(
                  controller: widget._scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              '$questNum/$savollarSoni',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              LikeButton(
                                isLiked: isLike,
                                padding: const EdgeInsets.only(right: 15),
                                likeBuilder: (isLike) {
                                  return Icon(
                                    Icons.star,
                                    size: 30,
                                    color: isLike
                                        ? Colors.red.shade500
                                        : Colors.black38,
                                  );
                                },
                                onTap: (isLike) async {
                                  if (!isLike) {
                                    DatabaseHelper.instance.add(SaralanganQuest(
                                        tartibRaqam: widget
                                            .selectedQuestions[widget.index],
                                        bazaTartibRaqami:
                                            widget.bazaTartibRaqami));
                                    widget.isSaralangan[widget.index] = true;
                                    return true;
                                  } else {
                                    DatabaseHelper.instance.remove(
                                        widget.bazaTartibRaqami,
                                        widget.selectedQuestions[widget.index]);
                                    widget.isSaralangan[widget.index] = false;
                                    return false;
                                  }
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 9),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              currentQuest.text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 22, fontStyle: FontStyle.italic),
                            ),
                          ),
                          (currentQuest.rasmBor)
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(
                                    image: AssetImage(
                                      _rasmLoc,
                                    ),
                                    width: deviceWidth * 1.7,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black26,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(children: getVars()),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.blueAccent)),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          splashColor: Colors.lightBlue.shade100,
                          hoverColor: Colors.blueAccent,
                          onPressed: () {
                            if (widget.selectedAnswers[questNum - 1] != ' ') {
                              setState(() {
                                widget.selectedAnswers[questNum - 1] = ' ';
                                widget.belgilangan[widget.index] = false;
                              });
                            }
                          },
                          child: Text(
                            "Tanlovni bekor qilish",
                            style: TextStyle(color: Colors.blueAccent.shade700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red[700])),
                          onPressed: () {
                            bool hammasiTanlangan =
                                checkSelection() == widget.savolSoni;
                            bool birortayamTanlanmagan = checkSelection() == 0;
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    title: const Text(
                                      'Testni yakunlash uchun tasdiqlang',
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: hammasiTanlangan
                                                    ? Colors.green
                                                    : Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 0),
                                          child: Text(
                                              hammasiTanlangan
                                                  ? "Barcha savollar belgilangan"
                                                  : birortayamTanlanmagan
                                                      ? "Hech qanday savolga javob belgilanmagan. Urinish hisobga olinmaydi"
                                                      : "Belgilanmagan savollar mavjud",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: hammasiTanlangan
                                                    ? Colors.green
                                                    : Colors.red,
                                              )),
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              animationDuration: const Duration(
                                                  milliseconds: 100),
                                              primary: const Color.fromRGBO(
                                                  157, 157, 157, 1)),
                                          child: const Text("Bekor qilish")),
                                      ElevatedButton(
                                          onPressed: () {
                                            navigate();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              animationDuration: const Duration(
                                                  milliseconds: 100),
                                              primary: hammasiTanlangan
                                                  ? Colors.green
                                                  : Colors.red),
                                          child: const Text("Tasdiqlash"))
                                    ],
                                  );
                                });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Testni yakunlash"),
                          )),
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                  ],
                ),
              ),
            ),
          ),

          //
          //
          // TOP LIST
          //
          //

          SafeArea(
            child: SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      child: ScrollablePositionedList.builder(
                          itemScrollController: widget._itemScrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.selectedQuestions.length,
                          itemBuilder: (BuildContext context, int index) {
                            bool isCurrent = (questNum - 1 == index);
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: (widget.index == index) ? 0 : 7,
                                  horizontal: (widget.index == index) ? 0 : 7),
                              child: Container(
                                width: (widget.index == index) ? 80 : 65,
                                height: (widget.index == index) ? 100 : 40,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: FlatButton(
                                  color: isCurrent
                                      ? Colors.white70
                                      : (widget.selectedAnswers[index] != " ")
                                          ? Colors.white30
                                          : Colors.transparent,
                                  splashColor: Colors.white38,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: (questNum == index + 1)
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(7),
                                    side: BorderSide(
                                      color: Colors.white60,
                                      width: (questNum == index + 1) ? 3 : 1,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      // Action
                                      widget.index = index;
                                      widget.questNum = index + 1;
                                      widget._itemScrollController.scrollTo(
                                          index: widget.index,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          curve: Curves.fastOutSlowIn);

                                      // Animation
                                      widget._scrollController.animateTo(0,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          curve: Curves.fastOutSlowIn);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 6),
                                    child: (widget.selectedAnswers[index] !=
                                            " ")
                                        ? const Icon(
                                            Icons.radio_button_checked_rounded,
                                            color: Colors.white60,
                                          )
                                        : Text(
                                            (index + 1).toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: (questNum == index + 1)
                                                  ? Colors.white
                                                  : Colors.white70,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          //
          //
          //  BOTTOM NAVIGATOR
          //
          //
          //
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    highlightColor: Colors.blueAccent.shade200,
                    elevation: 30,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side:
                            BorderSide(color: Colors.blue.shade100, width: 2)),
                    onPressed: () {
                      if (widget.questNum > 1) {
                        setState(() {
                          animate(false);
                        });
                      }
                    },
                    child: const Text(
                      'Oldingi',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: RaisedButton(
                        highlightColor: Colors.white30,
                        elevation: 30,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        color: Colors.blue.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          if (widget.questNum < widget.savolSoni) {
                            setState(() {
                              animate(true);
                            });
                          }
                        },
                        child: const Text(
                          'Keyingi',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          )
        ]),
      ),
    );
  }

  int checkSelection() {
    int tanlangan = 0;
    for (var item in widget.belgilangan) {
      if (item) {
        tanlangan++;
      }
    }
    return tanlangan;
  }

  void animate(bool forward) {
    /*if (!checkSelection() && belgilanmaganSavollarSoni() > 1) {
      if (forward) {
        if (widget.index < widget.savolSoni - 1) {
          while (widget.belgilangan[widget.index + 1] == true) {
            if (widget.index == widget.savolSoni - 2) {
              widget.index = -1;
              widget.questNum = 0;
            }
            widget.questNum++;
            widget.index++;
          }
          if (widget.index != widget.savolSoni - 1) {
            widget.questNum++;
            widget.index++;
          }
        }
      } else {
        if (widget.index > 0) {
          while (widget.belgilangan[widget.index - 1] == true) {
            if (widget.index == 1) {
              widget.index = widget.savolSoni - 1;
              widget.questNum = widget.savolSoni;
            }
            widget.questNum--;
            widget.index--;
          }
          widget.questNum--;
          widget.index--;
        }
      }
    } else if (widget.index > 0 &&
        widget.index < widget.selectedQuestions.length - 1) {
      if (forward) {
        widget.questNum++;
        widget.index++;
      } else {
        widget.questNum--;
        widget.index--;
      }
    }
    if (widget.index == widget.savolSoni - 1) {
      if (!forward) {
        widget.questNum--;
        widget.index--;
      }
    }
    */
    if (forward) {
      if (widget.index < widget.savolSoni - 1) {
        widget.questNum++;
        widget.index++;
      }
    } else {
      if (widget.index > 0) {
        widget.questNum--;
        widget.index--;
      }
    }
    widget._scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn);

    /*if (widget.questNum > 2 && widget.questNum < 19) {
      widget._itemScrollController.scrollTo(
          index: widget.questNum - 3,
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastOutSlowIn);
    } else {
      widget._itemScrollController.scrollTo(
          index: widget.index, duration: Duration(milliseconds: 1000));
    }*/
    widget._itemScrollController.scrollTo(
        index: widget.index, duration: const Duration(milliseconds: 1000));
  }

  void navigate() {
    int corect = 0;
    int inCorrect = 0;
    int notSelected = 0;

    for (int i = 0; i < widget.selectedQuestions.length; i++) {
      String tanlanganvariant = widget.selectedAnswers[i];
      String correctAnswer = widget.correcctAnswers[i];

      if (tanlanganvariant == correctAnswer) {
        corect++;
      } else if (tanlanganvariant == ' ') {
        notSelected++;
      } else {
        inCorrect++;
      }
    }
    int count = 0;
    bool zeroSlected = notSelected == widget.selectedQuestions.length;
    !zeroSlected
        ? go(corect, inCorrect, notSelected)
        : Navigator.of(context).popUntil((route) => count++ >= 2);
  }

  void go(int cor, int incor, int notSel) {
    StatsDatabase.instance.add(Natija(
        savolsoni: widget.savolSoni,
        correctanswers: cor,
        incorrectanswers: incor,
        timespent: widget.time,
        bazaTartibRaqam: widget.bazaTartibRaqami));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReviewPage(
          timeDone: widget.time,
          CorrectAnswers: widget.correcctAnswers,
          q_correct: cor,
          q_incorrect: incor,
          q_notSlected: notSel,
          baza: widget.savollarBazasi,
          selectedAnswers: widget.selectedAnswers,
          selectedQuestions: widget.selectedQuestions);
    }));
  }
}
