import 'package:beta/models/section.dart';
import 'package:flutter/material.dart';
import '../models/reach.dart';
import '../widgets/info_text.dart';
import '../widgets/section_list.dart';

class InfoReach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reach = ModalRoute.of(context).settings.arguments as Reach;
    for(int i = 0; i<reach.sections.length;i++){
      for(int j = 0;j<reach.sections.elementAt(0).nSample;j++){
      reach.sections.elementAt(i).reach.sections.add(new Section((j+1).toString(), 0, reach,''));
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Reach ${reach.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all( MediaQuery.of(context).size.height*0.009),
              margin: EdgeInsets.all( MediaQuery.of(context).size.height*0.009),
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.12,
                  margin: EdgeInsets.all( MediaQuery.of(context).size.height*0.009),
                  child: ListView(
                    children: <Widget>[
                      InfoText('Name', reach.name),
                      InfoText('Sections', reach.nSections.toString()),
                      InfoText('Notes', reach.notes),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all( MediaQuery.of(context).size.height*0.009),
              child: SectionList(reach),
            ),
          ],
        ),
      ),
    );
  }
}
