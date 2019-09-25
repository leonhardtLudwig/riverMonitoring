import 'package:flutter/material.dart';
import 'package:gamma/db_controller.dart';
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
  final morphoUnitController = TextEditingController();
  final lengthController = TextEditingController();
  final dobController = TextEditingController();
  final gpsAltitudeController = TextEditingController();
  final colorController = TextEditingController();
  String dropDownValueProcess = 'AWS';
  String dropDownValueRilevamento = 'Completo';
  bool chain = false;
  void _submitWithChain(String name, String notes, String morpho, double length,
      double depth, String altitude, String process,String rilevamento,String color) {
    _sample.name = name == '' ? _sample.name : name;
    _sample.notes = notes == '' ? _sample.notes : notes;
    _sample.firstTime = false;
    _sample.length = length;
    _sample.depth = depth;
    _sample.morpho = morpho;
    _sample.altitude = altitude;
    _sample.process = process;
    _sample.rilevamento = rilevamento;
    DBController.db.updateSample(_sample);
    Navigator.of(context).pop();
  }

  void _sumbmitNoChain(String name, String notes, String morpho,String altitude, String process,String rilevamento,String color) {
    _sample.name = name == '' ? _sample.name : name;
    _sample.notes = notes == '' ? _sample.notes : notes;
    _sample.firstTime = false;
    _sample.morpho = morpho;
    _sample.altitude = altitude;
    _sample.process = process;
    _sample.rilevamento = rilevamento;
    DBController.db.updateSample(_sample);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing Sample ${_sample.name}'),
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
                controller: morphoUnitController,
                decoration: InputDecoration(
                    labelText: 'Morphological Unit', hintText: _sample.morpho),
              ),
              TextField(
                controller: colorController,
                decoration: InputDecoration(
                    labelText: 'Color',),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.3),
                child: Row(
                  children: <Widget>[
                    Text('Chain'),
                    Checkbox(
                      value: chain,
                      onChanged: (bool value) {
                        setState(() {
                          chain = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              TextField(
                enabled: chain,
                keyboardType: TextInputType.number,
                controller: lengthController,
                decoration: InputDecoration(
                  labelText: 'Length out of p.c',
                ),
              ),
              TextField(
                enabled: chain,
                controller: dobController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Depth of burial',
                ),
              ),
              /**
               * PROCESSO VERIFICATO MENù A TENDINA
               */
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.5),
                child: Row(
                  children: <Widget>[
                    Text('Verified Process'),
                    DropdownButton<String>(
                      value: dropDownValueProcess,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropDownValueProcess = newValue;
                        });
                      },
                      items: <String>['AWS', 'NM', 'FD', 'GD']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: gpsAltitudeController,
                decoration: InputDecoration(
                  labelText: 'Gps Altitude',
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.3),
                child: Row(
                  children: <Widget>[
                    Text('Verified Process'),
                    DropdownButton<String>(
                      value: dropDownValueRilevamento,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropDownValueRilevamento = newValue;
                        });
                      },
                      items: <String>['Completo', 'Parziale', 'Specifica nelle note']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
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
                    if (chain) {
                      _submitWithChain(
                          nameController.text,
                          notesController.text,
                          morphoUnitController.text,
                          double.parse(lengthController.text),
                          double.parse(dobController.text),
                          gpsAltitudeController.text,
                          dropDownValueProcess,dropDownValueRilevamento,colorController.text);
                    } else {
                       _sumbmitNoChain(
                          nameController.text,
                          notesController.text,
                          morphoUnitController.text,
                          gpsAltitudeController.text,dropDownValueProcess,dropDownValueRilevamento,colorController.text);
                    }
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
