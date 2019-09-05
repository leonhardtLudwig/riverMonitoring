import 'package:flutter/material.dart';

class NewRiver extends StatelessWidget {
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
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: FlatButton(
                onPressed: () {},
                child: Text('V.V'),
                color: Theme.of(context).accentColor,
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
