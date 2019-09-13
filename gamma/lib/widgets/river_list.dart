import 'package:flutter/material.dart';
import './river_card.dart';
import '../models/river.dart';


class RiverList extends StatelessWidget {
  
  final List<River> _rivers;
  RiverList(this._rivers);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        itemCount: _rivers.length,
        itemBuilder: (ctx, index) {
          return RiverCard(_rivers.elementAt(index));
        },
      ), 
    );
  }
}