import 'package:flutter/material.dart';
import 'package:flutter_app/http/event_api/event_model.dart';

class EventTableDataSource extends DataTableSource {
  static const List<int> _displayIndexToRawIndex = <int>[0, 3, 4, 5, 6];

  late List<EventResponse> sortedData;
  void setData(List<EventResponse> data, int sortColumn, bool sortAscending) {
    sortedData = data;
    // ..sort((List<Comparable<Object>> a, List<Comparable<Object>> b) {
    //   final Comparable<Object> cellA = a[_displayIndexToRawIndex[sortColumn]];
    //   final Comparable<Object> cellB = b[_displayIndexToRawIndex[sortColumn]];
    //   return cellA.compareTo(cellB) * (sortAscending ? 1 : -1);
    // });
    notifyListeners();
  }

  @override
  int get rowCount => sortedData.length;

  static DataCell cellFor(Object data) {
    String value;
    if (data is DateTime) {
      value =
          '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
    } else {
      value = data.toString();
    }
    return DataCell(Text(value));
  }

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        cellFor(sortedData[index].valOne),
        cellFor(sortedData[index].valTwo),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
