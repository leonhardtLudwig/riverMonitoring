import 'package:flutter/material.dart';
import './monitoring_list.dart';
class AddButton extends StatelessWidget {
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
              child:MonitoringList(),
              behavior: HitTestBehavior.opaque,
            );
          },
        );
      },
    );
  }
}