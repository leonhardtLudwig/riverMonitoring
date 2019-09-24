import './sample.dart';
import './reach.dart';

class Section {
  int
  String name;
  int nSample; //NON TOCCARE, FUNZIONA COSì COM'è. NON USARE
  String notes;
  bool firstTime;
  List<Sample> samples;
  Reach reach;
  Section(this.name, this.nSample, this.reach, this.notes,this.firstTime) {
    samples = [];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'river_id':river_id,
      'name': name,
      'nSections': nSections,
      'notes': notes,
      'firstTime':firstTime?1:0
    };
  }
}
