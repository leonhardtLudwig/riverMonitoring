import 'package:flutter/material.dart';
import 'package:gamma/models/sample.dart';
import 'package:gamma/screens/sample_data_table_screen.dart';
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
              height: MediaQuery.of(context).size.height * 0.8,
              margin:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
              child: ListView(
                children: <Widget>[
                  InfoText('Name', sample.name),

                  InfoText('Morphological Unit', sample.morpho),
                  InfoText('Length out of P.C', sample.length!=null?sample.length.toString():'NO CHAIN'),
                  InfoText('Depth of burial', sample.depth!=null?sample.depth.toString():'NO CHAIN'),
                  InfoText('GPS Altitude', sample.altitude),
                  InfoText('Verified  process', sample.process),
                  InfoText('Rilevamento', sample.rilevamento),
                  InfoText('Colore', sample.color!=null?sample.color:'No color'),

                  InfoText('Notes', sample.notes),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.table_chart),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SampleDataTableScreen(sample),
            ),
          );
        },
      ),
    );
  }
}
