import 'package:demo_system_notifications/utils/constants.dart';
import 'package:flutter/material.dart';

class AutoModePage extends StatelessWidget {
  const AutoModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'При задержке оплаты',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .86,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 5, crossAxisSpacing: 100,mainAxisSpacing: defaultPadding),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              List<String> methods = [
                'Телеграмм рассылка - 5 дней',
                'Голосовой обзвон ботом - 13 дней',
                'Смс рассылка - 10 дней',
                'Ватсапп рассылка - 20 дней',
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
              );
            },
          ),
        )
      ],
    );
  }

  Padding _buildGridItem(String title,IconData icon, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: ListTile(
        contentPadding: EdgeInsets.all(20),
        tileColor: darkColor.withOpacity(0.1),
        leading: Icon(icon),
        title: Text(title),
        trailing: TextButton(
          onPressed: onTap,
          child: Text('Изменить'),
        ),
      ),
    );
  }
}
