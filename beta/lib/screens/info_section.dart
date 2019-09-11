import 'package:beta/models/section.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final section = ModalRoute.of(context).settings.arguments as Section;
    return Scaffold(
      appBar: AppBar(title: Text(section.name),),
    );
  }
}