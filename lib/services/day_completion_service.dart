import 'package:hive/hive.dart';
import '../services/hive_service.dart';

class DayCompletionService {
  final HiveService _hiveService = HiveService();
  static const String _lastLoginKey = 'last_login_date';

  Future<DateTime> getLastLoginDate() async {
    final prefs = await Hive.openBox('preferences');
    final lastLogin = prefs.get(_lastLoginKey);

    if (lastLogin is String) {
      return DateTime.parse(lastLogin);
    } else if (lastLogin is DateTime) {
      return lastLogin;
    }

    // Первый запуск - устанавливаем сегодняшнюю дату
    final today = DateTime.now();
    await setLastLoginDate(today);
    return today;
  }

  Future<void> setLastLoginDate(DateTime date) async {
    final prefs = await Hive.openBox('preferences');
    await prefs.put(_lastLoginKey, date.toIso8601String());
  }

  Future<List<DateTime>> getMissedDays() async {
    final lastLogin = await getLastLoginDate();
    final today = DateTime.now();
    final missedDays = <DateTime>[];

    // Пропускаем сегодняшний день и проверяем с завтрашнего дня после последнего входа
    var currentDay = DateTime(lastLogin.year, lastLogin.month, lastLogin.day)
        .add(Duration(days: 1));

    final todayDate = DateTime(today.year, today.month, today.day);

    while (currentDay.isBefore(todayDate)) {
      missedDays.add(currentDay);
      currentDay = currentDay.add(Duration(days: 1));
    }

    return missedDays;
  }

  bool shouldShowDayCompletion(List<DateTime> missedDays) {
    return missedDays.isNotEmpty;
  }
}
