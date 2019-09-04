import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
/*void main(){//viene lanciato subito all'avvio dell'app  
  runApp(MyApp());//runApp è un metodo del package flutter/material.dart
                  //prende un widget che abbiamo creato e lo disegna sullo schermo
                  //in poche parole chiama il metodo build
}
*/

void main() => runApp(MyApp());

//ogni widget in flutter deve estendere stateful widget o stateless widget
final _questions = const [
  {
    'domanda': 'Come ti chiami?',
    'risposta': [
      {'text':'TaxiB','score':6},
      {'text':'Chiello','score':4},
      {'text':'Sapobully4L','score':10},
      {'text':'Greg Willen','score':2},
      {'text':'Ketama126','score':8},
    ],
  },
  {
    'domanda': 'Qual è il tuo livello di swag?',
    'risposta': [
      {'text':'Dice che sono 4L','score':10},
      {'text':'Ho 3 g sull\' iphone ma non sono i giga','score':8},
      {'text':'Pijate sta mazzetta','score':2},
      {'text':'Bello figo','score':5},
    ],
  },
  {
    'domanda': 'Sei uno snitch?',
    'risposta': [
      {'text':'No homie che cazzo hai in testa','score':5},
      {'text':'No snitch non farlo ancora','score':5},
      {'text':'Sul beat il pit è sciolto','score':5},
      {'text':'COCAINA NELLA CUKI','score':10},
    ],
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
  var totalScore = 0;

  void _risposta(int score) {
    /*print('indexDomande=${indexDomande}');
    print('Risposta selezionata');*/
    totalScore +=score;
    setState(() {
      indexDomande++;
    });
  }

  void _restart() {
    setState(() {
      indexDomande = 0;
      totalScore = 0;
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
        body: indexDomande < _questions.length
            ? Quiz(
                _risposta,
                _questions,
                indexDomande,
              )
            : Result(
                _restart,
                totalScore,
              ),
      ),
    );
  }
}
