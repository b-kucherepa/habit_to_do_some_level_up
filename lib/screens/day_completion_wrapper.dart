import 'package:flutter/material.dart';
import '../services/day_completion_service.dart';
import '../services/hive_service.dart';
import 'home_screen.dart';
import 'day_completion_screen.dart';

class DayCompletionWrapper extends StatefulWidget {
  const DayCompletionWrapper({super.key});

  @override
  _DayCompletionWrapperState createState() => _DayCompletionWrapperState();
}

class _DayCompletionWrapperState extends State<DayCompletionWrapper> {
  final DayCompletionService _dayCompletionService = DayCompletionService();
  final HiveService _hiveService = HiveService();
  bool _checkingDays = true;
  List<DateTime> _missedDays = [];
  int _currentDayIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkMissedDays();
  }

  void _checkMissedDays() async {
    final missedDays = await _dayCompletionService.getMissedDays();

    if (mounted) {
      setState(() {
        _missedDays = missedDays;
        _checkingDays = false;
      });

      // Обновляем дату последнего входа только если нет пропущенных дней
      // Или после того как все дни будут обработаны
      if (missedDays.isEmpty) {
        _dayCompletionService.setLastLoginDate(DateTime.now());
      }
    }
  }

  void _onDayCompleted(bool shouldContinue) {
    if (!shouldContinue) {
      // Пользователь пропустил день - переходим к следующему или к главному экрану
      _proceedToNextDay();
    } else {
      // День завершен - переходим к следующему
      _proceedToNextDay();
    }
  }

  void _proceedToNextDay() {
    if (_currentDayIndex >= _missedDays.length - 1) {
      // Все дни обработаны - переходим к главному экрану
      if (mounted) {
        setState(() {
          _missedDays = [];
        });
        // Обновляем дату последнего входа
        _dayCompletionService.setLastLoginDate(DateTime.now());
      }
    } else {
      // Переходим к следующему дню
      if (mounted) {
        setState(() {
          _currentDayIndex++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingDays) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Если есть пропущенные дни, показываем экран завершения дня
    if (_missedDays.isNotEmpty) {
      final targetDate = _missedDays[_currentDayIndex];
      final daysAgo = DateTime.now().difference(targetDate).inDays;
      final habits = _hiveService.getHabits();

      return DayCompletionScreen(
        targetDate: targetDate,
        daysAgo: daysAgo,
        habits: habits,
        onDayCompleted: _onDayCompleted,
      );
    }

    // Если пропущенных дней нет, показываем главный экран
    return HomeScreen();
  }
}
