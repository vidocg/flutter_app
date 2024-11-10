import 'package:flutter/material.dart';
import 'package:flutter_app/http/event_api/event_model.dart';
import 'package:flutter_app/http/model.dart';

class EventTableDataSource extends DataTableSource {
  late List<Event> events;
  late CustomPage page;
  void setData(EventResponse data, int sortColumn, bool sortAscending) {
    events = data.events;
    page = data.page;
    // ..sort((List<Comparable<Object>> a, List<Comparable<Object>> b) {
    //   final Comparable<Object> cellA = a[_displayIndexToRawIndex[sortColumn]];
    //   final Comparable<Object> cellB = b[_displayIndexToRawIndex[sortColumn]];
    //   return cellA.compareTo(cellB) * (sortAscending ? 1 : -1);
    // });
    notifyListeners();
  }

  @override
  int get rowCount => page.itemsNum;

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
        cellFor(events[index].date),
        cellFor(events[index].venue),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
