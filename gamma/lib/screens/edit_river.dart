import 'package:gamma/db_controller.dart';
import 'package:gamma/models/reach.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/river.dart';

River _river;

class EditRiver extends StatefulWidget {
  EditRiver(River r) {
    _river = r;
  }
  @override
  _EditRiverState createState() => _EditRiverState();
}

class _EditRiverState extends State<EditRiver> {
  final nameController = TextEditingController();

  final String oldNotes = _river.notes;

  final reachesController = TextEditingController();

  final notesController = TextEditingController();

  DateTime dateController;

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
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
    Reach reach;
    _river.name = name == '' ? _river.name : name;
    _river.date = date == null ? _river.date : date;
    if (nReaches != 0) {
      _river.nReaches = nReaches;

      for (int i = _river.reaches.length; i < nReaches; i++) {
        //print('i.toString() ${i.toString()}');
        reach =
            Reach(Reach.counter++, (i + 1).toString(), 0, _river.id, '', true);

        _river.reaches.add(reach);
      }
    }
    _river.notes = notes == '' ? _river.notes : notes;
    if (reach != null) DBController.db.insertReach(reach);
    DBController.db.updateRiver(_river);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing "${_river.name}"'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration:
                    InputDecoration(labelText: 'Name', hintText: _river.name),
              ),
              TextField(
                controller: reachesController,
                decoration: InputDecoration(
                    labelText: 'Number of reaches',
                    hintText: _river.nReaches.toString()),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: notesController,
                decoration:
                    InputDecoration(labelText: 'Notes', hintText: _river.notes),
                maxLines: 5,
                onTap: () {
                  notesController.text = oldNotes;
                },
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
                          ? DateFormat('dd/MM/yyyy').format(_river.date)
                          : DateFormat('dd/MM/yyyy').format(dateController),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    _submit(
                        nameController.text,
                        dateController,
                        reachesController.text == ''
                            ? 0
                            : int.parse(reachesController.text),
                        notesController.text);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
