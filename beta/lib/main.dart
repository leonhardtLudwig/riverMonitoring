import 'package:beta/screens/new_monitoring_screen.dart';
import 'package:flutter/material.dart';
import './models/app_theme.dart';
import './widgets/add_button.dart';
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
        '/screens/new_monitoring_screen':(ctx)=>NewMonitoringScreen(),
        '/screens/new_river':(ctx)=>NewRiver(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoraggio di un corso d\'acqua'),
      ),
      body: SingleChildScrollView(
        
        
      ),
      floatingActionButton: AddButton(),
      
    );
  }
}

