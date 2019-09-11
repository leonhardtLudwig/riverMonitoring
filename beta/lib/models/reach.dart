import './section.dart';
import './river.dart';
class Reach{
  String name;
  int nSections;
  List<Section>sections;
  River river;
  Reach(this.name,this.nSections,this.river){
    sections = [];
    /*for(int i = 0; i<nSections;i++){
      sections.add(new Section(i.toString(),0));
    }*/
  }
  void initSection(int index,int nS){
    if(index<nSections){
      sections.elementAt(index).nSample = nS;
    }else{
      return;
    }
  }
}