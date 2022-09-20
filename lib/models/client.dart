class Client {
  final String name;
  final String address;
  final String service;
  final String telegram;
  final String phoneNumber;
  final String communicationSystem;
  Client({
    required this.name,
    required this.address,
    required this.service,
    required this.telegram,
    required this.phoneNumber,
    required this.communicationSystem,
  });
}

List<Client> allClients = [
  Client(
      name: 'А.А.Азамат',
      address: "Манаса 33",
      service: "Вывоз мусора",
      telegram: "+996708556677",
      phoneNumber: "+996708556677",
      communicationSystem: "Телеграм бот, голосовой обзвон"),
  Client(
      name: 'П.А.Самир',
      address: "Алтай 23",
      service: "Поливка цветов",
      telegram: "+996708556677",
      phoneNumber: "+996708556677",
      communicationSystem: "Телеграм бот, голосовой обзвон"),
  Client(
      name: 'И.А.Мырза',
      address: "Вавилон 12",
      service: "Вывоз мусора",
      telegram: "+996708556677",
      phoneNumber: "+996708556677",
      communicationSystem: "Телеграм бот, голосовой обзвон"),
  Client(
      name: 'А.Ы.Темир',
      address: "Кристов 63",
      service: "Вывоз мусора",
      telegram: "+996708556677",
      phoneNumber: "+996708556677",
      communicationSystem: "Телеграм бот, голосовой обзвон"),
];

List<String> allColumns = [
  'ФИО',
  'Адрес (район и село)',
  'Услуга',
  'Телеграмм',
  'Телефон',
  'Системы связи',
];
