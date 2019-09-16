import './section.dart';
class Sample{
  Section section;
  String name;
  String notes;
  bool firstTime;
  var data = {
    'Dist':[],
    'Asse B':[],
    'Notes':[],
  };
  Sample(this.name,this.section,this.notes){
    firstTime = true;
  }
}