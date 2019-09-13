import 'package:gamma/models/sample.dart';
import 'package:gamma/models/section.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final section = ModalRoute.of(context).settings.arguments as Section;
    /*for(int i = 0; i<section.samples.length;i++){
        section.samples.add(new Sample((i+1).toString(),  section,''));
    }*/

    return Scaffold(
      appBar: AppBar(title: Text('Section ${section.name}'),),
    );
  }
}