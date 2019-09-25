import 'package:flutter/material.dart';
import '../models/sample.dart';
import '../widgets/dynamic_table.dart';
import '../screens/add_new_data.dart';

Sample _sample;

class SampleDataTableScreen extends StatefulWidget {
  SampleDataTableScreen(Sample s) {
    _sample = s;
  }
  @override
  _SampleDataTableScreenState createState() => _SampleDataTableScreenState();
}

class _SampleDataTableScreenState extends State<SampleDataTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample ${_sample.name} Data Table'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            
            child: DynamicTable(_sample.data)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNewData(_sample),
            ),
          );
        },
      ),
    );
  }
}
