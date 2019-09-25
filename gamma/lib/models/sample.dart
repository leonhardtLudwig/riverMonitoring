import 'dart:convert';
import './section.dart';
class Sample{
  static int counter = 0;
  int _id;
  int section_id;

  int get id{
    return _id;
  }

  int infoCounter;
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
  };
  
  Sample(this._id,this.name,this.section_id,this.notes,this.firstTime){
    infoCounter = 0;
  }
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
    return {
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
  }


  Map<String, dynamic> toJson() => _sampleToJson(this);

  Map<String, dynamic> _sampleToJson(Sample instance) {
    return <String, dynamic>{
      //'"section"':instance.section,//RICORDA IL TOJSON 
      '"name"':'"${instance.name}"',
      '"notes"':'"${instance.notes}"',
      '"firstTime"':instance.firstTime,
      '"data"':json.encode(instance.data),
    };
  }

}