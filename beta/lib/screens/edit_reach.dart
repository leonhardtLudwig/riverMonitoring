import 'package:flutter/material.dart';
import '../models/reach.dart';
Reach _reach;
class EditReach extends StatefulWidget {
  EditReach(Reach r){
    _reach = r;
  }
  @override
  _EditReachState createState() => _EditReachState();
}

class _EditReachState extends State<EditReach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Editing "Reach ${_reach.name}"'),),);
  }
}