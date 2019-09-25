import './sample.dart';
import './reach.dart';

class Section {
  static int counter = 0;
  int _id;
  String name;
  int nSample; //NON TOCCARE, FUNZIONA COSì COM'è. NON USARE
  //int nS;
  String notes;
  int reach_id;
  bool firstTime;
  List<Sample> samples;
  Reach reach;
  Section(this._id,this.name, this.nSample, this.reach_id, this.notes,this.firstTime) {
    samples = [];
  }
  int get id{
    return _id;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': name,
      'nSample': nSample,
      'reach_id':reach_id,
      'notes': notes,
      'firstTime':firstTime?1:0,
    };
  }
  Map<String, dynamic> toJson() => _sectionToJson(this);
  Map<String, dynamic> _sectionToJson(Section instance) {
    return <String, dynamic>{
      '"name"': '"${instance.name}"',
      '"nSample"': instance.nSample,
      '"notes"': '"${instance.notes}"',
      '"firstTime"': instance.firstTime,
      '"samples"': _samToJSON(),
      //'samples': instance.samples, //TO JSON
      //'"reach"': instance.reach, //TO JSON
    };
  }
  List<Map<dynamic,dynamic>> _samToJSON(){
    List<Map<dynamic,dynamic>> l = [];
    for(int i = 0; i<samples.length; i++){
      l.add(samples.elementAt(i).toJson());
    }
    return l;
  }
}
