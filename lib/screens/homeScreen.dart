import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:piima/screens_2/al_xorazmiy.dart';
import 'package:piima/screens_2/ibn_sino.dart';
import 'package:piima/screens_2/ijod_maktab.dart';
import 'package:piima/screens_2/mirzo_ulugbek.dart';
import 'package:piima/screens_2/prezident.dart';
import '../extra/topAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const String _url = 'https://ariza.piima.uz';

    return TopAppBar(
      appBarText: ("Bosh sahifa"),
      anotherChild: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(2, 3),
                        color: Colors.grey)
                  ]),
              child: FlatButton(
                onPressed: () async {
                  if (!await launch(_url)) {
                    throw "$_url sahifasini yuklab bo'lmadi";
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 120,
                    child: Stack(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 40.0, top: 20),
                          child: Image(
                            image: AssetImage(
                              "images/register.png",
                            ),
                            width: 80,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 130, right: 30),
                          child: Center(
                            child: Text(
                              "Ro'yhatdan o'tish",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          catalog1(
            self_image: 'images/piima.png',
            self_name: "Prezident maktablari",
            open_screen: const prezident(),
          ),
          catalog1(
            self_image: 'images/math.png',
            self_name: 'Matematika va informatikaga ixtisoslashgan maktablar',
            open_screen: const al_xorazmiy(),
          ),
          catalog1(
            self_image: "images/science.png",
            self_name: "Matematika va fizikaga ixtisoslashgan maktablar",
            open_screen: const mirzo_ulugbek(),
          ),
          catalog1(
            self_image: "images/natural.png",
            self_name: "Tabiiy fanlarga ixtisoslashgan maktablar",
            open_screen: const ibn_sino(),
          ),
          catalog1(
            self_image: "images/ijod.png",
            self_name: "PIIMA tasarrufidagi ijod maktablari",
            open_screen: const ijod_maktab(),
          ),
          /* catalog1(
            self_image: "images/DTM.png",
            self_name: "Davlat Test Markazi savollari",
            open_screen: DTM(),
          ),
          catalog1(
            self_image: "images/iq.png",
            self_name: "IQ savollari",
            open_screen: iq(),
          ),*/
        ],
      ),
    );
  }
}

class catalog1 extends StatefulWidget {
  catalog1(
      {Key? key,
      required this.self_image,
      required this.self_name,
      required this.open_screen})
      : super(key: key);

  String self_image;
  String self_name;
  Widget open_screen;

  @override
  _catalog1State createState() => _catalog1State();
}

class _catalog1State extends State<catalog1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: OpenContainer(
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20),
          side: const BorderSide(color: Colors.blueAccent),
        ),
        closedElevation: 8,
        transitionDuration: const Duration(milliseconds: 750),
        closedBuilder: (ctx, action) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 100,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30),
                  child: Image(
                    image: AssetImage(widget.self_image),
                    width: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100,
                  ),
                  child: Center(
                    child: Text(
                      widget.self_name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        openBuilder: (ctx, action) => widget.open_screen,
      ),
    );
  }
}
