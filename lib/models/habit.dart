import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'habit.g.dart';

@HiveType(typeId: 2)
class Habit {
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
  Map<String, int> completionHistory;

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
    Map<String, int>? completionHistory,
    this.minCompletionCount = 1, // По умолчанию 1
    this.karmaLevel = 0, // Нейтральное состояние
  }) : completionHistory = completionHistory ?? <String, int>{};

  bool isDueToday() {
    final today = DateTime.now();
    return _isDue(today);
  }

  int getTodayCompletionCount() {
    final todayKey = _dateToKey(DateTime.now());
    return completionHistory[todayKey] ?? 0;
  }

  bool get isCompletedToday {
    return getTodayCompletionCount() >= minCompletionCount;
  }

  void incrementCompletion() {
    final todayKey = _dateToKey(DateTime.now());
    final currentCount = completionHistory[todayKey] ?? 0;
    completionHistory = {...completionHistory, todayKey: currentCount + 1};
  }

  void decrementCompletion() {
    final todayKey = _dateToKey(DateTime.now());
    final currentCount = completionHistory[todayKey] ?? 0;
    if (currentCount > 0) {
      completionHistory = {...completionHistory, todayKey: currentCount - 1};
    }
  }

  String _dateToKey(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
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
    switch (karmaLevel) {
      case -3:
        return Colors.redAccent;
      case -2:
        return Colors.orangeAccent;
      case -1:
        return Colors.yellowAccent;
      case 0:
        return Colors.grey;
      case 1:
        return Colors.limeAccent;
      case 2:
        return Colors.lightGreenAccent;
      case 3:
        return Colors.greenAccent;
      case 4:
        return Colors.cyanAccent;
      case 5:
        return Colors.lightBlueAccent;
      case 6:
        return Colors.blueAccent;
      default:
        return karmaLevel > 6
            ? Colors.deepPurpleAccent
            : karmaLevel < -3
                ? Colors.red
                : Colors.grey;
    }
  }
}
