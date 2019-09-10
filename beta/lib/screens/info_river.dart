import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/river.dart';
import '../widgets/reach_list.dart';

class InfoRiver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final river = ModalRoute.of(context).settings.arguments as River;
    return Scaffold(
      appBar: AppBar(
        title: Text(river.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name: ${river.name}',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  Text(
                    'Date: ${DateFormat('dd/MM/yyyy').format(river.date).toString()}',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  Text(
                    'Number of reaches: ${river.nReaches}',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  Text(
                    'Notes:${river.notes}',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ReachList(river),
          ),
        ],
      ),
    );
  }
}
