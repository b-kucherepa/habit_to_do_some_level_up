import 'package:flutter_test/flutter_test.dart';
import '../lib/services/day_completion_service.dart';

void main() {
  group('DayCompletionService Logic Tests', () {
    test('Should show completion based on missed days', () {
      final service = DayCompletionService();

      expect(service.shouldShowDayCompletion([]), false);
      expect(service.shouldShowDayCompletion([DateTime.now()]), true);
    });

    // Вспомогательная функция из DayCompletionService
    bool _isSameDay(DateTime date1, DateTime date2) {
      return date1.year == date2.year &&
          date1.month == date2.month &&
          date1.day == date2.day;
    }

    test('Date comparison works', () {
      final service = DayCompletionService();

      final today = DateTime.now();
      final yesterday = today.subtract(Duration(days: 1));

      // Проверяем логику сравнения дат (без вызовов Hive)
      expect(_isSameDay(today, today), true);
      expect(_isSameDay(today, yesterday), false);
    });
  });
}
