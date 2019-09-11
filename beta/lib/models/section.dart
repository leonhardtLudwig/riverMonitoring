import './sample.dart';
import './reach.dart';
class Section{
  String name;
  int nSample;
  List<Sample>samples;
  Reach reach;
  Section(this.name,this.nSample,this.reach){
    samples = [];
  }
}