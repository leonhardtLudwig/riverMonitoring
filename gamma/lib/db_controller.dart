import 'dart:async';

import './models/reach.dart';
import './models/river.dart';
import './models/sample.dart';
import './models/section.dart';
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
  String sampleDataTable =
      "CREATE TABLE sampleData(id INTEGER PRIMARY KEY, sample_id INTEGER, dist TEXT, asseB TEXT, notes TEXT)";

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

      await db.execute(
        sampleDataTable,
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

  //CREATE DATA
  Future<void> insertData(Map<String, String> map) async {
    final Database db = await database;

    await db.insert(
      'sampleData',
      map,
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
        maps[i]['notes'],
        maps[i]['firstTime'] == 1 ? true : false,
      );
    });
  }

  //READ SECTIONS
  Future<List<Section>> sections() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('sections');

    return List.generate(maps.length, (i) {
      return Section(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['nSample'],
        maps[i]['reach_id'],
        maps[i]['notes'],
        maps[i]['firstTime'] == 1 ? true : false,
      );
    });
  }

  //READ SAMPLES
  Future<List<Sample>> samples() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('samples');

    return List.generate(maps.length, (i) {
      Sample s = new Sample(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['section_id'],
        maps[i]['notes'],
        maps[i]['firstTime'] == 1 ? true : false,
      );
      s.morpho =maps[i]['morpho'];
      s.process=maps[i]['process'];
      s.rilevamento=maps[i]['rilevamento'];
      s.depth=maps[i]['depth'];
      s.altitude =maps[i]['altitude'];
      s.color=maps[i]['color'];
      
      return s;
    });
  }

  //READ DATAS
  Future<List<Map<String, String>>> datas() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('sampleData');

    return List.generate(maps.length, (i) {
      Map m = new Map<String, String>();
      m['id'] = maps[i]['id'].toString();
      m['sample_id'] = maps[i]['sample_id'].toString();
      m['dist'] = maps[i]['dist'];
      m['asseB'] = maps[i]['asseB'];
      m['notes'] = maps[i]['notes'];
      return m;
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

  //UPDATE REACH
  Future<void> updateReach(Reach reach) async {
    final db = await database;

    await db.update(
      'reaches',
      reach.toMap(),
      where: "id = ?",
      whereArgs: [reach.id],
    );
  }

  //UPDATE SECTION
  Future<void> updateSection(Section section) async {
    final db = await database;

    await db.update(
      'sections',
      section.toMap(),
      where: "id = ?",
      whereArgs: [section.id],
    );
  }

  //UPDATE SAMPLE
  Future<void> updateSample(Sample sample) async {
    final db = await database;

    await db.update(
      'samples',
      sample.toMap(),
      where: "id = ?",
      whereArgs: [sample.id],
    );
  }

  //UPDATE DATA
  Future<void> updateDataSample(Map<String, String> map) async {
    final db = await database;

    await db.update(
      'sampleData',
      map,
      where: "id = ?",
      whereArgs: [map['id']],
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

  //DELETE REACH
  Future<void> deleteReach(int id) async {
    final db = await database;

    await db.delete(
      'reaches',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  //DELETE SECTION
  Future<void> deleteSection(int id) async {
    final db = await database;

    await db.delete(
      'sections',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  //DELETE SAMPLE
  Future<void> deleteSample(int id) async {
    final db = await database;

    await db.delete(
      'samples',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  //DELETE REACH
  Future<void> deleteDataSample(int id) async {
    final db = await database;

    await db.delete(
      'sampleData',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  //DOWNLOAD RIVERS LOCALLY
  Future<List<River>> downloadRivers() async {
    List<River> rivList = await rivers(); //da id più basso
    List<Reach> reaList =
        await reaches(); //da id più basso e al tempo stesso da river_id
    // più alto
    List<Section> secList = await sections(); //da id più basso in tutto
    List<Sample> samList = await samples();
    final dataList = await datas();
    Reach rea;
    Section sec;
    Sample sam;
    River riv;
    River.counter = rivList.length;
    Reach.counter = reaList.length;
    Section.counter = secList.length;
    Sample.counter = samList.length;
    Sample.infoCounter = dataList.length;

    for (int riverIndex = 0; riverIndex < rivList.length; riverIndex++) {
      riv = rivList.elementAt(riverIndex);

      for (int reaListIndex = 0;reaListIndex < reaList.length;reaListIndex++) {

        rea = reaList.elementAt(reaListIndex);
        if (rea.river_id == riv.id) {//corrisponde il reach al river?
          for (int secListIndex = 0; secListIndex < secList.length; secListIndex++) {
            sec = secList.elementAt(secListIndex);
            if(sec.reach_id==rea.id){//corrisponde la section al reach?
              for(int samListIndex = 0; samListIndex<samList.length;samListIndex++){
                sam = samList.elementAt(samListIndex);
                if(sam.section_id==sec.id){//corrisponde il sample alla section?

                  for(int dataListIndex = 0;dataListIndex<dataList.length;dataListIndex++){
                    if(int.parse(dataList.elementAt(dataListIndex)['sample_id'])==sam.id){
                      sam.data['Dist'].add(dataList.elementAt(dataListIndex)['dist']);
                      sam.data['Asse B'].add(dataList.elementAt(dataListIndex)['asseB']);
                      sam.data['Notes'].add(dataList.elementAt(dataListIndex)['notes']);
                      sam.data['sample_id'].add(dataList.elementAt(dataListIndex)['sample_id']);
                      sam.data['id'].add(dataList.elementAt(dataListIndex)['id']);
                    }
                  }
                  sec.samples.add(sam);//sample corrisposto alla section
                }
              }
              rea.sections.add(sec);//section corrisposta al reach
            }
            
          }
          riv.reaches.add(rea);//reach corrisposto al river
        }
        
      }
    }
    return rivList;
    /*for (int riverIndex = 0; riverIndex < rivList.length; riverIndex++) {
      int reachLength = rivList.elementAt(riverIndex)!=null?rivList.elementAt(riverIndex).nReaches:0;
      for (int reachIndex = 0; reachIndex < reachLength; reachIndex++) {
        if (reaList.elementAt(reachIndex).river_id ==
            rivList.elementAt(riverIndex).id) {
          rea = reaList.elementAt(reachIndex);
        }
        int sectionLength = rea!=null?rea.nSections:0;
        for (int sectionIndex = 0;
            sectionIndex < sectionLength;
            sectionIndex++) {
          if (rea != null &&
              secList.elementAt(sectionIndex).reach_id == rea.id) {
            sec = secList.elementAt(sectionIndex);
          }
          int sampleLength = sec!=null?sec.nSample:0;
          for (int sampleIndex = 0; sampleIndex < sampleLength; sampleIndex++) {
            if (sec != null &&
                samList.elementAt(sampleIndex).section_id == sec.id) {
              sam = samList.elementAt(sampleIndex);
            }
            for (int i = 0; i < dataList.length; i++) {
              
              if (int.parse(dataList.elementAt(i)['sample_id']) == sam.id) {
                sam.data['Dist'].add(dataList.elementAt(i)['dist']);
                sam.data['Asse B'].add(dataList.elementAt(i)['asseB']);
                sam.data['Notes'].add(dataList.elementAt(i)['notes']);
              }
            }
            if(sam!=null)sec.samples.add(sam);
          }
          if(sec!=null)rea.sections.add(sec);
        }
        
        if(rea!=null)rivList.elementAt(riverIndex).reaches.add(rea);
      }
      
    }
    return rivList;*/
  }
}
