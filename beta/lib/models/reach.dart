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
  void initSection(int index,int nS){
    if(index<nSections){
      sections.elementAt(index).nSample = nS;
    }else{
      return;
    }
  }
}