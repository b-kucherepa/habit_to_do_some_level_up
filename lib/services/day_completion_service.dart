import 'package:hive/hive.dart';

class DayCompletionService {
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

    // Если даты совпадают - нет пропущенных дней
    if (_isSameDay(lastLogin, today)) {
      return [];
    }

    final missedDays = <DateTime>[];

    // ВКЛЮЧАЕМ день последнего входа и все дни до сегодняшнего (не включая сегодня)
    var currentDay = DateTime(lastLogin.year, lastLogin.month, lastLogin.day);
    final todayDate = DateTime(today.year, today.month, today.day);

    while (currentDay.isBefore(todayDate)) {
      missedDays.add(currentDay);
      currentDay = currentDay.add(Duration(days: 1));
    }

    return missedDays;
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool shouldShowDayCompletion(List<DateTime> missedDays) {
    return missedDays.isNotEmpty;
  }
}
