import 'dart:convert';
import './section.dart';
class Sample{
  static int counter = 0;
  int _id;
  int section_id;

  int get id{
    return _id;
  }

  static int infoCounter = 0;
  Section section;

  String name;
  String morpho;
  double length;
  double depth;
  String altitude;
  String process;
  String rilevamento;
  String color;
  String notes;

  bool firstTime;
  var data = {
    'Dist':[],
    'Asse B':[],
    'Notes':[],
    'sample_id':[],
    'id':[],
  };
  
  Sample(this._id,this.name,this.section_id,this.notes,this.firstTime);
  //json.encode(_data);

  /*
   * String name;
  String morpho;
  double length;
  double depth;
  String altitude;
  String process;
  String rilevamento;
  String color;
  String notes;
   */
Map<String, dynamic> toMap() {
    final m = {
      'id': _id,
      'name': name,
      'section_id':section_id,
      'morpho':morpho,
      'length':length,
      'depth':depth,
      'altitude':altitude,
      'process':process,
      'rilevamento':rilevamento,
      'color':color,
      'notes': notes,
      'firstTime':firstTime?1:0,
    };
    return m;
  }


  Map<String, dynamic> toJson() => _sampleToJson(this);

  Map<String, dynamic> _sampleToJson(Sample instance) {
    return <String, dynamic>{
      //'"section"':instance.section,//RICORDA IL TOJSON 
      '"id"':'"${instance.id}"',
      '"name"':'"${instance.name}"',
      '"section_id"':'"${instance.section_id}"',
      '"morpho"':'"${instance.morpho}"',
      '"length"':'"${instance.length}"',
      '"depth"':'"${instance.depth}"',
      '"altitude"':'"${instance.altitude}"',
      '"process"':'"${instance.process}"',
      '"rilevamento"':'"${instance.rilevamento}"',
      '"color"':'"${instance.color}"',
      '"notes"':'"${instance.notes}"',
      '"firstTime"':instance.firstTime,
      '"data"':json.encode(instance.data),
    };
  }

}