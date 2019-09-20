import 'package:flutter/material.dart';
import 'package:gamma/models/sample.dart';
import '../screens/edit_sample.dart';
class SampleCard extends StatelessWidget {
  int index;
  Sample sample;
  SampleCard(this.index,this.sample);
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
                  'Sample ${sample.name==(index + 1).toString()?(index + 1).toString():sample.name}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: sample.name.length>=4?((MediaQuery.of(context).size.width*0.17)/sample.name.length):(MediaQuery.of(context).size.width*0.06)),
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
                        builder: (context) => EditSample(sample),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if (sample.firstTime) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditSample(sample),
              ),
            );
          } else {
            Navigator.of(context)
                .pushNamed('/screens/info_sample', arguments: sample);
          }
        },
      ),  
    );
  }
}