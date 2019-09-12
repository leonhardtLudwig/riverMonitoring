import 'package:beta/widgets/reach_card.dart';
import 'package:flutter/material.dart';
import '../models/river.dart';

River river;
class ReachList extends StatefulWidget {
  
  ReachList(River r){
    river = r;
    for(int i = river.reaches.length;i>river.nReaches;i--){
      river.reaches.removeAt(i-1);
    }
    
    
  }
  @override
  _ReachListState createState() => _ReachListState();
}

class _ReachListState extends State<ReachList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      child: ListView.builder(
              itemCount: river.nReaches,
              itemBuilder: (context, index) {
                return ReachCard(index,river.reaches.elementAt(index));
              },
            ),      
    );
  }
}