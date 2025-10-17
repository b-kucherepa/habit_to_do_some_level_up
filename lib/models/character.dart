import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 0)
class Character {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  int experience;

  @HiveField(3)
  int level;

  @HiveField(4)
  DateTime createdDate;

  Character({
    required this.id,
    required this.name,
    this.experience = 0,
    this.level = 1,
    required this.createdDate,
  });

  void addExperience(int exp) {
    print("EXPERIENCE ADDED");
    experience += exp;
    _updateLevel();
  }

  void removeExperience(int exp) {
    experience -= exp;
    if (experience < 0) experience = 0;
    _updateLevel();
  }

  void _updateLevel() {
    level = (experience / 100).floor() + 1;
    if (level < 1) level = 1;
  }
}
