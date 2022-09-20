import 'package:demo_system_notifications/models/client.dart';
import 'package:demo_system_notifications/utils/constants.dart';
import 'package:flutter/material.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  late final List<Client> clients;
  late final List<String> titleColumns;
  @override
  void initState() {
    clients = List.of(allClients);
    titleColumns = List.of(allColumns);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns =
        titleColumns.map((title) => DataColumn(label: Text(title))).toList();
    List<DataRow> rows = clients.map((client) {
      List<DataCell> cells = [
        DataCell(Text(client.name)),
        DataCell(Text(client.address)),
        DataCell(Text(client.service)),
        DataCell(Text(client.telegram)),
        DataCell(Text(client.phoneNumber)),
        DataCell(Text(client.communicationSystem)),
      ];

      return DataRow(cells: cells);
    }).toList();
    return Stack(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * .7,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PopupMenuButton(
                            child: Chip(
                                label: Text('Фильтр'),
                                avatar: Icon(Icons.arrow_drop_down_outlined)),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text('алфавитному порядку'),
                                ),
                                PopupMenuItem(
                                  child: Text('услуге'),
                                ),
                                PopupMenuItem(
                                  child: Text('сумма долга'),
                                ),
                                PopupMenuItem(
                                  child: Text('адресу'),
                                ),
                              ];
                            }),
                        DataTable(
                          columns: columns,
                          rows: rows,
                          border: TableBorder.symmetric(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Следующая автоматическая отправка произойдет 12 сентября 2022г",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ],
        ),
      ],
    );
  }
}
