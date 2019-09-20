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
      padding: EdgeInsets.all( MediaQuery.of(context).size.height*0.008),
      height: MediaQuery.of(context).size.height*0.1,
      child: InkWell(
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Section ${section.name==(index + 1).toString()?(index + 1).toString():section.name}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: section.name.length>=5?((MediaQuery.of(context).size.width*0.21)/section.name.length):(MediaQuery.of(context).size.width*0.06)),
                ),
              ),
              Container(
                width: 50,
                margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.39),
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
