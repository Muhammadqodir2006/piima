import 'package:path/path.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Natija {
  int? id;
  final int savolsoni;
  final int correctanswers;
  final int incorrectanswers;
  final int timespent;
  final int bazaTartibRaqam;
  Natija(
      {this.id,
      required this.savolsoni,
      required this.correctanswers,
      required this.incorrectanswers,
      required this.timespent,
      required this.bazaTartibRaqam});

  factory Natija.fromMap(Map<String, dynamic> json) => Natija(
      id: json['id'],
      savolsoni: json['savolsoni'],
      correctanswers: json['correctanswers'],
      timespent: json['timespent'],
      incorrectanswers: json['incorrectanswers'],
      bazaTartibRaqam: json['bazaTartibRaqam']);
  Map<String, dynamic> toMap() {
    return {
      "savolsoni": savolsoni,
      "correctanswers": correctanswers,
      "incorrectanswers": incorrectanswers,
      "timespent": timespent,
      "bazaTartibRaqam": bazaTartibRaqam,
    };
  }
}

class StatsDatabase {
  StatsDatabase._privateConstructor();
  static final StatsDatabase instance = StatsDatabase._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'StatsDatabse.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
    CREATE TABLE stat(
    id INTEGER PRIAMRY KEY,
    savolsoni INTEGER,
    correctanswers INTEGER,
    incorrectanswers INTEGER,
    timespent INTEGER,
    bazaTartibRaqam INTEGER
)
""");
  }

  Future<List<Natija>> getStats() async {
    Database db = await instance.database;
    var natiJALAR = await db.query("stat", orderBy: 'id');
    List<Natija> natijalar = natiJALAR.isNotEmpty
        ? natiJALAR.map((e) => Natija.fromMap(e)).toList()
        : [];
    return natijalar;
  }

  Future add(Natija natija) async {
    Database db = await instance.database;
    return await db.insert('stat', natija.toMap());
  }
}
