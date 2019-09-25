import 'package:gamma/models/section.dart';
import 'package:gamma/models/sample.dart';
import './reach.dart';

class River {
  static int counter = 0;
  int _id;
  String name;
  DateTime date;
  int nReaches;
  List<Reach> reaches;
  String notes;
  River(this._id,this.name, this.date, this.nReaches, this.notes, this.reaches);

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

  int get id{
    return _id;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': name,
      'date': date.toIso8601String(),
      'nReaches': nReaches,
      'notes': notes,
    };
  }

  List<Map<dynamic, dynamic>> _reaToJSON() {
    List<Map<dynamic, dynamic>> l = [];
    for (int i = 0; i < reaches.length; i++) {
      l.add(reaches.elementAt(i).toJson());
    }
    return l;
  }

  River.fromMapObject(Map<String, dynamic> map) {
    this.name = map['name'];
    this.date = DateTime.parse(map['date']);
    this.nReaches = map['nReaches'];
    this.notes = map['notes'];
    this.reaches = reaList(map['reaches']);
    /*for(int i = 0; i<this.reaches.length;i++){
      for(int j = 0; j<this.reaches.elementAt(i).sections.length;j++){
      this.reaches.elementAt(i).sections.add(Reach.fromMapObject(map));
      }
    }*/
  }

  Reach mapToReach(Map el, int index) {
    //print(el.length);
    Reach r = new Reach(index,el[index]['name'], el[index]['nSections'], this.id,
        el[index]['notes'], el[index]['firstTime']);
    final sec = el[index]['sections'];
    List sam;
    Section section;
    Sample sample;

    for (int i = 0; i < r.nSections; i++) {
      section = new Section(sec[i]['id'],sec[i]['name'], sec[i]['nSample'], r.id,
          sec[i]['notes'], sec[i]['firstTime']);
      sam = sec[i]['samples'];

      if (section.nSample != null) {
        for (int j = 0; j < section.nSample; j++) {
          sample = sam.length != 0
              ? new Sample(Sample.counter++,
                  sam[j]['name'], section.id, sam[j]['notes'], sam[j]['firstTime'])
              : null;
          if (sample == null) {
            section.samples
                .add(new Sample(Sample.counter++,(j + 1).toString(), section.id, '', true));
          } else {
            sample.morpho = sam[j]['morpho'];
            sample.length = sam[j]['length'];
            sample.depth = sam[j]['depth'];
            sample.altitude = sam[j]['altitude'];
            sample.process = sam[j]['process'];
            sample.rilevamento = sam[j]['rilevamento'];
            sample.color = sam[j]['color'];
            sample.data['Dist'] = sam[j]['data']['Dist'];
            sample.data['Asse B'] = sam[j]['data']['Asse B'];
            sample.data['Notes'] = sam[j]['data']['Notes'];
            section.samples.add(sample);
          }
        }
      }
      r.sections.add(section);
    }
    return r;
  }

  List<Reach> reaList(List<dynamic> l) {
    List<Reach> reaList = [];
    final Map parsed = l.asMap();

    Reach signUp;
    for (int i = 0; i < nReaches; i++) {
      signUp = mapToReach(parsed, i);
      reaList.add(signUp);
    }
    return reaList;
  }

  

}
