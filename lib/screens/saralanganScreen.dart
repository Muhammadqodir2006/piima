import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:piima/baza.dart';
import 'package:piima/extra/topAppBar.dart';
import 'package:piima/quest/Quest.dart';
import 'package:piima/saralangan/Saralangan.dart';

class SaralanganScreen extends StatefulWidget {
  const SaralanganScreen({Key? key}) : super(key: key);

  @override
  _SaralanganScreenState createState() => _SaralanganScreenState();
}

class _SaralanganScreenState extends State<SaralanganScreen> {
  void getFullScreen() async {
    await FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
  }

  @override
  Widget build(BuildContext context) {
    return TopAppBar(
        appBarText: 'Saralangan savollar',
        anotherChild: Stack(children: [
          Container(
            alignment: Alignment.topRight,
            child: PopupMenuButton<String>(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                iconSize: 35,
                itemBuilder: (context) => [
                      PopupMenuItem(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    content: Text(
                                        "Saralangan savollarni o'chirish uchun tasdiqlash tugmasini bosing"),
                                  );
                                });
                            setState(() {
                              DatabaseHelper.instance.clear();
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            'Saralanganlarni tozalash',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ))
                    ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: FutureBuilder<List>(
                future: DatabaseHelper.instance.getQuestions(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.isEmpty
                        ? const Center(
                            child: Text(
                            'Saralangan savollar mavjud emas',
                            style: TextStyle(fontSize: 18),
                          ))
                        : ListView(
                            children: snapshot.data!.reversed.map((question) {
                            Quest current = baza11[question.bazaTartibRaqami]
                                [question.tartibRaqam];
                            String text = current.text;
                            String subText = (text.length >= 80)
                                ? text.substring(0, 80) + "..."
                                : text.substring(0, text.length);

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OpenContainer(
                                closedElevation: 6,
                                transitionDuration:
                                    const Duration(milliseconds: 700),
                                closedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        color: Colors.blue.shade300, width: 1)),
                                openBuilder: (context, action) =>
                                    Open(current: current),
                                closedBuilder: (context, builder) => Stack(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Image(
                                        image: AssetImage(
                                          'images/piima.png',
                                        ),
                                        width: 60,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 100.0,
                                          right: 40,
                                          top: 20,
                                          bottom: 20),
                                      child: Text(
                                        subText,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        PopupMenuButton<String>(
                                          color: Colors.blueAccent,
                                          elevation: 20,
                                          itemBuilder: (BuildContext context) {
                                            return [
                                              PopupMenuItem(
                                                  onTap: () {
                                                    setState(() {
                                                      DatabaseHelper.instance
                                                          .remove(
                                                              question
                                                                  .bazaTartibRaqami,
                                                              question
                                                                  .tartibRaqam);
                                                    });
                                                  },
                                                  child: const Center(
                                                    child: Text(
                                                      'Saralanganlardan olib tashlash',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                  ))
                                            ];
                                          },
                                          iconSize: 22,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList());
                  } else {
                    return Center(
                        child: const CircularProgressIndicator(
                      strokeWidth: 6,
                    ));
                  }
                }),
          ),
        ]));
  }
}

class Open extends StatelessWidget {
  const Open({
    Key? key,
    required this.current,
  }) : super(key: key);

  final Quest current;

  @override
  Widget build(BuildContext context) {
    List<Widget> getvars() {
      List<Widget> vars = [];
      for (String vaR in current.vars) {
        vars.add(Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade200)),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Center(
                child: Text(
              vaR,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            )),
          ),
        ));
      }
      return vars;
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Center(
              child: Text(
                current.text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            current.rasmBor
                ? Image(
                    image: AssetImage('rasm/${current.rasmLoc}'),
                    width: MediaQuery.of(context).size.width - 200,
                  )
                : const Text(''),
            const SizedBox(height: 15),
            Column(
              children: getvars(),
            )
          ],
        ),
      ),
    );
  }
}
