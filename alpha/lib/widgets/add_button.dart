import 'package:flutter/material.dart';
import '../models/new_configuration.dart';

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
              child:NewConfiguration.newRiver(),
              behavior: HitTestBehavior.opaque,
            );
          },
        );
      },
    );
  }
}
