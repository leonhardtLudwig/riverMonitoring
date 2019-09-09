//packages
import 'package:beta/screens/new_monitoring_screen.dart';
import 'package:flutter/material.dart';

//models
import './models/app_theme.dart';
import './models/river.dart';

//widgets
import './widgets/add_button.dart';
import './widgets/river_card.dart';

//screens
import './screens/new_river.dart';

void main() => runApp(MyApp());

final List<River> rivers = [
  new River('Piave', DateTime.now(), 2, ''),
];

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addRiver() {
    final routeArgs = ModalRoute.of(context).settings.arguments as River;
    setState(() {
     rivers.add(routeArgs); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('River Monitoring'),
      ),
      body: ListView.builder(
        itemCount: rivers.length,
        itemBuilder: (ctx, index) {
          return RiverCard(rivers.elementAt(index));
        },
      ),
      floatingActionButton: AddButton(),
    );
  }
}
