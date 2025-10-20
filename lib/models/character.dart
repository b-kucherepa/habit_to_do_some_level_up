import 'package:hive/hive.dart';
import 'dart:math';

part 'character.g.dart';

@HiveType(typeId: 0)
class Character {
  static const double minCurveExponent = 0.8;
  static const double maxCurveExponent = 2;
  static const double defaultCurveExponent = 1.5;

  static const double minExperienceMultiplier = 10;
  static const double maxExperienceMultiplier = 1000;
  static const double defaultExperienceMultiplier = 100;

  static const int startingLevel = 1;
  static const int startingExperience = 0;

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
  double curveExponent; // m - изгиб кривой

  @HiveField(6)
  double experienceMultiplier; // k - множитель опыта

  Character({
    required this.id,
    required this.goal,
    this.experience = startingExperience,
    this.level = startingLevel,
    required this.createdDate,
    this.curveExponent = defaultCurveExponent,
    this.experienceMultiplier =
        defaultExperienceMultiplier, // по умолчанию 100 XP за уровень
  });

  void addExperience(int exp) {
    experience += exp;
    updateLevel();
  }

  void removeExperience(int exp) {
    experience -= exp;
    if (experience < startingExperience) experience = startingExperience;
    updateLevel();
  }

  void updateLevel() {
    final oldLevel = level;

    // Решаем уравнение: experience = experienceMultiplier * pow(level - 1, curveExponent)
    // Находим уровень: level = pow(experience / experienceMultiplier, 1 / curveExponent) + 1
    if (startingExperience <= 0 || curveExponent == 0) {
      level = startingLevel;
    } else {
      final levelValue =
          pow(experience / experienceMultiplier, 1 / curveExponent) +
              startingLevel;
      level = levelValue.floor().clamp(startingLevel, double.infinity).toInt();
    }

    // Проверяем повышение уровня
    if (level > oldLevel) {
      print('LEVEL UP! $oldLevel -> $level');
    }
  }

  // Опыт до следующего уровня
  int get experienceToNextLevel {
    final nextLevelExp = getExperienceForLevel(level + 1);
    return (nextLevelExp - experience).ceil();
  }

  // Прогресс до следующего уровня (0.0 - 1.0)
  double get levelProgress {
    final currentLevelExp = getExperienceForLevel(level);
    final nextLevelExp = getExperienceForLevel(level + 1);
    if (nextLevelExp <= currentLevelExp) return 1.0;
    return (experience - currentLevelExp) / (nextLevelExp - currentLevelExp);
  }

  int getExperienceForLevel(int targetLevel) {
    if (targetLevel <= startingLevel) return startingExperience;
    return (experienceMultiplier *
            pow(targetLevel - startingLevel, curveExponent))
        .round();
  }

  // Обновление параметров кривой
  void updateCurveParameters(double newExponent, double newMultiplier) {
    curveExponent = newExponent.clamp(minCurveExponent, maxCurveExponent);
    experienceMultiplier =
        newMultiplier.clamp(minExperienceMultiplier, maxExperienceMultiplier);
    updateLevel();
  }
}
