import 'package:demo_system_notifications/models/client.dart';
import 'package:demo_system_notifications/utils/constants.dart';
import 'package:flutter/material.dart';

class DatabasePage extends StatefulWidget {
  final int selectedIndex;
  final Function(int index) selectedIndexSetter;

  const DatabasePage(
      {super.key,
      required this.selectedIndexSetter,
      required this.selectedIndex});

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
        DataCell(
          Text(client.communicationSystem),
        ),
      ];

      return DataRow(cells: cells);
    }).toList();
    return Column(
      children: [
        Stack(
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
                                    label: Text('????????????'),
                                    avatar: Icon(Icons.arrow_drop_down_outlined)),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: Text('?????????????????????? ??????????????'),
                                    ),
                                    PopupMenuItem(
                                      child: Text('????????????'),
                                    ),
                                    PopupMenuItem(
                                      child: Text('?????????? ??????????'),
                                    ),
                                    PopupMenuItem(
                                      child: Text('????????????'),
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
                  "?????????????????? ???????????????????????????? ???????????????? ???????????????????? 12 ???????????????? 2022??",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ],
            ),
            
          ],
        ),
        SizedBox(height: defaultPadding,),
        Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.selectedIndexSetter(1);
                        });
                      },
                      child: Chip(
                        label: Text(
                          '1',
                          style: TextStyle(
                              color:
                                  widget.selectedIndex == 1 ? Colors.white : null),
                        ),
                        backgroundColor:
                            widget.selectedIndex == 1 ? Colors.blue : null,
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            widget.selectedIndexSetter(11);
                          });
                        },
                        child: Chip(
                          label: Text(
                            '2',
                            style: TextStyle(
                                color: widget.selectedIndex == 11
                                    ? Colors.white
                                    : null),
                          ),
                          backgroundColor:
                              widget.selectedIndex == 11 ? Colors.blue : null,
                        )),
                  ],
                )
      ],
    );
  }
}
