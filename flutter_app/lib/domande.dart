import 'package:flutter/material.dart';
class Domande extends StatelessWidget {
  final String testoDomanda;
  Domande(this.testoDomanda);
  @override
  Widget build(BuildContext context) {
    return Text(testoDomanda);
  }
}