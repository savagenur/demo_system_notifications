import 'package:demo_system_notifications/pages/auto_mode_page.dart';
import 'package:demo_system_notifications/pages/auto_mode_result_page.dart';
import 'package:demo_system_notifications/pages/database_page.dart';
import 'package:demo_system_notifications/pages/database_second_page.dart';
import 'package:demo_system_notifications/pages/settings_of_auto_notif_page.dart';
import 'package:demo_system_notifications/pages/side_navigation_bar_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void selectedIndexSetter(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = {
      '0': {
        'page': AutoModePage(),
        'floatingActionButton': ElevatedButton(
          onPressed: () {
            setState(() {
              selectedIndex = 10;
            });
          },
          child: Text("Результаты"),
        ),
      },
      '1': {
        'page': DatabasePage(
           selectedIndex: selectedIndex,
          selectedIndexSetter: selectedIndexSetter,
        ),
        'floatingActionButton': FloatingActionButton(
          onPressed: () {
            setState(() {
              selectedIndex = 9;
            });
          },
          child: Icon(Icons.settings),
        )
      },
      '2': {'page': Container(), 'floatingActionButton': Container()},
      '3': {'page': Container(), 'floatingActionButton': Container()},
      '4': {'page': Container(), 'floatingActionButton': Container()},
      '5': {'page': Container(), 'floatingActionButton': Container()},
      '6': {'page': Container(), 'floatingActionButton': Container()},
      '7': {'page': Container(), 'floatingActionButton': Container()},
      '8': {'page': Container(), 'floatingActionButton': Container()},
      // Database Settings
      '9': {
        'page': SettingsOfAutoNotificationPage(
          selectedIndexSetter: selectedIndexSetter,
        ),
        'floatingActionButton': Container()
      },
      // AutoModeResultPage
      '10': {
        'page': AutoModeResultPage(
          selectedIndexSetter: selectedIndexSetter,
        ),
        'floatingActionButton': Container()
      },
      // Database SecondPage

      '11': {
        'page': DatabaseSecondPage(
          selectedIndex: selectedIndex,
          selectedIndexSetter: selectedIndexSetter,
        ),
        'floatingActionButton': FloatingActionButton(
          onPressed: () {
            setState(() {
              selectedIndex = 9;
            });
          },
          child: Icon(Icons.settings),
        )
      },
      '12': {
        'page': AutoModeResultPage(
          selectedIndexSetter: selectedIndexSetter,
        ),
        'floatingActionButton': Container()
      },
      
    };
    final pagess = [
      AutoModePage(),

      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
      SettingsOfAutoNotificationPage(
        selectedIndexSetter: selectedIndexSetter,
      ),
    ];
    return Scaffold(
      body: Row(
        children: [
          SideNavigationBarPage(
            selectedIndexSetter: selectedIndexSetter,
            selectedIndex: selectedIndex,
          ),
          Expanded(
            child: Column(
              children: [
                pages[selectedIndex.toString()]!['page']!,
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:
          pages[selectedIndex.toString()]!['floatingActionButton']!,
    );
  }
}
