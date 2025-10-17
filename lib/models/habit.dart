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
  final String scheduleType; // 'daily', 'weekly', 'monthly', 'custom'
  
  @HiveField(5)
  final List<int>? daysOfWeek;
  
  @HiveField(6)
  final List<int>? daysOfMonth;
  
  @HiveField(7)
  final int? intervalDays;
  
  @HiveField(8)
  final DateTime createdDate;
  
  @HiveField(9)
  Map<String, bool> completionHistory; // ключ: "YYYY-MM-DD"
  
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
    this.completionHistory = const {},
  });
  
  bool isDueToday() {
    final today = DateTime.now();
    return _isDue(today);
  }
  
  bool isCompletedToday() {
    final todayKey = _dateToKey(DateTime.now());
    return completionHistory[todayKey] == true;
  }
  
  void markComplete(bool completed) {
    final todayKey = _dateToKey(DateTime.now());
    completionHistory = {...completionHistory, todayKey: completed};
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
}