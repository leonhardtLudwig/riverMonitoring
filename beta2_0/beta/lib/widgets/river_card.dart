import 'package:beta/main.dart';
import 'package:beta/screens/edit_river.dart';
import 'package:flutter/material.dart';

import 'package:beta/models/river.dart';

class RiverCard extends StatelessWidget {
  River _r;

  @override
  RiverCard(River river){
    _r = river;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*0.1,
        //height: 80,
        child: InkWell(
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  //margin: MediaQuery.of(context).size.width*0.05,
                  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    _r.name,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 25),
                  ),
                ),
                Container(
                  //width: MediaQuery.of(context).size.width*0.75,
                  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.5),
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
                          builder: (context) => EditRiver(_r),
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
                .pushNamed('/screens/info_river', arguments: _r);
          }, 
        ),
      ),
    );
  }
}
