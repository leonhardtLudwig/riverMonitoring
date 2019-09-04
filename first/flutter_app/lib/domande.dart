import 'package:flutter/material.dart';
class Domande extends StatelessWidget {
  final String testoDomanda;
  Domande(this.testoDomanda);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Text(
        testoDomanda,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}