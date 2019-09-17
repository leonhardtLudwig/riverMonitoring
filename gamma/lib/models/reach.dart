import './section.dart';
import './river.dart';
class Reach{
  String name;
  int nSections;
  String notes;

  List<Section>sections;
  River river;
  bool firstTime;
  Reach(this.name,this.nSections,this.river,this.notes){
    firstTime = true;
    sections = [];
  }


  Map<String, dynamic> toJson() => _reachToJson(this);
  Map<String, dynamic> _reachToJson(Reach instance) {
    return <String, dynamic>{
      'name': instance.name,
      'nSections': instance.nSections,
      'notes': instance.notes,
      'firstTime': instance.firstTime,
      'sections': _secToJSON(),
      //'samples': instance.samples, //TO JSON
      'river': instance.river, //TO JSON
    };
  }
  List<Map<dynamic,dynamic>> _secToJSON(){
    List<Map<dynamic,dynamic>> l = [];
    for(int i = 0; i<sections.length; i++){
      l.add(sections.elementAt(i).toJson());
    }
    return l;
  }
}