import 'package:demo_system_notifications/models/title_and_subtitles.dart';
import 'package:demo_system_notifications/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingsOfAutoNotificationPage extends StatefulWidget {
  final Function(int index) selectedIndexSetter;

  const SettingsOfAutoNotificationPage(
      {super.key, required this.selectedIndexSetter});

  @override
  State<SettingsOfAutoNotificationPage> createState() =>
      _SettingsOfAutoNotificationPageState();
}

class _SettingsOfAutoNotificationPageState
    extends State<SettingsOfAutoNotificationPage> {
  late List<TitleAndSubtitles> listTitleAndSubtitles;

  @override
  void initState() {
    listTitleAndSubtitles = List.of(allTitleAndSubtitles);
    super.initState();
  }

  ExpansionPanelList builtExpansionPanelList() {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          listTitleAndSubtitles[panelIndex].isExpanded =
              !listTitleAndSubtitles[panelIndex].isExpanded!;
        });
      },
      children: listTitleAndSubtitles
          .map((data) => ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: data.isExpanded!,
              headerBuilder: (context, expanded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data.title,
                      style: Theme.of(context).textTheme.headline6),
                );
              },
              body: SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: data.subtitles
                      .map((subtitle) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(subtitle),
                          ))
                      .toList(),
                ),
              )))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Text(
            'Настройка автоматических уведомлений',
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .88,
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: builtExpansionPanelList(),
                  ),
                 const SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Сохранить изменения'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.selectedIndexSetter(1);
                        },
                        child: Text('Отмена'),
                      ),
                    ],
                  ),                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
