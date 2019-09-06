import 'package:flutter/material.dart';
import './new_river.dart';

class NewMonitoring extends StatelessWidget {
  void selectMonitoring(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) {
          return NewRiver();
        },
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(35),
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: FlatButton(
                  onPressed: () {
                    selectMonitoring(context);
                  },
                  child: Text(
                    'V.V.\nVirtual Velocity',
                    textAlign: TextAlign.center,
                  ),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: FlatButton(
                child: Icon(Icons.add),
                onPressed: () {},
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
