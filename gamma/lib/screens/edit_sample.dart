import 'package:flutter/material.dart';
import '../models/sample.dart';

Sample _sample;

class EditSample extends StatefulWidget {
  EditSample(Sample s) {
    _sample = s;
  }
  @override
  _EditSampleState createState() => _EditSampleState();
}

class _EditSampleState extends State<EditSample> {
  final nameController = TextEditingController();
  final notesController = TextEditingController();
  final String oldNotes = _sample == null ? '' : _sample.notes;

  void _submit(String name, String notes) {
    _sample.name = name == '' ? _sample.name : name;
    _sample.notes = notes == '' ? _sample.notes : notes;
    _sample.firstTime = false;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing Sample %${_sample.name}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration:
                    InputDecoration(labelText: 'Name', hintText: _sample.name),
              ),
              TextField(
                controller: notesController,
                decoration:
                    InputDecoration(labelText: 'Notes', hintText: _sample.name),
                maxLines: 5,
                onTap: () {
                  notesController.text = oldNotes;
                },
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    _submit(nameController.text, notesController.text);
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
