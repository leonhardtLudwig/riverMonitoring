import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  

  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final Function _addTx;


  NewTransaction(this._addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (String value) => titleInput = value,
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (String value) => amountInput = value,
            ),
            Container(
              alignment: Alignment.centerRight,
              //margin: EdgeInsets.only(right: 5),
              child: FlatButton(
                child: Text(
                  'Add transaction',
                  style: TextStyle(color: Colors.deepPurple),
                ),
                onPressed: () {
                  _addTx(titleController.text,double.parse(valueController.text));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
