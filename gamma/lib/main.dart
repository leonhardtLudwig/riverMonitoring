//packages
import 'package:gamma/screens/info_reach.dart';
import 'package:gamma/screens/new_monitoring_screen.dart';
import 'package:gamma/widgets/river_list.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import './utils/database_helper.dart';
//models
import './models/app_theme.dart';
import './models/river.dart';
import './models/reach.dart';

//widgets
import './widgets/add_button.dart';
import 'package:sqflite/sqflite.dart';

//screens
import './screens/new_river.dart';
import './screens/info_river.dart';
import './screens/info_reach.dart';
import './screens/info_section.dart';
import './screens/info_sample.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
        home: HomePage(),
        title: 'River Monitoring',
        theme: AppTheme.defTheme(),
        routes: {
          '/screens/new_monitoring_screen': (ctx) => NewMonitoringScreen(),
          '/screens/new_river': (ctx) => NewRiver(),
          '/screens/info_river': (ctx) => InfoRiver(),
          '/screens/info_reach': (ctx) => InfoReach(),
          '/screens/info_section': (ctx) => InfoSection(),
          '/screens/info_sample': (ctx) => InfoSample(),
          'homePage': (ctx) => HomePage(),
        },
      
    );
  }
}
//DatabaseHelper databaseHelper = DatabaseHelper();
List<River> rivers;
int count = 0;
/*List<River> rivers = [
  new River(
    'Piave',
    DateTime.now(),
    2,
    'Questo è un test\nper vedere se\nle note funzionano',
  )
];*/




class HomePage extends StatefulWidget {
  HomePage() {
    if(rivers!=null){for (int i = 0; i < rivers.length; i++) {
      for (int j = 0; j < rivers.elementAt(0).nReaches; j++) {
        rivers
            .elementAt(i)
            .reaches
            .add(new Reach((j + 1).toString(), 0, rivers.elementAt(i), ''));
      }
    }}
  }
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  /*void updateListView(List<River>r){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<River>> futureRivers = databaseHelper.getRiversList();
      futureRivers.then((rivers){
        setState(() {
          r = rivers;
        });
      });
    });
  }*/
  /*RiverBloc _riverBloc;

   @override
  void initState() {
    super.initState();
    _riverBloc = BlocProvider.of<RiverBloc>(context);
    _riverBloc.dispatch(LoadRivers());
  }*/

  @override
  Widget build(BuildContext context) {
    if(rivers == null){
      rivers = List<River>();
    }
    updateListView(rivers);
    final appBar = AppBar(
      title: Text('River Monitoring'),
    );
    return Scaffold(
      appBar: appBar,
      body: RiverList(rivers),
      floatingActionButton: AddButton(/*rivers*/),
    );
  }
}
