import './section.dart';
import './river.dart';
class Reach{
  String name;
  int nSections;
  String notes;

  List<Section>sections;
  River river;
  bool firstTime;
  Reach(this.name,this.nSections,this.river,this.notes,this.firstTime){
    //firstTime = true;
    sections = [];
  }


  Map<String, dynamic> toJson() => _reachToJson(this);
  Map<String, dynamic> _reachToJson(Reach instance) {
    return <String, dynamic>{
      '"name"': '"${instance.name}"',
      '"nSections"': instance.nSections,
      '"notes"': '"${instance.notes}"',
      '"firstTime"': instance.firstTime,
      '"sections"': _secToJSON(),
      //'samples': instance.samples, //TO JSON
      //'"river"': instance.river, //TO JSON
    };
  }
  List<Map<dynamic,dynamic>> _secToJSON(){
    List<Map<dynamic,dynamic>> l = [];
    for(int i = 0; i<sections.length; i++){
      l.add(sections.elementAt(i).toJson());
    }
    return l;
  }

  Reach.fromMapObject(Map<String,dynamic>map){
    this.name=map['name'];
    this.nSections=map['nSections'];
    this.notes=map['notes'];
    this.firstTime=map['firstTime'];
    this.sections=secList(map['sections']);
  }
  Section mapToSection(Map el, int index){
    //print(this.river==null);
    return new Section(el[index]['name'],el[index]['nS'],this,el[index]['notes']);
  }
  List<Section> secList(List<dynamic> l){
    List<Section> reaList = [];
    final Map parsed = l.asMap();
    Section signUp;
    for(int i = 0; i<nSections;i++){
      signUp = mapToSection(parsed,i);
      reaList.add(signUp);
    }
    return reaList;
  }
}