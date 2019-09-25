import 'package:flutter/material.dart';
import 'package:gamma/models/sample.dart';

Map<String, List> _data;
Sample s;

class AddNewData extends StatefulWidget {
  AddNewData(Sample sample) {
    s = sample;
    _data = sample.data;
  }
  @override
  _AddNewDataState createState() => _AddNewDataState();
}

class _AddNewDataState extends State<AddNewData> {
  final distController = TextEditingController();
  final asseBController = TextEditingController();
  final notesController = TextEditingController();

  void _submit(String dist, String asseB,String notes){
    _data['Dist'].add(dist);
    _data['Asse B'].add(asseB);
    _data['Notes'].add(notes);
    s.infoCounter++;
    //json.encode(_data);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adding new data'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: distController,
                  decoration: InputDecoration(labelText: 'Dist'),
                ),
                TextField(
                  controller: asseBController,
                  decoration: InputDecoration(labelText: 'Asse B'),
                ),
                TextField(
                  controller: notesController,
                  decoration: InputDecoration(labelText: 'Notes'),
                  maxLines: 5,
                ),
                Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {

                    _submit(distController.text, asseBController.text,notesController.text);
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
        ));
  }
}
