import 'package:flutter/material.dart';
import './widgets/add_button.dart';
import './models/app_theme.dart';
import './models/river.dart';
import './widgets/rivers_list.dart';

void main() => runApp(MyApp());
List<River> rivers;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'River Monitoring',
      theme: AppTheme.defTheme(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _addNewRiver(String name, DateTime date, int reaches, String n ) {
    final newR = River(
      //final contiene l'indirizzo di una lista, per modificarla usa
      //i metodi forniti dalla classe List
      riverName: name,
      date: date,
      reachesNum: reaches,
      notes: n,
    );

    setState(() {
      rivers.add(newR);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoraggio di un corso d\'acqua'),
      ),
      body: SingleChildScrollView(
        child: RiversList(rivers),
      ),
      floatingActionButton: AddButton(),
    );
  }
}
