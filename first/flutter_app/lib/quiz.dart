import 'package:flutter/material.dart';
import './domande.dart';
import './risposte.dart';

class Quiz extends StatelessWidget {
  final Function cb;
  final List<Map<String,Object>> questions;
  final int indexDomande;
  Quiz(this.cb,this.questions,this.indexDomande);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Domande(
          questions[indexDomande]['domanda'],
        ),
        ...(questions[indexDomande]['risposta'] as List<Map<String,Object>>).map((risp) {
          return Risposte(risp['text'], ()=>cb(risp['score']));//se voglio usare una funzione callback con tanto
                                                  //di argomento devo creare una funzione anonima e
                                                  //nel body della funzione metto la funzione con 
                                                  //argomento che voglio eseguire
        }).toList()
      ],
    );
  }
}
