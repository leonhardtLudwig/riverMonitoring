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

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    DBController.db.initDB();
    DBController.db.downloadRivers().then((rivs){
      for(int i = 0; i<rivs.length;i++){
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
  HomePage() {
    
    //rivers = DBController.db.rivers((r){});
/*
    DBController.db.rivers().then((r) {
      List<Reach> listReach;
      for (int i = 0; i < r.length; i++) {
        DBController.db.getReachByRiverID(r.elementAt(i).id).then((List<Reach>re){
          for(int j = 0; j<re.length;j++){
            listReach.add(re.elementAt(i));
          }
        });
        r.elementAt(i).reaches=listReach;
        rivers.add(r.elementAt(i));
        //rivers.elementAt(i).reaches.add(reach);
        //print(rivers.elementAt(i).id);
      }
      riverCounter = r.length;
    });*/

    /*if(rivers!=null){for (int i = 0; i < rivers.length; i++) {
      for (int j = 0; j < rivers.elementAt(0).nReaches; j++) {
        rivers
            .elementAt(i)
            .reaches
            .add(new Reach((j + 1).toString(), 0, rivers.elementAt(i), '',true));
      }
    }}*/
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    /*if(rivers == null){
      //rivers = List<River>();
      DBController.db.rivers().then((r){
      for(int i = 0; i<r.length;i++){
        rivers.add(r.elementAt(i));
      }
      river_counter = r.length;
    });
    }*/
    final appBar = AppBar(
      title: Text('River Monitoring'),
    );
    return Scaffold(
      appBar: appBar,
      body: RiverList(rivers),
      floatingActionButton: AddButton(),
    );
  }
}
