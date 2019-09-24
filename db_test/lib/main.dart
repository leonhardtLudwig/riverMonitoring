import 'package:flutter/material.dart';
import './models/river.dart';
import './models/reach.dart';
import './db_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int reachCounter = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final piave = River(counter++, 'Piave', DateTime.now(), 1, '', List<Reach>());
    final brenta = River(counter++, 'Brenta', DateTime.now(), 5, '', List<Reach>());
    DBController.db.initDB();
    DBController.db.insertRiver(piave);
    DBController.db.insertRiver(brenta);
    final r = DBController.db.rivers();
    /*r.then((rivs) {
      print(rivs.length);
      for (int i = 0; i < rivs.length; i++) {
        print(rivs.elementAt(i).name);
      }
    });*/

    return Scaffold(
      appBar: AppBar(
        title: Text('db test'),
      ),
      body: Center(
        child: Text('ok'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final r = Reach(counter+(reachCounter++),'1',2,piave.id,/*piave,*/'',true);
          DBController.db.insertReach(r);
          final rs = DBController.db.reaches();
          /*rs.then((reaches){
            print(reaches.length);
            for (int i = 0; i < reaches.length; i++) {
              print(reaches.elementAt(i).name);
            } 
          });*/

          
          /*final po = River(counter++, 'Po number ${counter-1}', DateTime.now(), 0, '', List<Reach>());
          //DBController.db.deleteRiver(counter-1);
          final r = DBController.db.rivers();
          r.then((rivs) {
            print(rivs.length);
            for (int i = 0; i < rivs.length; i++) {
              print(rivs.elementAt(i).name);
            }
          });*/
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
