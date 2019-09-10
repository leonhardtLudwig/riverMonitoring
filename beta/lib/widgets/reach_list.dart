import 'package:flutter/material.dart';
import '../models/river.dart';

River river;
class ReachList extends StatefulWidget {
  
  ReachList(River r){
    river = r;
    print(river.nReaches);
  }
  @override
  _ReachListState createState() => _ReachListState();
}

class _ReachListState extends State<ReachList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
              itemCount: river.nReaches,
              itemBuilder: (context, index) {
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
                    'Reach ${(index+1).toString()}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25
                    ),
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
                    onPressed: (){}, //FUNZIONE DA ASSEGNARE
                  ),
                ),
              ],
            ),
          ),
          onTap: () {}, //DA ASSEGNARE
        ),
      );
              },
            ),
            
    );
  }
}