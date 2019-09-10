import 'package:flutter/material.dart';
import './monitoring_list.dart';
class AddButton extends StatelessWidget {
  /*List<River>rivers;
  AddButton(this.rivers);*/
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (bCtx) {
            return GestureDetector(
              onTap: () {},
              child:MonitoringList(/*rivers*/),
              behavior: HitTestBehavior.opaque,
            );
          },
        );
      },
    );
  }
}