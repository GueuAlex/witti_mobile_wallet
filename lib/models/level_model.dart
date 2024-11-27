import 'dart:math';

class LevelModel {
  final int id;
  final String level;
  final String balance;
  final String token;
  final String cardBagePath;

  LevelModel({
    required this.id,
    required this.level,
    required this.balance,
    required this.token,
    required this.cardBagePath,
  });

  static List<LevelModel> levels = [
    LevelModel(
      id: 1,
      level: 'ECOPREMIUM',
      balance: '5000000',
      token: '50',
      cardBagePath: 'assets/icon/ecopremium.svg',
    ),
    LevelModel(
      id: 2,
      level: 'EXECUTIVE',
      balance: '15000000',
      token: '900',
      cardBagePath: 'assets/icon/executive.svg',
    ),
    LevelModel(
      id: 3,
      level: 'EXECUTIVE+',
      balance: '25000000',
      token: '2500',
      cardBagePath: 'assets/icon/executiveplus.svg',
    ),
    LevelModel(
      id: 4,
      level: 'FIRST CLASS',
      balance: '255000000',
      token: '60000',
      cardBagePath: 'assets/icon/firstclass.svg',
    ),
  ];

  static LevelModel getRandomLevel() {
    Random random = Random();
    return levels[random.nextInt(levels.length)];
  }

  static LevelModel currenteLevel = getRandomLevel();
}
