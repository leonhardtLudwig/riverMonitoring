import './reach.dart';
class River{
  String name;
  DateTime date;
  int nReaches;
  List<Reach>reaches;
  String notes;
  River(this.name,this.date,this.nReaches,this.notes){
    reaches = [];
    for(int i = 0; i<nReaches;i++){
      reaches.add(new Reach((i+1).toString(),0));
    }
  }
}