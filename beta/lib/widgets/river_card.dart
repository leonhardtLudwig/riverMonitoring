import 'package:beta/screens/edit_river.dart';
import 'package:flutter/material.dart';

import 'package:beta/models/river.dart';

class RiverCard extends StatelessWidget {
  final River r;

  RiverCard(this.r);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
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
                    r.name,
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
                          builder: (context) => EditRiver(r),
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
                .pushNamed('/screens/info_river', arguments: r);
          }, 
        ),
      ),
    );
  }
}
