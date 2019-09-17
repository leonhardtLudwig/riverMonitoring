//packages
import 'dart:convert';

import 'package:gamma/river_bloc/river_event.dart';
import 'package:gamma/screens/info_reach.dart';
import 'package:gamma/screens/new_monitoring_screen.dart';
import 'package:gamma/widgets/river_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './river_bloc/river_bloc.dart';

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
import './screens/info_sample.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
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
        '/screens/info_sample':(ctx)=>InfoSample(),
        'homePage': (ctx) => HomePage(),
      },
    );*/
    return BlocProvider(
      bloc: RiverBloc(),
      child: MaterialApp(
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
      ),
    );
  }
}

List<River> rivers = [
  /*new River(
    'Piave',
    DateTime.now(),
    2,
    'Questo è un test\nper vedere se\nle note funzionano',
  )*/
];

class HomePage extends StatefulWidget {
  HomePage() {
    for (int i = 0; i < rivers.length; i++) {
      for (int j = 0; j < rivers.elementAt(0).nReaches; j++) {
        rivers
            .elementAt(i)
            .reaches
            .add(new Reach((j + 1).toString(), 0, rivers.elementAt(i), ''));
      }
    }
  }
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  RiverBloc _riverBloc;

   @override
  void initState() {
    super.initState();
    // Obtaining the FruitBloc instance through BlocProvider which is an InheritedWidget
    _riverBloc = BlocProvider.of<RiverBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading fruits right from the start.
    _riverBloc.dispatch(LoadRivers());
  }

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
