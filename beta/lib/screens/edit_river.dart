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
    //final rivers = ModalRoute.of(context).settings.arguments as List<River>;
    /*Navigator.of(context)
        .pop(rivers.add(new River(name, date, nReaches, notes)));*/
    _river.name = name==''?_river.name:name;
    _river.date = date==null?_river.date:date;
    _river.nReaches = nReaches==0?_river.nReaches:nReaches;
    _river.notes = notes==''?_river.notes:notes;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing "${_river.name}"'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField( 
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name',hintText: _river.name),
            ),
            TextField(
              controller: reachesController,
              decoration: InputDecoration(labelText: 'Number of reaches',hintText: _river.nReaches.toString()),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: 'Notes',hintText: _river.notes),
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
                  
                  _submit(nameController.text, dateController,
                      reachesController.text==''?0:int.parse(reachesController.text), notesController.text);
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
