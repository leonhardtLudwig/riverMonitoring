import 'package:flutter/material.dart';
import '../models/river.dart';

class RiverScreen extends StatefulWidget {
  final List<River> rivers = new List<River>();
  void addRiver(River r) {
    rivers.add(new River(
      riverName: r.riverName,
      date: r.date,
      reachesNum: r.reachesNum,
      notes: r.notes,
    ));
  }

  RiverScreen(name, date, nReaches, notes) {
    print('on this');
    addRiver(new River(
      date: date,
      reachesNum: nReaches,
      notes: notes,
      riverName: name,
    ));
  }

  @override
  _RiverScreenState createState() => _RiverScreenState();
}

class _RiverScreenState extends State<RiverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(child:Text('ok'),color: Colors.amberAccent,title: widget.rivers.elementAt(0).riverName),
      ),
      body: Center(child: Text('ciao')),
    );
  }
}
