import './sample.dart';
import './reach.dart';

class Section {
  String name;
  int nSample; //NON TOCCARE, FUNZIONA COSì COM'è. NON USARE
  //int nS;
  String notes;
  bool firstTime;
  List<Sample> samples;
  Reach reach;
  Section(this.name, this.nSample, this.reach, this.notes,this.firstTime) {
    samples = [];
  }

  Map<String, dynamic> toJson() => _sectionToJson(this);
  Map<String, dynamic> _sectionToJson(Section instance) {
    return <String, dynamic>{
      '"name"': '"${instance.name}"',
      '"nS"': instance.nSample,
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
