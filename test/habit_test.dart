import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/models/habit.dart';

void main() {
  late Habit habit;

  setUp(() {
    habit = Habit(
      id: 'test-habit',
      title: 'Test Habit',
      description: 'Test Description',
      experience: 10,
      scheduleType: 'daily',
      createdDate: DateTime.now(),
      minCompletionCount: 1,
      karmaLevel: 0,
    );
  });

  group('Habit Model Tests', () {
    test('Habit initializes with correct values', () {
      expect(habit.id, 'test-habit');
      expect(habit.title, 'Test Habit');
      expect(habit.experience, 10);
      expect(habit.scheduleType, 'daily');
      expect(habit.minCompletionCount, 1);
      expect(habit.karmaLevel, 0);
    });

    test('Increment and decrement completion count', () {
      expect(habit.getTodayCompletionCount(), 0);

      habit.incrementCompletion();
      expect(habit.getTodayCompletionCount(), 1);

      habit.incrementCompletion();
      expect(habit.getTodayCompletionCount(), 2);

      habit.decrementCompletion();
      expect(habit.getTodayCompletionCount(), 1);

      habit.decrementCompletion();
      expect(habit.getTodayCompletionCount(), 0);

      // Should not go below 0
      habit.decrementCompletion();
      expect(habit.getTodayCompletionCount(), 0);
    });

    test('Is completed today based on min completion count', () {
      habit.minCompletionCount = 2;
      expect(habit.isCompletedToday, false);

      habit.incrementCompletion();
      expect(habit.isCompletedToday, false);

      habit.incrementCompletion();
      expect(habit.isCompletedToday, true);
    });

    test('Schedule due date checks', () {
      final today = DateTime.now();

      // Daily habit should always be due
      expect(habit.isDueToday(), true);

      // Weekly habit
      final weeklyHabit = Habit(
        id: 'weekly',
        title: 'Weekly',
        description: 'Test',
        experience: 10,
        scheduleType: 'weekly',
        daysOfWeek: [today.weekday],
        createdDate: today,
      );
      expect(weeklyHabit.isDueToday(), true);

      // Monthly habit
      final monthlyHabit = Habit(
        id: 'monthly',
        title: 'Monthly',
        description: 'Test',
        experience: 10,
        scheduleType: 'monthly',
        daysOfMonth: [today.day],
        createdDate: today,
      );
      expect(monthlyHabit.isDueToday(), true);

      // Custom interval habit
      final customHabit = Habit(
        id: 'custom',
        title: 'Custom',
        description: 'Test',
        experience: 10,
        scheduleType: 'custom',
        intervalDays: 1,
        createdDate: today.subtract(Duration(days: 1)),
      );
      expect(customHabit.isDueToday(), true);
    });

    test('Karma color mapping', () {
      expect(habit.karmaColor, Colors.grey); // Level 0

      habit.karmaLevel = -3;
      expect(habit.karmaColor, Colors.redAccent);

      habit.karmaLevel = 3;
      expect(habit.karmaColor, Colors.greenAccent);

      habit.karmaLevel = 6;
      expect(habit.karmaColor, Colors.blueAccent);
    });
  });
}
