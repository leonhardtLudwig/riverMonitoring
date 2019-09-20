import 'dart:convert';
import './section.dart';
class Sample{
  Section section;
  String name;
  String notes;
  bool firstTime;
  var data = {
    'Dist':[],
    'Asse B':[],
    'Notes':[],
  };
  
  Sample(this.name,this.section,this.notes,this.firstTime);
  //json.encode(_data);

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