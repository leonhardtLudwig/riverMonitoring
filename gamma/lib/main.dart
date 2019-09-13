//packages
import 'package:gamma/screens/info_reach.dart';
import 'package:gamma/screens/new_monitoring_screen.dart';
import 'package:gamma/widgets/river_list.dart';
import 'package:flutter/material.dart';

//models
import './models/app_theme.dart';
import './models/river.dart';
import './models/reach.dart';

//widgets
import './widgets/add_button.dart';

//screens
import './screens/new_river.dart';
import './screens/info_river.dart';
import './screens/info_reach.dart';
import './screens/info_section.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'River Monitoring',
      theme: AppTheme.defTheme(),
      routes: {
        '/screens/new_monitoring_screen': (ctx) => NewMonitoringScreen(),
        '/screens/new_river': (ctx) => NewRiver(),
        '/screens/info_river': (ctx) => InfoRiver(),
        '/screens/info_reach': (ctx) => InfoReach(),
        '/screens/info_section':(ctx)=> InfoSection(),
        'homePage': (ctx) => HomePage(),
      },
    );
  }
}

List<River> rivers = [
  new River(
    'Piave',
    DateTime.now(),
    5,
    'Questo è un test\nper vedere se\nle note funzionano',
  )
];

class HomePage extends StatefulWidget {
  /*for(int i = 0; i<river.nReaches;i++){
      rivers.reaches.add(new Reach((i+1).toString(),0,river));
    }*/
  HomePage() {
    for(int i = 0; i<rivers.length;i++){
      for(int j = 0;j<rivers.elementAt(0).nReaches;j++){
      rivers.elementAt(i).reaches.add(new Reach((j+1).toString(), 0, rivers.elementAt(i),''));
      }
    }
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
