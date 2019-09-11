import 'package:flutter/material.dart';
import '../models/reach.dart';
import '../widgets/info_text.dart';
import '../widgets/section_list.dart';

class InfoReach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reach = ModalRoute.of(context).settings.arguments as Reach;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reach ${reach.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
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
              margin: EdgeInsets.all(10),
              child: SectionList(reach),
            ),
          ],
        ),
      ),
    );
  }
}
