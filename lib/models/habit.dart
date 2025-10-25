import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../styles.dart';

part 'habit.g.dart';

@HiveType(typeId: 2)
class Habit {
  static const minKarma = -4;
  static const maxKarma = 5;
  static const defaultKarma = 0;

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int experience;

  @HiveField(4)
  final String scheduleType;

  @HiveField(5)
  final List<int>? daysOfWeek;

  @HiveField(6)
  final List<int>? daysOfMonth;

  @HiveField(7)
  final int? intervalDays;

  @HiveField(8)
  final DateTime createdDate;

  @HiveField(9)
  int completionCount;

  @HiveField(10)
  int minCompletionCount; // Минимальное количество выполнений

  @HiveField(11)
  int karmaLevel; // Уровень кармы от -3 до 6

  Habit({
    required this.id,
    required this.title,
    required this.description,
    required this.experience,
    required this.scheduleType,
    this.daysOfWeek,
    this.daysOfMonth,
    this.intervalDays,
    required this.createdDate,
    this.completionCount = 0,
    this.minCompletionCount = 1, // По умолчанию 1
    this.karmaLevel = 0, // Нейтральное состояние
  });

  bool isDueToday() {
    final today = DateTime.now();
    return _isDue(today);
  }

  bool get isCompletedToday {
    return completionCount >= minCompletionCount;
  }

  void incrementCompletion() {
    completionCount += 1;
  }

  void decrementCompletion() {
    completionCount -= 1;
  }

  bool _isDue(DateTime date) {
    switch (scheduleType) {
      case 'daily':
        return true;
      case 'weekly':
        if (daysOfWeek == null || daysOfWeek!.isEmpty) return false;
        final currentDay = date.weekday;
        return daysOfWeek!.contains(currentDay);
      case 'monthly':
        if (daysOfMonth == null || daysOfMonth!.isEmpty) return false;
        return daysOfMonth!.contains(date.day);
      case 'custom':
        if (intervalDays == null) return false;
        final daysSinceStart = date.difference(createdDate).inDays;
        return daysSinceStart % intervalDays! == 0;
      default:
        return false;
    }
  }

  // Получить цвет кармы
  Color get karmaColor {
    final clampedKarmaLevel = karmaLevel.clamp(minKarma, maxKarma);
    return Styles.getKarmaLevelColor(clampedKarmaLevel);
  }
}
