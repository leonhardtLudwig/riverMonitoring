import 'package:beta/widgets/reach_card.dart';
import 'package:flutter/material.dart';
import '../models/river.dart';

River river;
class ReachList extends StatefulWidget {
  
  ReachList(River r){
    river = r;
    print(river.nReaches);
  }
  @override
  _ReachListState createState() => _ReachListState();
}

class _ReachListState extends State<ReachList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
              itemCount: river.nReaches,
              itemBuilder: (context, index) {
                return ReachCard(index,river.reaches.elementAt(index));
              },
            ),
            
    );
  }
}