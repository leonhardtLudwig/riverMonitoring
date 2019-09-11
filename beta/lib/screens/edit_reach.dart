import 'package:beta/models/section.dart';
import 'package:flutter/material.dart';
import '../models/reach.dart';

Reach _reach;

class EditReach extends StatefulWidget {
  EditReach(Reach r) {
    _reach = r;
  }
  @override
  _EditReachState createState() => _EditReachState();
}

class _EditReachState extends State<EditReach> {
  final nameController = TextEditingController();
  final sectionsController = TextEditingController();
  final notesController = TextEditingController();
  final String oldNotes = _reach == null ? '' : _reach.notes;

  void _submit(String name, int nSec, String notes) {
    _reach.name = name == '' ? _reach.name : name;
    if (nSec != 0) {
      _reach.nSections = nSec;

      for (int i = _reach.sections.length; i < nSec; i++) {
        print('i.toString() ${i.toString()}');
        _reach.sections.add(Section(name, 0, _reach));
      }
    }
    _reach.notes = notes == '' ? _reach.notes : notes;
    _reach.firstTime = false;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing "Reach ${_reach.name}"'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            TextField(
              controller: nameController,
              decoration:
                  InputDecoration(labelText: 'Name', hintText: _reach.name),
            ),
            TextField(
              controller: sectionsController,
              decoration: InputDecoration(
                  labelText: 'Number of sections',
                  hintText: _reach.nSections.toString()),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: notesController,
              decoration:
                  InputDecoration(labelText: 'Notes', hintText: _reach.notes),
              maxLines: 5,
              onTap: () {
                notesController.text = oldNotes;
              },
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {
                  _submit(
                      nameController.text,
                      sectionsController.text == ''
                          ? 0
                          : int.parse(sectionsController.text),
                      notesController.text);
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
