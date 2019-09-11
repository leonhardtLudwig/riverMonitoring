import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/river.dart';
import '../widgets/reach_list.dart';
import '../widgets/info_text.dart';

class InfoRiver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final river = ModalRoute.of(context).settings.arguments as River;
    return Scaffold(
      appBar: AppBar(
        title: Text(river.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      InfoText('Name', river.name),
                      InfoText(
                          'Date',
                          DateFormat('dd/MM/yyyy')
                              .format(river.date)
                              .toString()),
                      InfoText('Reaches', river.nReaches.toString()),
                      InfoText('Notes', river.notes),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ReachList(river),
            ),
          ],
        ),
      ),
    );
  }
}
