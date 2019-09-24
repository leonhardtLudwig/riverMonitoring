import 'dart:convert';
import './section.dart';
class Sample{
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
  
  Sample(this.name,this.section,this.notes,this.firstTime);
  

}