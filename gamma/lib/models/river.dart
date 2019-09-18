import './reach.dart';
class River{
  int _id;

  String name;
  DateTime date;
  int nReaches;
  List<Reach>reaches;
  String notes;
  River(this.name,this.date,this.nReaches,this.notes,this.reaches);

  int get id{
    return _id;
  }
  //Map<String, dynamic> toJson() => _riverToJson(this);

  /*Map<String, dynamic> _riverToJson(River instance) {
    if(_id=null){
      
    }
    return <String, dynamic>{
      'id':_id,
      'name': instance.name,
      'nReaches': instance.nReaches,
      'notes': instance.notes,
      'date': instance.date,
      'reaches': _reaToJSON(),
      //'samples': instance.samples, //TO JSON
    };
  }*/

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

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic> ();
    if(_id!=null){
      map['id']=_id;
    }
    map['name']=name;
    map['date']=date.toString();
    map['nReaches']=nReaches;
    map['notes']=notes;
    //map['reaches']=_reaToJSON();
    return map;
  }
  
  River.fromMapObject(Map<String,dynamic>map){
    this._id=map['id'];
    this.name=map['name'];
    this.date=map['date'];
    this.nReaches=map['nReaches'];
    this.notes=map['notes'];
    this.reaches=map['reaches'];
  }
  
}