//packages
import 'package:gamma/db_controller.dart';
import 'package:gamma/screens/info_reach.dart';
import 'package:gamma/screens/new_monitoring_screen.dart';
import 'package:gamma/widgets/river_list.dart';
import 'package:flutter/material.dart';

//models
import './models/app_theme.dart';
import './models/river.dart';

//widgets
import './widgets/add_button.dart';

//screens
import './screens/new_river.dart';
import './screens/info_river.dart';
import './screens/info_reach.dart';
import './screens/info_section.dart';
import './screens/info_sample.dart';

void main() => runApp(MyApp());
bool _justStarted = true;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBController.db.initDB();
    DBController.db.downloadRivers().then((rivs) {
      for (int i = 0; i < rivs.length; i++) {
        rivers.add(rivs.elementAt(i));
        River.counter++;
      }
    });

    return MaterialApp(
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

List<River> rivers = [];

class HomePage extends StatefulWidget {
  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    final appBar = AppBar(
      title: Text('River Monitoring'),
    );
    return !_justStarted
        ? Scaffold(
            appBar: appBar,
            body: RiverList(rivers),
            floatingActionButton: AddButton(),
          )
        : Scaffold(
            appBar: appBar,
            body: Center(
              child: Container(
                child: FlatButton(
                  color: Theme.of(context).accentColor,
                  child: Text('Start',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    setState(() {
                     _justStarted = false; 
                    });
                  },
                ),
              ),
            ),
          );
  }
}
