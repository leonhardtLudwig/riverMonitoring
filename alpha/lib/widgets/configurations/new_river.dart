
import 'package:flutter/material.dart';
import 'package:alpha/screens/river_screen.dart';
class NewRiver extends StatelessWidget {
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final reachesController = TextEditingController();
  final notesController = TextEditingController();

  void endInstallation(BuildContext ctx,String name,DateTime date,int nReaches,String notes){
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) {
          return RiverScreen(name,date,nReaches,notes);
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
              //onSubmitted: (_){_submit();},
              //onChanged: (String value) => titleInput = value,
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Data'),
              keyboardType: TextInputType.datetime,
              //onSubmitted: (_){_submit();},
              //onChanged: (String value) => amountInput = value,
            ),
            TextField(
              controller: reachesController,
              decoration: InputDecoration(labelText: 'Numero di sezioni'),
              keyboardType: TextInputType.number,
              //onSubmitted: (_){_submit();},
              //onChanged: (String value) => amountInput = value,
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: 'Note'),
              maxLines: 5,
              //onSubmitted: (_){_submit();},
              //onChanged: (String value) => amountInput = value,
            ),
            Container(
              alignment: Alignment.centerRight,
              //margin: EdgeInsets.only(right: 5),
              child: FlatButton(
                child: Text(
                  'Concludi Installazione',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
  