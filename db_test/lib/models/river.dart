import './section.dart';
import './sample.dart';
import './reach.dart';
import 'dart:convert';
import '../db_controller.dart';
class River {
  int _id;
  String name;
  DateTime date;
  int nReaches;
  List<Reach> reaches;
  String notes;

  int get id{
    return _id;
  }

  River(
      this._id, this.name, this.date, this.nReaches, this.notes, this.reaches);

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': name,
      'date': date.toIso8601String(),
      'nReaches': nReaches,
      'notes': notes,
    };
  }
  
  //final piave = River(0, 'Piave', DateTime.now(), 1, '', List<Reach>());
  
}
