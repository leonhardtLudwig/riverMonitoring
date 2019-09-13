import 'package:gamma/models/sample.dart';
import 'package:gamma/models/section.dart';
import 'package:flutter/material.dart';
import '../widgets/info_text.dart';
import '../widgets/sample_list.dart';

class InfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final section = ModalRoute.of(context).settings.arguments as Section;
    /*for(int i = 0; i<section.samples.length;i++){
        section.samples.add(new Sample((i+1).toString(),  section,''));
    }*/
    
    for(int i = 0; i<section.nS;i++){
      section.samples.add(new Sample((i+1).toString(),  section,''));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Section ${section.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
              margin:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.009),
                  child: ListView(
                    children: <Widget>[
                      InfoText('Name', section.name),
                      InfoText('Samples', section.nS.toString()),
                      InfoText('Notes', section.notes),
                    ],
                  ),
                ),
              ),
            ),
            /*Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  0,
                  MediaQuery.of(context).size.width * 0.05,
                  0),
              child: FlatButton(
                onPressed: () {
                  section.nS++;
                  print(section.nS);
                },
                child: Text(
                  'Create a new Sample',
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).accentColor,
              ),
            ),*/
            Container(
              margin:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
              child: SampleList(section),
            ),
          ],
        ),
      ),
    );
  }
}
