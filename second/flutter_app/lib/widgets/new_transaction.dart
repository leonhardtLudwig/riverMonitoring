import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTx;

  NewTransaction(this._addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  bool hasOnlyBlank(String s){
    //se è vuota è come se ci fossero solo spazi
    if(s.isEmpty){
      return true;
    }else{
      bool noB = true;
      for(int i = 0; noB && i<s.length ;i++){
        noB = s[i]==' ';
      }
      return noB;
    }

  }

  void _submit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(valueController.text);
    if((enteredTitle.isEmpty||hasOnlyBlank(enteredTitle))||enteredAmount<=0)return;
    widget._addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();

  }

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
              onSubmitted: (_){_submit();},
              //onChanged: (String value) => titleInput = value,
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_){_submit();},
              //onChanged: (String value) => amountInput = value,
            ),
            Container(
              alignment: Alignment.centerRight,
              //margin: EdgeInsets.only(right: 5),
              child: FlatButton(
                child: Text(
                  'Add transaction',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: _submit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
