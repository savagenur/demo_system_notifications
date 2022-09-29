import 'package:demo_system_notifications/utils/constants.dart';
import 'package:flutter/material.dart';

class AutoModeResultPage extends StatelessWidget {
  final Function(int index) selectedIndexSetter;
  const AutoModeResultPage({super.key, required this.selectedIndexSetter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Отправлено',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .86,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5,
                crossAxisSpacing: 100,
                mainAxisSpacing: defaultPadding),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              List<String> methods = [
                'Телеграмм рассылка',
                'Голосовой обзвон ботом',
                'Смс рассылка',
                'Whatsapp рассылка',
              ];
              List<String> results = [
                '154 / 3856',
                '346 / 652',
                '8 / 9825',
                '0 / 123',
              ];
              List<IconData> icons = [
                Icons.telegram,
                Icons.record_voice_over,
                Icons.sms,
                Icons.whatsapp,
              ];
              return _buildGridItem(
                methods[index],
                icons[index],
                (() {}),
                results[index],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: ElevatedButton.icon(
                onPressed: () {
                  selectedIndexSetter(0);
                },
                icon: Icon(Icons.arrow_back),
                label: Text('Назад'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding _buildGridItem(
    String title,
    IconData icon,
    VoidCallback? onTap,
    String trailing,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: ListTile(
        contentPadding: EdgeInsets.all(20),
        tileColor: darkColor.withOpacity(0.1),
        leading: Icon(icon),
        title: Text(title),
        trailing: Text(trailing),
      ),
    );
  }
}
