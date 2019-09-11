import 'package:beta/models/section.dart';
import 'package:flutter/material.dart';


Section _section;

class EditSection extends StatefulWidget {

  EditSection(Section s) {
    _section = s;
  }
  @override
  _EditSectionState createState() => _EditSectionState();
}

class _EditSectionState extends State<EditSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_section.name),),
    );
  }
}