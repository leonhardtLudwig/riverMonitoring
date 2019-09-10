import './sample.dart';
class Section{
  String name;
  int nSample;
  List<Sample>samples;
  Section(this.name,this.nSample){
    samples = [];
  }
}