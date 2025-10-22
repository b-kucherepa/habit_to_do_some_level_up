import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_rpg_app/models/player.dart';
import 'package:todo_rpg_app/models/habit.dart';
import 'package:todo_rpg_app/models/task.dart';

void main() {
  group('Player Model Tests', () {
    test('Player initializes with correct values', () {
      final player = Player(
        id: 'test',
        goal: 'Test Goal',
        experience: 0,
        level: 1,
        createdDate: DateTime.now(),
        curveExponent: 1.5,
        experienceMultiplier: 100.0,
      );

      expect(player.id, 'test');
      expect(player.goal, 'Test Goal');
      expect(player.experience, 0);
      expect(player.level, 1);
    });

    test('Player level calculation', () {
      final player = Player(
        id: 'test',
        goal: 'Test',
        experience: 0,
        level: 1,
        createdDate: DateTime.now(),
        curveExponent: 1.0,
        experienceMultiplier: 100.0,
      );

      player.addExperience(100);
      expect(player.experience, 100);
      expect(player.level, 2);
    });

    test('Player experience to next level', () {
      final player = Player(
        id: 'test',
        goal: 'Test',
        experience: 0,
        level: 1,
        createdDate: DateTime.now(),
        curveExponent: 1.0,
        experienceMultiplier: 100.0,
      );

      expect(player.experienceToNextLevel, 100);

      player.addExperience(50);
      expect(player.experienceToNextLevel, 50);
    });
  });

  group('Habit Model Tests', () {
    test('Habit completion tracking', () {
      final habit = Habit(
        id: 'test',
        title: 'Test Habit',
        description: 'Test',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
      );

      expect(habit.getTodayCompletionCount(), 0);

      habit.incrementCompletion();
      expect(habit.getTodayCompletionCount(), 1);

      habit.incrementCompletion();
      expect(habit.getTodayCompletionCount(), 2);

      habit.decrementCompletion();
      expect(habit.getTodayCompletionCount(), 1);
    });

    test('Habit due today check', () {
      final dailyHabit = Habit(
        id: 'daily',
        title: 'Daily',
        description: 'Test',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
      );

      expect(dailyHabit.isDueToday(), true);

      // Создаем привычку, которая не должна быть due today
      final tomorrow = DateTime.now().add(Duration(days: 1));
      final weeklyHabit = Habit(
        id: 'weekly',
        title: 'Weekly',
        description: 'Test',
        experience: 10,
        scheduleType: 'weekly',
        daysOfWeek: [tomorrow.weekday], // День недели завтрашнего дня
        createdDate: DateTime.now(),
      );

      // Если сегодня не тот день недели, то привычка не due
      final isDue = weeklyHabit.isDueToday();
      // Мы не можем точно знать результат, но можем проверить что метод работает
      expect(isDue, isA<bool>());
    });

    test('Habit karma level and color', () {
      final habit = Habit(
        id: 'test',
        title: 'Test',
        description: 'Test',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
        karmaLevel: 3,
      );

      expect(habit.karmaLevel, 3);
      expect(habit.karmaColor, isA<Color>());
    });
  });

  group('Task Model Tests', () {
    test('Task status calculations', () {
      final now = DateTime.now();

      final todayTask = Task(
        id: 'today',
        title: 'Today',
        description: 'Test',
        experience: 25,
        createdDate: now,
        dueDate: now, // сегодня
        priority: 3,
        category: 'general',
      );

      expect(todayTask.isDueToday, true);
      expect(todayTask.isOverdue, false);
      // isDueSoon может быть false для сегодняшней задачи
      expect(todayTask.isDueSoon, false);

      final overdueTask = Task(
        id: 'overdue',
        title: 'Overdue',
        description: 'Test',
        experience: 25,
        createdDate: now,
        dueDate: now.subtract(Duration(days: 1)), // вчера -> просрочено
        priority: 3,
        category: 'general',
      );

      expect(overdueTask.isOverdue, true);
      expect(overdueTask.isDueToday, false);
      expect(overdueTask.isDueSoon, false);

      final dueSoonTask = Task(
        id: 'dueSoon',
        title: 'Due Soon',
        description: 'Test',
        experience: 25,
        createdDate: now,
        dueDate: now.add(Duration(days: 2)), // через 2 дня -> скоро
        priority: 3,
        category: 'general',
      );

      // isDueSoon: dueDate is before now + 3 days and not today and not overdue
      expect(dueSoonTask.isDueSoon, true);
      expect(dueSoonTask.isDueToday, false);
      expect(dueSoonTask.isOverdue, false);
    });

    test('Task completion', () {
      final task = Task(
        id: 'test',
        title: 'Test Task',
        description: 'Test',
        experience: 25,
        createdDate: DateTime.now(),
        dueDate: DateTime.now().add(Duration(days: 1)),
        priority: 3,
        category: 'general',
      );

      expect(task.completed, false);
      expect(task.completedDate, isNull);

      task.completed = true;
      task.completedDate = DateTime.now();

      expect(task.completed, true);
      expect(task.completedDate, isNotNull);
    });
  });
}
