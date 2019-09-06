import 'package:flutter/material.dart';
import '../widgets/configurations/new_monitoring.dart';

class AddButton extends StatelessWidget {
 

  AddButton();

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
              //child: NewTransaction(_addNewTransaction),
              //child: NewConfiguration.getConf('river'),
              child:NewMonitoring(),
              behavior: HitTestBehavior.opaque,
            );
          },
        );
      },
    );
  }
}
