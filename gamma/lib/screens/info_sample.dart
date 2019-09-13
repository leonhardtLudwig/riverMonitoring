import 'package:flutter/material.dart';
import 'package:gamma/models/sample.dart';
import '../widgets/info_text.dart';

class InfoSample extends StatelessWidget {
  InfoSample();
  @override
  Widget build(BuildContext context) {
    final sample = ModalRoute.of(context).settings.arguments as Sample;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample ${sample.name}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
          margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
          width: double.infinity,
          child: Card(
            elevation: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              margin:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
              child: ListView(
                children: <Widget>[
                  InfoText('Name', sample.name),
                  InfoText('Notes', sample.notes),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.table_chart),
        onPressed: () {},
      ),
    );
  }
}
