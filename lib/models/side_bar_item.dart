import 'package:flutter/material.dart';

 List<SideBarItem> allSideBarItems = [

  SideBarItem(label: 'Авторежим', icon: Icons.auto_mode),
  SideBarItem(label: 'База данных', icon: Icons.assignment_ind_rounded),
  SideBarItem(label: 'Телеграмм бот (бесплатно)', icon: Icons.telegram),
  SideBarItem(label: 'Sms агрегаторы (1 сом)', icon: Icons.sms),
  SideBarItem(label: 'Голосовой обзвон ботом (1 сом)', icon: Icons.record_voice_over_outlined),
  SideBarItem(label: 'Вотсапп апи (4 сома)', icon: Icons.wechat_sharp),
  SideBarItem(label: 'Вотсапп бот', icon: Icons.whatsapp),
  SideBarItem(label: 'Задача контролеру', icon: Icons.task_alt_rounded),
  SideBarItem(label: 'Выход', icon: Icons.exit_to_app),
];

class SideBarItem {
  final String label;
  final IconData icon;
  SideBarItem({
    required this.label,
    required this.icon,
  });
}
