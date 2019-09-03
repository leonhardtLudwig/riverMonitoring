import 'package:flutter/material.dart';

import './domande.dart';
import './risposte.dart';
/*void main(){//viene lanciato subito all'avvio dell'app  
  runApp(MyApp());//runApp è un metodo del package flutter/material.dart
                  //prende un widget che abbiamo creato e lo disegna sullo schermo
                  //in poche parole chiama il metodo build
}
*/

void main() => runApp(MyApp());

//ogni widget in flutter deve estendere stateful widget o stateless widget
final questions = const [
  {
    'domanda': 'Come ti chiami?',
    'risposta': ['Franco', 'Leonardo', 'Luigi', 'FRANCO??','Sapobully4L'],
  },
  {
    'domanda': 'Qual è il tuo colore preferito?',
    'risposta': ['Rosa', 'Blu', 'Verde', 'Marrone'],
  },
  {
    'domanda': 'Ti piacciono i cani?',
    'risposta': ['Sì', 'No', 'Forse', 'COSA?'],
  },
];

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //var domande = ['Come ti chiami?','Qual è il tuo colore preferio?','Ti piacciono i cani?'];

  var indexDomande = 0;
  void _risposta() {
    /*print('indexDomande=${indexDomande}');
    print('Risposta selezionata');*/
    setState(() {
      indexDomande++;
    });
  }
  void _restart(){
    setState(() {
      indexDomande=0;
    });  
  }

  @override //ricorda di mettere l'override per pulizia del codice, è già fornito il metodo
  //dalla classe che stiamo estendendo
  Widget build(BuildContext context) {
    //metodo chiamato da flutter
    //return MaterialApp(home: Text('Hello'));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ciao chicco!'),
        ),
        body: indexDomande < questions.length
            ? Column(
                children: [
                  Domande(
                    questions[indexDomande]['domanda'],
                  ),
                  ...(questions[indexDomande]['risposta'] as List<String>)
                      .map((risp) {
                    return Risposte(risp, _risposta);
                  }).toList()
                ],
              )
            : Center(
                child: Container(
                  child: RaisedButton(
                    child: Text('Restart'),
                    onPressed: _restart,
                    color: Colors.greenAccent,
                    textColor: Colors.white,
                  ),
                  width: double.infinity,
                ),
              ),
      ),
    );
  }
}
