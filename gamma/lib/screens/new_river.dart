import 'package:flutter/material.dart';
import 'package:gamma/db_controller.dart';
import 'package:intl/intl.dart';
import '../models/river.dart';
import '../models/reach.dart';

class NewRiver extends StatefulWidget {
  @override
  _NewRiverState createState() => _NewRiverState();
}

class _NewRiverState extends State<NewRiver> {
  final nameController = TextEditingController();

  final reachesController = TextEditingController();

  final notesController = TextEditingController();

  DateTime dateController;

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(3000),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          dateController = pickedDate;
        });
      }
    });
  }

  void _submit(String name, DateTime date, int nReaches, String notes) {
    final rivers = ModalRoute.of(context).settings.arguments as List<River>;
    River r = new River(River.counter++, name, date, nReaches, notes, []);

    rivers.add(r);
    DBController.db.insertRiver(r);
    //_addRiver(context,r);
    for (int i = 0; i < rivers.length; i++) {
      for (int j = 0; j < rivers.elementAt(i).nReaches; j++) {
        Reach reach = new Reach(rivers.elementAt(i).reaches.length,
            (j + 1).toString(), 0, rivers.elementAt(i).id, '', true);
        DBController.db.insertReach(reach);
        rivers.elementAt(i).reaches.add(reach);
      }
    }
    Navigator.of(context).pop();
    //print(Navigator.of(context).pop(rivers.add(new River(name,date,nReaches,notes))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New River'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: reachesController,
              decoration: InputDecoration(labelText: 'Number of reaches'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: 'Notes'),
              maxLines: 5,
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('Date'),
                  onPressed: _datePicker,
                ),
                Container(
                  child: Text(
                    dateController == null
                        ? 'No Date Chosen'
                        : DateFormat('dd/MM/yyyy').format(dateController),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {
                  _submit(nameController.text, dateController,
                      int.parse(reachesController.text), notesController.text);
                }, //RICORDA DA MODIFICARE
                child: Text(
                  'Submit',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
