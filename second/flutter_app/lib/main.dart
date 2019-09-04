import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //String titleInput;
  //String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Monitoraggio di un corso d\'acqua'),
        ),
        body: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              UserTransactions(),
            ],
          ),
        ));
  }
}
