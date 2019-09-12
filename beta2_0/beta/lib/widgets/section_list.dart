import 'package:beta/models/reach.dart';
import 'package:flutter/material.dart';
import '../widgets/section_card.dart';

Reach reach;

class SectionList extends StatefulWidget {
  SectionList(Reach r) {
    reach = r;
    /*
    *MI RACCOMANDO CONTROLLA
    */
    for (int i = reach.sections.length; i > reach.nSections; i--) {
      reach.sections.removeAt(i - 1);
    }
  }
  @override
  _SectionListState createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      child: ListView.builder(
        itemCount: reach.nSections,
        itemBuilder: (context, index) {
          return SectionCard(index, reach.sections.elementAt(index));
        },
      ),
    );
  }
}
