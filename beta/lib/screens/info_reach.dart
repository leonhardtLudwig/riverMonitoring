
import 'package:flutter/material.dart';
import '../models/reach.dart';

class InfoReach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reach = ModalRoute.of(context).settings.arguments as Reach;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reach ${reach.name}'),
        
      ),
      body: Text(reach.hashCode.toString()),
    );
  }
}
