import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  String _info;
  String _typeofinfo;
  @override
  InfoText(this._typeofinfo,this._info);
  Widget build(BuildContext context) {
    return Text(
      '${_typeofinfo}: ${_info}',
      style: TextStyle(
          color: Theme.of(context).accentColor, fontWeight: FontWeight.w900),
    );
  }
}
