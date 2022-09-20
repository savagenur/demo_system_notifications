import 'package:demo_system_notifications/models/side_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

class SideNavigationBarPage extends StatefulWidget {
  final int selectedIndex;
  final Function(int) selectedIndexSetter;
  SideNavigationBarPage(
      {super.key,
      required this.selectedIndex,
      required this.selectedIndexSetter});

  @override
  State<SideNavigationBarPage> createState() => _SideNavigationBarPageState();
}

class _SideNavigationBarPageState extends State<SideNavigationBarPage> {
  late List<SideBarItem> sideBarItems;
  late int _selectedIndex;
  @override
  void initState() {
    sideBarItems = List.of(allSideBarItems);
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SideNavigationBar(
      selectedIndex: _selectedIndex,
      items: sideBarItems
          .map((sideBarItem) => SideNavigationBarItem(
              icon: sideBarItem.icon, label: sideBarItem.label))
          .toList(),
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          widget.selectedIndexSetter(index);
        });
      },
    );
  }
}
