import 'package:hive/hive.dart';
import 'dart:math';

part 'character.g.dart';

@HiveType(typeId: 0)
class Character {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String goal;

  @HiveField(2)
  int experience;

  @HiveField(3)
  int level;

  @HiveField(4)
  DateTime createdDate;

  @HiveField(5)
  String levelSystem;

  @HiveField(6)
  int multiplier;

  Character({
    required this.id,
    required this.goal,
    this.experience = 0,
    this.level = 1,
    required this.createdDate,
    this.levelSystem = 'gauss',
    this.multiplier = 1,
  });

  void addExperience(int exp) {
    experience += exp;
    updateLevel();
  }

  void removeExperience(int exp) {
    experience -= exp;
    if (experience < 0) experience = 0;
    updateLevel();
  }

  void updateLevel() {
    final oldLevel = level;

    switch (levelSystem) {
      case 'square':
        level = (sqrt(experience / (100 * multiplier))).floor() + 1;
        break;
      case 'sqrt':
        level = (pow(experience / (100 * multiplier), 2)).floor() + 1;
        break;
      case 'gauss':
        // Решаем квадратное уравнение: level*(level-1)/2 * 10 = (experience/multiplier - 100)
        final baseExp = experience / multiplier - 100;
        if (baseExp <= 0) {
          level = 1;
        } else {
          level = ((1 + sqrt(1 + 8 * baseExp / 10)) / 2).floor() + 1;
        }
        break;
      case 'linear':
      default:
        level = (experience / (100 * multiplier)).floor() + 1;
        break;
    }

    if (level < 1) level = 1;

    // Проверяем повышение уровня
    if (level > oldLevel) {
      print('LEVEL UP! $oldLevel -> $level');
    }
  }

  // Опыт до следующего уровня
  int get experienceToNextLevel {
    final nextLevelExp = getExperienceForLevel(level);
    return (nextLevelExp - experience).ceil();
  }

  // Прогресс до следующего уровня (0.0 - 1.0)
  double get levelProgress {
    final currentLevelExp = getExperienceForLevel(level - 1);
    final nextLevelExp = getExperienceForLevel(level);
    if (nextLevelExp <= currentLevelExp) return 1.0;
    print('$currentLevelExp < $experience < $nextLevelExp');
    return (experience - currentLevelExp) / (nextLevelExp - currentLevelExp);
  }

  int getExperienceForLevel(int targetLevel) {
    if (targetLevel < 1) return 0;

    switch (levelSystem) {
      case 'square':
        return (pow(targetLevel, 2) * 100 * multiplier).round();
      case 'sqrt':
        return (sqrt(targetLevel) * 10).floor() * 10 * multiplier;
      case 'gauss':
        return (100 + ((targetLevel - 1) * targetLevel / 2) * 10 * multiplier)
            .round();
      case 'linear':
      default:
        return ((targetLevel) * 100 * multiplier).round();
    }
  }

  // Обновление системы уровней
  void updateLevelSystem(String newSystem, int newMultiplier) {
    levelSystem = newSystem;
    multiplier = newMultiplier > 0 ? newMultiplier : 1;
    updateLevel();
  }
}
