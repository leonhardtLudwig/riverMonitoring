//packages
import 'package:beta/screens/new_monitoring_screen.dart';
import 'package:beta/widgets/river_list.dart';
import 'package:flutter/material.dart';

//models
import './models/app_theme.dart';
import './models/river.dart';

//widgets
import './widgets/add_button.dart';


//screens
import './screens/new_river.dart';

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
        'homePage': (ctx) => HomePage(),
      },
    );
  }
}

List<River>rivers = [
  new River('Piave',DateTime.now(),2,'')
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('River Monitoring'),
      ),
      body: RiverList(rivers),
      floatingActionButton: AddButton(),
    );
  }
}
