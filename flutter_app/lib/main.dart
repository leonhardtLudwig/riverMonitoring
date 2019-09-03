import 'package:flutter/material.dart';


import './domande.dart';
/*void main(){//viene lanciato subito all'avvio dell'app  
  runApp(MyApp());//runApp è un metodo del package flutter/material.dart
                  //prende un widget che abbiamo creato e lo disegna sullo schermo
                  //in poche parole chiama il metodo build
}
*/

void main() => runApp(MyApp());

//ogni widget in flutter deve estendere stateful widget o stateless widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }  
}
class MyAppState extends State<MyApp>{
  var domande = ['Come ti chiami?','Qual è il tuo colore preferio?','Ti piacciono i cani?'];
  var indexDomande = 0;
  void risposta(){
    print('indexDomande=${indexDomande}');
    print('Risposta selezionata');
    setState(() {
      indexDomande = (indexDomande+1)%domande.length;  
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
        body: Column(
          children: [
            Domande(domande[indexDomande]),
            RaisedButton(
              child: Text('Risposta 1'),
              onPressed: risposta,
            ),
            RaisedButton(
              child: Text('Risposta 2'),
              onPressed: risposta,
            ),
            RaisedButton(
              child: Text('Risposta 3'),
              onPressed: risposta,
            ),
          ],
        ),
      ),
    );
  }
}
