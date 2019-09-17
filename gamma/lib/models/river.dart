import './reach.dart';
class River{
  String name;
  DateTime date;
  int nReaches;
  List<Reach>reaches;
  String notes;
  River(this.name,this.date,this.nReaches,this.notes){
    reaches = [];
  }
  Map<String, dynamic> toJson() => _riverToJson(this);
  Map<String, dynamic> _riverToJson(River instance) {
    return <String, dynamic>{
      'name': instance.name,
      'nReaches': instance.nReaches,
      'notes': instance.notes,
      'date': instance.date,
      'reaches': _reaToJSON(),
      //'samples': instance.samples, //TO JSON
    };
  }
  List<Map<dynamic,dynamic>> _reaToJSON(){
    List<Map<dynamic,dynamic>> l = [];
    for(int i = 0; i<reaches.length; i++){
      l.add(reaches.elementAt(i).toJson());
    }
    return l;
  }
}