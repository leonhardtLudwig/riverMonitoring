import 'package:flutter/material.dart';
import '../models/river.dart';

class RiversList extends StatelessWidget {
  final List<River> rivers;
  RiversList(this.rivers);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        itemCount: rivers==null?0:rivers.length,
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Text(rivers.elementAt(index).riverName),
                Icon(Icons.edit),
              ],
            ),
          );
        },
      ),
    );
  }
}
