import 'package:flutter/material.dart';
import '../screens/edit_reach.dart';
import '../models/reach.dart';

class ReachCard extends StatelessWidget {
  int index;
  Reach reach;

  @override
  ReachCard(this.index,this.reach);
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
                  'Reach ${(index + 1).toString()}',
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
                        builder: (context) => EditReach(reach),
                      ),
                    );
                  }, 
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context)
                .pushNamed('/screens/info_reach', arguments: reach);
        }, 
      ),
    );
  }
}
