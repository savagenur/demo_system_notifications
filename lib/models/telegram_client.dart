class TelegramClient {
  final String id;
  final String telegramId;
  final String language;
  final String phoneNumber;
  final String age;
  final String occupation;
  final String clicks;
  final String activity;
  final String city;
  final String district;

  final String name;

  TelegramClient({
    required this.id,
    required this.telegramId,
    required this.language,
    required this.phoneNumber,
    required this.age,
    required this.occupation,
    required this.clicks,
    required this.activity,
    required this.city,
    required this.district,
    required this.name,
  });
}

List<TelegramClient> allTelegramClients = [
  TelegramClient(
    id: '256',
    telegramId: '4653189613',
    language: 'kg',
    phoneNumber: '996708556677',
    age: '25',
    occupation: 'Другое',
    clicks: '12',
    activity: '19.08.22\n07:36',
    city: 'г. Бишкек',
    district: 'Ленинский',
    name: "Авазбек",
  )
];

List<String> allTelegramColumns = [
  'ID',
  'Имя',
  'Имя (Телеграм)',
  'Телеграм ID',
  'Язык',
  'Телефон',
  'Возраст',
  'Специализация',
  'Кликов',
  'Активность',
  'Область',
  'Район',
];
