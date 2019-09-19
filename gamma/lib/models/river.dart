import './reach.dart';
import 'dart:convert';
class River{
  

  String name;
  DateTime date;
  int nReaches;
  List<Reach>reaches;
  String notes;
  River(this.name,this.date,this.nReaches,this.notes,this.reaches);

  
  Map<String, dynamic> toJson() => _riverToJson(this);

  Map<String, dynamic> _riverToJson(River instance) {
    
    return <String, dynamic>{
      '"name"': '"${instance.name}"',
      '"nReaches"': instance.nReaches,
      '"notes"': '"${instance.notes}"',
      '"date"': '"${instance.date}"',
      '"reaches"': _reaToJSON(),
    };
  }

  /*static River fromMap(Map<String, dynamic> map) {
    return River(
      map['name'],
      map['date'],
      map['nReaches'],
      map['notes'],
      map['reaches'],
    );
  }*/

  List<Map<dynamic,dynamic>> _reaToJSON(){
    List<Map<dynamic,dynamic>> l = [];
    for(int i = 0; i<reaches.length; i++){
      l.add(reaches.elementAt(i).toJson());
    }
    return l;
  }

  
  River.fromMapObject(Map<String,dynamic>map){
    this.name=map['name'];
    this.date=DateTime.parse(map['date']);
    this.nReaches=map['nReaches'];
    this.notes=map['notes'];
    this.reaches=reaList(map['reaches']);
    /*for(int i = 0; i<this.reaches.length;i++){
      for(int j = 0; j<this.reaches.elementAt(i).sections.length;j++){
      this.reaches.elementAt(i).sections.add(Reach.fromMapObject(map));
      }
    }*/
  }
  
  Reach mapToReach(Map el, int index){
    print(el.length);
    return new Reach(el[index]['name'],el[index]['nSections'],this,el[index]['notes'],el[index]['firstTime']);
  }

  List<Reach> reaList(List<dynamic> l){
    List<Reach> reaList = [];
    final Map parsed = l.asMap();
    Reach signUp;
    for(int i = 0; i<nReaches;i++){
      signUp = mapToReach(parsed,i);
      reaList.add(signUp);
    }
    return reaList;
  }
}