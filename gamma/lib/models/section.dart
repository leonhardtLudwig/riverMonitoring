import './sample.dart';
import './reach.dart';
class Section{
  String name;
  int nSample;
  int nS;
  String notes;
  bool firstTime;
  List<Sample>samples;
  Reach reach;
  Section(this.name,this.nSample,this.reach,this.notes){
    firstTime = true;
    samples = [];
  }
}