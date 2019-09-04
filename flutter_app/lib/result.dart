import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function cb;
  final int resultScore;

  Result(this.cb, this.resultScore);

  String get resulPhrase {
    return resultScore == 30
        ? 'SO CHE MUOVI ARMI E DROOGA'
        : 'cuck come stile di vita insomma';
  }

  @override
  Widget build(BuildContext context) {
    /*return Center(
      child: Container(
        child: RaisedButton(
          child: Text(
            resulPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          onPressed: cb,
          color: Colors.greenAccent,
          textColor: Colors.white,
        ),
        width: double.infinity,
      ),
    );*/
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              resulPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              child: FlatButton(
                child: Text('riprova '),
                onPressed: cb,
                color: Colors.greenAccent,
                textColor: Colors.white,
              ),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
