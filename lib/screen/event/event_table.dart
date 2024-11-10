import 'package:flutter/material.dart';
import 'package:flutter_app/http/event_api/event_client.dart';
import 'package:flutter_app/http/event_api/event_model.dart';
import 'package:flutter_app/screen/event/event_table_data_source.dart';

class EventTable extends StatefulWidget {
  const EventTable({super.key});

  @override
  State<StatefulWidget> createState() => _EventTableState();
}

class _EventTableState extends State<EventTable> {
  final EventTableDataSource dataSource = EventTableDataSource();
  final EventClient eventClient = EventClient();

  int _columnIndex = 0;
  bool _columnAscending = true;
  int _rowsPerPage = 11;

  void _sort(int columnIndex, bool ascending) async {
    var response = await eventClient.getEvents(EventRequest(1, 1, null, false));
    debugPrint("enevnts api response $response");
    setState(() {
      //todo: request events by index and asc
      _columnIndex = columnIndex;
      _columnAscending = ascending;
      dataSource.setData(response, _columnIndex, _columnAscending);
    });
  }

  @override
  initState() {
    super.initState();
    debugPrint("Init event table");
    _sort(_columnIndex, _columnAscending);
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      sortColumnIndex: _columnIndex,
      sortAscending: _columnAscending,
      rowsPerPage: _rowsPerPage,
      availableRowsPerPage: const <int>[5, 11, 15, 20],
      onRowsPerPageChanged: (value) {
        setState(() {
          _rowsPerPage = value!;
        });
      },
      columns: <DataColumn>[
        DataColumn(
          label: const Text('Date'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('Venue'),
          onSort: _sort,
        ),
      ],
      source: dataSource,
    );
  }
}
