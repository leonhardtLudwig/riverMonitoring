import 'package:alpha/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:alpha/screens/river_screen.dart';

class NewRiver extends StatefulWidget {
  @override
  _NewRiverState createState() => _NewRiverState();
}

class _NewRiverState extends State<NewRiver> {
  final nameController = TextEditingController();

  DateTime dateController;

  final reachesController = TextEditingController();

  final notesController = TextEditingController();

  String name;

  String date;

  int nReaches;

  String notes;

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

  void _endInstallation(BuildContext ctx, String name, DateTime date,
      int nReaches, String notes) {
    Navigator.pop(
      ctx,
      MaterialPageRoute(
        builder: (_) {
          return HomePage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuova installazione')),
      body: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                onSubmitted: (_) {
                  _endInstallation(
                      context, name, dateController, nReaches, notes);
                },
                onChanged: (String value) => name = value,
              ),

              /*TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Data'),
                keyboardType: TextInputType.datetime,
                onSubmitted: (_) {
                  _endInstallation(context, name, date, nReaches, notes);
                },
                onChanged: (String value) => date = value,
              ),*/
              TextField(
                controller: reachesController,
                decoration: InputDecoration(labelText: 'Numero di sezioni'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) {
                  _endInstallation(
                      context, name, dateController, nReaches, notes);
                },
                onChanged: (String value) => nReaches = int.parse(value),
              ),
              TextField(
                controller: notesController,
                decoration: InputDecoration(labelText: 'Note'),
                maxLines: 5,
                onSubmitted: (_) {
                  _endInstallation(
                      context, name, dateController, nReaches, notes);
                },
                onChanged: (String value) => notes = value,
              ),
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: FlatButton(
                      child: Text(
                        'Data',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: _datePicker,
                    ),
                  ),
                  Container(
                      child: Text(dateController == null
                          ? 'No Date Chosen'
                          : DateFormat('dd/MM/yyyy').format(dateController))),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                //margin: EdgeInsets.only(right: 5),
                child: FlatButton(
                  child: Text(
                    'Concludi Installazione',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: () {
                    _endInstallation(
                        context, name, dateController, nReaches, notes);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
