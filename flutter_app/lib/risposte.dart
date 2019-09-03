import 'package:flutter/material.dart';

int index = 0;

class Risposte extends StatelessWidget {
  final Function cb; //callback
  final String answer;
  Risposte(this.answer, this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(answer),
        onPressed: cb,
        color: Colors.greenAccent,
        textColor: Colors.white,
      ),
      width: double.infinity,
    );
  }
}
