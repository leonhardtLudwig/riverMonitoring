import './section.dart';
import './river.dart';

class Reach {
  int get id{
    return _id;
  }
  int _id;
  
  String name;
  int nSections;
  String notes;

  List<Section> sections;
  River river;
  int river_id;
  bool firstTime;
  Reach(this._id,this.name, this.nSections,this.river_id, /*this.river,*/ this.notes, this.firstTime) {
    //firstTime = true;
    sections = [];
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
