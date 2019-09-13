import './reach.dart';
class River{
  String name;
  DateTime date;
  int nReaches;
  List<Reach>reaches;
  String notes;
  River(this.name,this.date,this.nReaches,this.notes){
    reaches = [];
  }
}