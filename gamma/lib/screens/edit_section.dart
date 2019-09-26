import 'package:gamma/db_controller.dart';
import 'package:gamma/models/section.dart';
import 'package:flutter/material.dart';
import '../models/sample.dart';

Section _section;

class EditSection extends StatefulWidget {
  EditSection(Section s) {
    _section = s;
  }
  @override
  _EditSectionState createState() => _EditSectionState();
}

class _EditSectionState extends State<EditSection> {
  final nameController = TextEditingController();
  final samplesController = TextEditingController();
  final notesController = TextEditingController();
  final String oldNotes = _section == null ? '' : _section.notes;

  void _submit(String name, int nSam, String notes) {
    _section.name = name == '' ? _section.name : name;
    Sample sam;
    if (nSam != 0) {
      _section.nSample = nSam;
      for (int i = _section.samples.length; i < nSam; i++) {
        //print('i.toString() ${i.toString()}');
        sam = Sample(Sample.counter++,(i+1).toString(), _section.id,'',true);
        if(sam!=null)DBController.db.insertSample(sam);
        _section.samples.add(sam);
        
      }
    }else if(_section.firstTime){_section.nSample = 0;}
    _section.notes = notes == '' ? _section.notes : notes;
    _section.firstTime = false;
    
    DBController.db.updateSection(_section);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing ${_section.name}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
          child: Column(children: <Widget>[
            TextField(
              controller: nameController,
              decoration:
                  InputDecoration(labelText: 'Name', hintText: _section.name),
            ),
            TextField(
              controller: samplesController,
              decoration: InputDecoration(
                  labelText: 'Number of samples',
                  hintText: _section.nSample.toString()),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: notesController,
              decoration:
                  InputDecoration(labelText: 'Notes', hintText: _section.notes),
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
                      samplesController.text == ''
                          ? 0
                          : int.parse(samplesController.text),
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
