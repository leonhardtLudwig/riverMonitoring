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
                  'Reach ${reach.name==(index + 1).toString()?(index + 1).toString():reach.name}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: reach.name.length>=4?((MediaQuery.of(context).size.width*0.18)/reach.name.length):(MediaQuery.of(context).size.width*0.06)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.38),
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
          if(reach.firstTime){
            Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditReach(reach),
                      ),
                    );
          }else{
            Navigator.of(context)
                .pushNamed('/screens/info_reach', arguments: reach);
        }}, 
      ),
    );
  }
}
