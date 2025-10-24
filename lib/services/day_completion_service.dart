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

  bool shouldShowDayCompletion(List<DateTime> missedDays, int dayResetHour) {
    return missedDays.isNotEmpty;
  }

  bool _isSameDay(DateTime date1, DateTime date2, int dayResetHour) {
    final adjustedDate1 = _adjustForDayReset(date1, dayResetHour);
    final adjustedDate2 = _adjustForDayReset(date2, dayResetHour);

    return adjustedDate1.year == adjustedDate2.year &&
        adjustedDate1.month == adjustedDate2.month &&
        adjustedDate1.day == adjustedDate2.day;
  }

  DateTime _adjustForDayReset(DateTime date, int dayResetHour) {
    // Если текущее время меньше часа сброса, считаем что это предыдущий день
    if (date.hour < dayResetHour) {
      return date.subtract(Duration(days: 1));
    }
    return date;
  }

  Future<List<DateTime>> getMissedDays(int dayResetHour) async {
    final lastLogin = await getLastLoginDate();
    final today = DateTime.now();

    // Используем adjusted даты для корректного сравнения
    final adjustedLastLogin = _adjustForDayReset(lastLogin, dayResetHour);
    final adjustedToday = _adjustForDayReset(today, dayResetHour);

    // Если adjusted даты совпадают - нет пропущенных дней
    if (adjustedLastLogin.year == adjustedToday.year &&
        adjustedLastLogin.month == adjustedToday.month &&
        adjustedLastLogin.day == adjustedToday.day) {
      return [];
    }

    final missedDays = <DateTime>[];

    // Начинаем со дня после последнего входа (adjusted)
    var currentDay = DateTime(adjustedLastLogin.year, adjustedLastLogin.month,
            adjustedLastLogin.day)
        .add(Duration(days: 1));

    final todayDate =
        DateTime(adjustedToday.year, adjustedToday.month, adjustedToday.day);

    // Добавляем все дни до сегодняшнего (не включая сегодня)
    while (currentDay.isBefore(todayDate)) {
      missedDays.add(currentDay);
      currentDay = currentDay.add(Duration(days: 1));
    }

    return missedDays;
  }
}
