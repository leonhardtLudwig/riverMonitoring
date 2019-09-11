import './sample.dart';
import './reach.dart';
class Section{
  String name;
  int nSample;
  bool firstTime;
  List<Sample>samples;
  Reach reach;
  Section(this.name,this.nSample,this.reach){
    firstTime = true;
    samples = [];
  }
}