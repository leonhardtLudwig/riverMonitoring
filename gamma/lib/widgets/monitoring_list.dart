import 'package:gamma/main.dart' as prefix0;
import 'package:flutter/material.dart';
import '../models/monitoring.dart';

List<Monitoring> _monitors = [
  new Monitoring('V.V.\nVirtual Velocity', null, 'Virtual Velocity Monitoring'),
  new Monitoring('+', null, 'Create new monitornig settings'),
];

//List<River>rivers;

class MonitoringList extends StatefulWidget {
  /*MonitoringList(rivList){
    rivers = rivList;
  }*/
  @override
  _MonitoringListState createState() => _MonitoringListState();
}

class _MonitoringListState extends State<MonitoringList> {
  void _addMonitoring(String nameController, String notesController) {
    final enteredName = nameController;
    final enteredNotes = notesController;
    if (enteredName == null) return;
    setState(() {
      _monitors.insert(
          _monitors.length - 1,
          new Monitoring(
            enteredName,
            () {
              Navigator.of(context).pushNamed('/screens/new_river');
            },
            enteredNotes,
          ));
    });
  }

  void newMonitoring(BuildContext ctx, List<Monitoring> _monitors) {
    Navigator.of(ctx)
        .pushNamed('/screens/new_monitoring_screen', arguments: _addMonitoring);
  }

  void newRiver(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed('/screens/new_river',arguments: prefix0.rivers );
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < _monitors.length - 1; i++) {
      _monitors.elementAt(i).changeScreenFunction = () {
        newRiver(context);
      };
    }
    _monitors.elementAt(_monitors.length - 1).changeScreenFunction = () {
      newMonitoring(context, _monitors);
    };
    return Container(
      width: 300,
      padding: EdgeInsets.all(35),
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          itemCount: _monitors.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: FlatButton(
                  onPressed: _monitors.elementAt(index).changeScreenFunction,
                  child: Text(
                    _monitors.elementAt(index).name,
                    textAlign: TextAlign.center,
                  ),
                  color: Theme.of(context).accentColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
