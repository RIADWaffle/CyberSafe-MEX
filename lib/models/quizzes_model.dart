import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  factory DatabaseHelper() {
    if (_instance == null) {
      _instance = DatabaseHelper._();
    }
    return _instance!;
  }

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'quiz_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE sessions(
            idSession INTEGER PRIMARY KEY,
            finished INTEGER
          );
        ''');

        await db.execute('''
          CREATE TABLE questions(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sessionId INTEGER,
            question TEXT,
            options TEXT,
            correctAnswer INTEGER,
            FOREIGN KEY (sessionId) REFERENCES sessions(idSession)
          );
        ''');
      },
    );
  }

  Future<void> insertSessions(List<SessionQuestions> sessions) async {
    final db = await database;
    for (var session in sessions) {
      await db.insert('sessions', {
        'idSession': session.idSession,
        'finished': session.finished,
      });

      for (var question in session.questions) {
        await db.insert('questions', {
          'sessionId': session.idSession,
          'question': question.question,
          'options': question.options.join(';'),
          'correctAnswer': question.correctAnswer,
        });
      }
    }
  }
  
}


class SessionQuestions {
  final int idSession;
  final int finished;
  final List<Question> questions;

  SessionQuestions({
    required this.idSession,
    required this.finished,
    required this.questions,
  });

  Map<String, dynamic> toMap() {
    return {
      'idSession': idSession,
      'finished': finished,
      'questions': questions.map((question) => question.toMap()).toList(),
    };
  }
}

class Question {
  final int sessionId;
  final String question;
  final List<String> options;
  final int correctAnswer;

  Question({
    required this.sessionId,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  Map<String, dynamic> toMap() {
    return {
      'sessionId': sessionId,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }
}


