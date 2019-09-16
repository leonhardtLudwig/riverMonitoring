import 'package:flutter/material.dart';

Map<String,List> _data;

class DynamicTable extends StatefulWidget {
  DynamicTable(Map<String,List> d){
    _data = d;
  }
  @override
  _DynamicTableState createState() => _DynamicTableState();
}

class _DynamicTableState extends State<DynamicTable> {

  List<DataRow> rows(){
    List<DataRow>dR = [];
    for(int i = 0; i<_data['Dist'].length;i++){
      //dR.add(DataCell(Text(_data['Dist'].elementAt(i))));
      dR.add(DataRow(cells: <DataCell>[
        DataCell(Text(_data['Dist'].elementAt(i))),
        DataCell(Text(_data['Asse B'].elementAt(i))),
        DataCell(Text(_data['Notes'].elementAt(i))),
      ]));
    }
    return dR;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(columns:<DataColumn>[
      DataColumn(label: Text('Dist')),
      DataColumn(label: Text('Asse B')),
      DataColumn(label: Text('Notes')),
    ],rows: rows(),);
  }
}