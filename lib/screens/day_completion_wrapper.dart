import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/day_completion_service.dart';
import '../services/hive_service.dart';
import 'day_completion_screen.dart';
import 'home_screen.dart';

class DayCompletionWrapper extends StatefulWidget {
  const DayCompletionWrapper({super.key});

  @override
  _DayCompletionWrapperState createState() => _DayCompletionWrapperState();
}

class _DayCompletionWrapperState extends State<DayCompletionWrapper> {
  final DayCompletionService _dayCompletionService = DayCompletionService();
  late HiveService _hiveService;
  bool _checkingDays = true;
  List<DateTime> _missedDays = [];
  int _currentDayIndex = 0;
  Map<String, int>? _lastSessionData;
  Timer? _periodicTimer;

  @override
  void initState() {
    super.initState();
    _hiveService = Provider.of<HiveService>(context, listen: false);
    _initializeApp();
    _startPeriodicCheck();
  }

  @override
  void dispose() {
    _periodicTimer?.cancel();
    super.dispose();
  }

  void _startPeriodicCheck() {
    // Проверяем каждые 5 минут (можно настроить интервал)
    _periodicTimer =
        Timer.periodic(Duration(seconds: 10 /*minutes: 5*/), (timer) {
      if (mounted) {
        _checkMissedDays();
      }
    });
  }

  void _initializeApp() async {
    _checkMissedDays();
  }

  void _checkMissedDays() async {
    final player = _hiveService.getPlayer();
    final lastLogin =
        await _dayCompletionService.getLastLoginDate(_hiveService);
    final dayResetHour = player.dayResetHour;
    final missedDays =
        await _dayCompletionService.getMissedDays(_hiveService, dayResetHour);

    print('Last login: $lastLogin');
    print('Missed days count: ${missedDays.length}');

    // Если нашли пропущенные дни и сейчас не показываем другой день
    if (missedDays.isNotEmpty && _missedDays.isEmpty) {
      _lastSessionData = _getLastSessionData();

      if (mounted) {
        setState(() {
          _missedDays = missedDays;
          _checkingDays = false;
        });
      }
    } else if (_checkingDays) {
      // Завершаем первоначальную загрузку
      if (mounted) {
        setState(() {
          _checkingDays = false;
        });
      }
    }
  }

  // Получаем данные привычек на момент последнего входа
  Map<String, int> _getLastSessionData() {
    final habits = _hiveService.getHabits();
    final lastSessionData = <String, int>{};

    for (final habit in habits) {
      lastSessionData[habit.id] = habit.completionCount;
    }

    return lastSessionData;
  }

  void _onDayCompleted(bool shouldContinue) {
    _proceedToNextDay();
  }

  void _proceedToNextDay() {
    if (_currentDayIndex >= _missedDays.length - 1) {
      // Все дни обработаны - переходим к главному экрану
      if (mounted) {
        setState(() {
          _missedDays = [];
          _currentDayIndex = 0;
        });
        // Обновляем дату последнего входа на сегодня
        _dayCompletionService.setLastLoginDate(DateTime.now(), _hiveService);
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

    if (_missedDays.isNotEmpty) {
      final targetDate = _missedDays[_currentDayIndex];
      final daysAgo = DateTime.now().difference(targetDate).inDays;
      final habits = _hiveService.getHabits();

      // Только для ПЕРВОГО дня (дня последнего входа) используем данные последней сессии
      // Для всех последующих дней используем нули
      final initialData = daysAgo == 1 ? _lastSessionData : null;

      return DayCompletionScreen(
        targetDate: targetDate,
        daysAgo: daysAgo,
        habits: habits,
        initialCompletionData: initialData,
        onDayCompleted: _onDayCompleted,
      );
    }

    return HomeScreen();
  }
}
