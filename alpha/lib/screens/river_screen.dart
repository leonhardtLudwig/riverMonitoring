import 'package:flutter/material.dart';
import '../models/river.dart';

class RiverScreen extends StatelessWidget {
  List<River> rivers;
  RiverScreen(name, date, nReaches, notes) {
    addRiver(new River(
      date: date,
      reachesNum: nReaches,
      notes: notes,
      riverName: name,
    ));
  }
  void addRiver(River r) {
    rivers.add(new River(
      riverName: r.riverName,
      date: r.date,
      reachesNum: r.reachesNum,
      notes: r.notes,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(title: rivers.elementAt(0).riverName),
      ),
      body: Center(child: Text('ciao')),
    );
  }
}
