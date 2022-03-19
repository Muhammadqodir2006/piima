import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SaralanganQuest {
  final int? id;
  final int tartibRaqam;
  final int bazaTartibRaqami;

  SaralanganQuest(
      {this.id, required this.tartibRaqam, required this.bazaTartibRaqami});

  factory SaralanganQuest.fromMap(Map<String, dynamic> json) => SaralanganQuest(
      id: json['id'],
      tartibRaqam: json['tartibRaqam'],
      bazaTartibRaqami: json["bazaTartibRaqami"]);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tartibRaqam': tartibRaqam,
      'bazaTartibRaqami': bazaTartibRaqami,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'SaralanganQuest.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
    CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    tartibRaqam INTEGER,
    bazaTartibRaqami INTEGER
)
""");
  }

  Future<List<SaralanganQuest>> getQuestions() async {
    Database db = await instance.database;
    var questions = await db.query("questions", orderBy: 'id');
    List<SaralanganQuest> saralanganQuestionsList = questions.isNotEmpty
        ? questions.map((e) => SaralanganQuest.fromMap(e)).toList()
        : [];
    return saralanganQuestionsList;
  }

  Future add(SaralanganQuest saralanganQuest) async {
    Database db = await instance.database;
    bool bormi = false;
    List<SaralanganQuest> selectedQuests = await getQuestions();
    for (var quest in selectedQuests) {
      if (quest.bazaTartibRaqami == saralanganQuest.bazaTartibRaqami &&
          quest.tartibRaqam == saralanganQuest.tartibRaqam) {
        bormi = true;
        break;
      }
    }
    if (!bormi) {
      return await db.insert('questions', saralanganQuest.toMap());
    }
  }

  Future<int> remove(int bazaTartibRaqami, int savolTartibRaqami) async {
    Database db = await instance.database;
    return await db.delete('questions',
        where:
            'bazaTartibRaqami =  $bazaTartibRaqami AND tartibRaqam = $savolTartibRaqami');
  }

  Future clear() async {
    Database db = await DatabaseHelper.instance.database;
    db.delete('questions');
  }
}
