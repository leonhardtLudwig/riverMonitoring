import 'package:flutter/material.dart';

class NewMonitoringScreen extends StatefulWidget {
  NewMonitoringScreen();

  @override
  _NewMonitoringScreenState createState() => _NewMonitoringScreenState();
}

class _NewMonitoringScreenState extends State<NewMonitoringScreen> {
  final nameController = TextEditingController();

  final notesController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Function;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuovo tipo di monitoraggio'),
      ),
      body: Container(
        margin: EdgeInsets.all(35),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: 'Note'),
              maxLines: 5,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Text('Submit'),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  if (nameController.text == null) return;
                  routeArgs(nameController.text, notesController.text);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
