//packages
import 'package:gamma/screens/info_reach.dart';
import 'package:gamma/screens/new_monitoring_screen.dart';
import 'package:gamma/widgets/river_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

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
    //json.decode('{name: ciao, nReaches: 1, notes: weeee, date: 2019-09-19 11:28:29.039153, reaches: [{name: 1, nSections: 0, notes: , firstTime: true, sections: [], river: Instance of \'River\'}, {name: 2, nSections: 0, notes: , firstTime: true, sections: [], river: Instance of \'River\'}]}');
    //rivers.add(River.fromMapObject(json.decode('{name: ciao, nReaches: 1, notes: weeee, date: 2019-09-19 11:28:29.039153, reaches: [{name: 1, nSections: 0, notes: , firstTime: true, sections: [], river: Instance of \'River\'}, {name: 2, nSections: 0, notes: , firstTime: true, sections: [], river: Instance of \'River\'}]}')));
    /*
    NOTE DI COSE DA NON METTERE NEI JSON
    -INSTANCE OF
    
    */
    String riv = '{"name": "ciao zi", "nReaches": 1, "notes": "bb", "date": "2019-09-19 11:49:04.234596", "reaches": [{"name": "1", "nSections": 3, "notes": "", "notes":"test","firstTime": false, "sections": [{"name":"1","nS":1,"notes":"test","firstTime":false,"samples":[]},{"name":"1","nS":1,"notes":"test","firstTime":false,"samples":[]},{"name":"1","nS":1,"notes":"test","firstTime":false,"samples":[]}]}]}';
    rivers.add(River.fromMapObject(json.decode(riv)));
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

List<River> rivers = [
  new River(
    'Piave',
    DateTime.now(),
    2,
    'Questo è un test\nper vedere se\nle note funzionano',
    []
  )
];




class HomePage extends StatefulWidget {
  HomePage() {
    if(rivers!=null){for (int i = 0; i < rivers.length; i++) {
      for (int j = 0; j < rivers.elementAt(0).nReaches; j++) {
        rivers
            .elementAt(i)
            .reaches
            .add(new Reach((j + 1).toString(), 0, rivers.elementAt(i), '',true));
      }
    }}
  }
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    if(rivers == null){
      rivers = List<River>();
    }
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
