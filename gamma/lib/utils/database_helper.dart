import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/river.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String riversTable = 'rivers_table';
  String colId = 'id';
  String colName = 'name';
  String colDate = 'date';
  String colNReaches = 'nReaches';
  String colNotes = 'notes';
  String colReaches = 'reaches';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'rivers.db';
    var riversDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return riversDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $riversTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colDate TEXT, $colNReaches INTEGER, $colNotes TEXT, $colReaches TEXT)');
  }

  Future<List<Map<String, dynamic>>> getRiverMapList() async {
    Database db = await this.database;

    //		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(riversTable);
    return result;
  }

  Future<int> insertRiver(River river) async {
		Database db = await this.database;
    //print(river.toMap());
		var result = await db.insert(riversTable, river.toMap());
		return result;
	}

  Future<int> updateRiver(River river) async {
		var db = await this.database;
		var result = await db.update(riversTable, river.toMap(), where: '$colId = ?', whereArgs: [river.id]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> deleteRiver(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $riversTable WHERE $colId = $id');
		return result;
	}

	// Get number of Note objects in database
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $riversTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

  Future<List<River>> getRiversList() async {

		var noteMapList = await getRiverMapList(); // Get 'Map List' from database
		int count = noteMapList.length;         // Count the number of map entries in db table

		List<River> noteList = List<River>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(River.fromMapObject(noteMapList[i]));
		}

		return noteList;
	}

}
