import 'package:demo_system_notifications/models/client.dart';
import 'package:demo_system_notifications/models/telegram_client.dart';
import 'package:demo_system_notifications/utils/constants.dart';
import 'package:flutter/material.dart';

class DatabaseSecondPage extends StatefulWidget {
  final int selectedIndex;
  final Function(int index) selectedIndexSetter;

  const DatabaseSecondPage(
      {super.key,
      required this.selectedIndexSetter,
      required this.selectedIndex});

  @override
  State<DatabaseSecondPage> createState() => _DatabaseSecondPageState();
}

class _DatabaseSecondPageState extends State<DatabaseSecondPage> {
  late final List<TelegramClient> clients;
  late final List<String> titleColumns;
  @override
  void initState() {
    clients = List.of(allTelegramClients);
    titleColumns = List.of(allTelegramColumns);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns =
        titleColumns.map((title) => DataColumn(label: Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)))).toList();
    List<DataRow> rows = clients.map((client) {
      List<DataCell> cells = [
        DataCell(Text(client.id, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.name, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.name, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.telegramId, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.language, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.phoneNumber, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.age, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.occupation, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.clicks, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.activity, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.city, style: TextStyle(fontSize: 12),)),
        DataCell(Text(client.district, style: TextStyle(fontSize: 12),)),
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
                              
                              columnSpacing: 10,
                              columns: columns,
                              rows: rows,
                              border: TableBorder.all(),
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
