import 'dart:async';

import 'package:db_test/models/reach.dart';
import 'package:db_test/models/river.dart';
import 'package:db_test/models/sample.dart';
import 'package:db_test/models/section.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBController {
  /*
    CREAZIONE DI UN SINGLETON PER ASSICURARCI CHE
    CI SIA SOLO UN'ISTANZA DI QUESTA CLASSE
  */
  DBController._();
  static final DBController db = DBController._();

  //SQL STRINGS
  String riverTable =
      "CREATE TABLE rivers(id INTEGER PRIMARY KEY, name TEXT, date TEXT, nReaches INTEGER, notes TEXT)";
  String reachTable =
      "CREATE TABLE reaches(id INTEGER PRIMARY KEY,river_id INTEGER, name TEXT, nSections INTEGER, firstTime BIT, notes TEXT)";
  String sectionTable =
      "CREATE TABLE sections(id INTEGER PRIMARY KEY,reach_id INTEGER, name TEXT, nSample INTEGER, firstTime BIT, notes TEXT)";
  String sampleTable =
      "CREATE TABLE samples(id INTEGER PRIMARY KEY,section_id INTEGER, name TEXT, morpho TEXT, length REAL, depth REAL, altitude TEXT, process TEXT, rilevamento TEXT, color TEXT, firstTime BIT, notes TEXT)";
  //String sampleDataTable = "CREATE TABLE sampleData(id INTEGER PRIMARY KEY, sample_id INTEGER,)";

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        riverTable,
      );

      await db.execute(
        reachTable,
      );

      await db.execute(
        sectionTable,
      );
      await db.execute(
        sampleTable,
      );
    });
  }

  /*
   * CREATE METHODS
   */
  //CREATE RIVER
  Future<void> insertRiver(River river) async {
    final Database db = await database;
    await db.insert(
      'rivers',
      river.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //CREATE REACH
  Future<void> insertReach(Reach reach) async {
    final Database db = await database;

    await db.insert(
      'reaches',
      reach.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //CREATE SECTION
  Future<void> insertSection(Section section) async {
    final Database db = await database;

    await db.insert(
      'sections',
      section.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //CREATE SAMPLE
  Future<void> insertSample(Sample sample) async {
    final Database db = await database;

    await db.insert(
      'samples',
      sample.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /*
   * READ METHODS
   */
  //READ RIVERS
  Future<List<River>> rivers() async {
    
    final Database db = await database;
    //print(db.getVersion().then((onValue){return onValue;}));
    final List<Map<String, dynamic>> maps = await db.query('rivers');

    return List.generate(maps.length, (i) {
      DateFormat();
      return River(
        maps[i]['id'],
        maps[i]['name'],
        DateTime.parse(maps[i]['date']),
        maps[i]['nReaches'],
        maps[i]['notes'],
        [],
      );
    });
  }

  //READ REACHES
  Future<List<Reach>> reaches() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('reaches');

    return List.generate(maps.length, (i) {
      return Reach(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['nSections'],
        maps[i]['river_id'],
        //maps[i],
        maps[i]['notes'],
        maps[i]['firstTime'] == 1 ? true : false,
      );
    });
  }

  /*
   * UPDATE METHODS
   */
  //UPDATE RIVER
  Future<void> updateRiver(River river) async {
    final db = await database;

    await db.update(
      'rivers',
      river.toMap(),
      where: "id = ?",
      whereArgs: [river.id],
    );
  }

  /*
   * DELETE METHODS
   */
  //DELETE RIVER
  Future<void> deleteRiver(int id) async {
    final db = await database;

    await db.delete(
      'rivers',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /*
  *GETTER METHODS
  */
  //GET RIVER
  Future<River> getRiver(int id) async {
  List<Map> results = await db.query("Customer",
      columns: ["id", "first_name", "last_name", "email"],
      where: 'id = ?',
      whereArgs: [id]);

  if (results.length > 0) {
    return new River.fromMap(results.first);
  }

  return null;
}
}
