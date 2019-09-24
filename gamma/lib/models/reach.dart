import './section.dart';
import './river.dart';
class Reach{
  int _id;
  int river_id;
  String name;
  int nSections;
  String notes;

  List<Section>sections;
  River river;
  bool firstTime;
  Reach(this._id,this.name,this.nSections,this.river_id,this.notes,this.firstTime){
    //firstTime = true;
    sections = [];
  }

  int get id{
    return _id;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': name,
      'nSections': nSections,
      'river_id':river_id,
      'notes': notes,
      'firstTime':firstTime?1:0,
    };
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
    this._id=map['id'];
    this.river_id=map['river_id'];
    this.name=map['name'];
    this.nSections=map['nSections'];
    this.notes=map['notes'];
    this.firstTime=map['firstTime']==1?true:false;
    //this.sections=secList(map['sections']);
  }
  Section mapToSection(Map el, int index){
    //print(this.river==null);
    return new Section(el[index]['name'],el[index]['nS'],this,el[index]['notes'],el[index]['firstTime']);
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