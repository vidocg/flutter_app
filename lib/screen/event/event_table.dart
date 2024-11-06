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

  void _sort(int columnIndex, bool ascending) {
    setState(() async {
      //todo: request events by index and asc
      _columnIndex = columnIndex;
      _columnAscending = ascending;
      var events = await eventClient.getEvents(EventRequest(1, 1, null, false));
      dataSource.setData([events], _columnIndex, _columnAscending);
    });
  }

  init() {
    debugPrint("Init event table");
    _sort(_columnIndex, _columnAscending);
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      sortColumnIndex: _columnIndex,
      sortAscending: _columnAscending,
      columns: <DataColumn>[
        DataColumn(
          label: const Text('Episode'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('Title'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('Director'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('Writer(s)'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('Air Date'),
          onSort: _sort,
        ),
      ],
      source: dataSource,
    );
  }
}
