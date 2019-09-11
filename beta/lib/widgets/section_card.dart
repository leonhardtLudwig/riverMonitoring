import 'package:flutter/material.dart';
import '../screens/edit_section.dart';
import '../models/section.dart';

class SectionCard extends StatelessWidget {
  int index;
  Section section;

  @override
  SectionCard(this.index, this.section);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 80,
      child: InkWell(
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                //margin: EdgeInsetsGeometry.lerp(a, b, t), //DA SISTEMARE (FALLO AUTOMATICO)
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Section ${(index + 1).toString()}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 25),
                ),
              ),
              Container(
                width: 50,
                //margin:EdgeInsets.fromLTRB(200, 0, 0, 0), //DA SISTEMARE (FALLO AUTOMATICO)
                alignment: AlignmentDirectional.centerEnd,
                child: FlatButton(
                  child: Icon(
                    Icons.edit,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditSection(section),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if (section.firstTime) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditSection(section),
              ),
            );
          } else {
            Navigator.of(context)
                .pushNamed('/screens/info_section', arguments: section);
          }
        },
      ),
    );
  }
}
