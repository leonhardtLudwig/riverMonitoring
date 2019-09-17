import 'package:flutter/material.dart';
import 'package:gamma/models/section.dart';
import '../widgets/sample_card.dart';

Section section;

class SampleList extends StatefulWidget {
  
  SampleList(Section s){
    section = s;
    /*
    *MI RACCOMANDO CONTROLLA QUA
    */ 
    for (int i = section.samples.length; i > section.nS; i--) {
      section.samples.removeAt(i - 1);
    }
  }

  @override
  _SampleListState createState() => _SampleListState();
}

class _SampleListState extends State<SampleList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      child: ListView.builder(
        itemCount: section.nS,
        itemBuilder: (context, index) {
          //print(section.samples.elementAt(index).toJson());
          return SampleCard(index, section.samples.elementAt(index));
        },
      ),
    );
  }
}