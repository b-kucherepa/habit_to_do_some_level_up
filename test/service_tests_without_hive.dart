import 'package:flutter_test/flutter_test.dart';
import 'package:habit_to_do_some_level_up/models/player.dart';
import 'package:habit_to_do_some_level_up/models/habit.dart';
import 'package:habit_to_do_some_level_up/models/task.dart';

void main() {
  group('Service Logic Tests (Without Hive)', () {
    test('Player level progression logic', () {
      final player = Player(
        id: 'test',
        goal: 'Test',
        experience: 0,
        level: 1,
        createdDate: DateTime.now(),
        curveExponent: 1.0,
        experienceMultiplier: 100.0,
      );

      // Initial state
      expect(player.level, 1);
      expect(player.experience, 0);
      expect(player.experienceToNextLevel, 100);

      // Add experience
      player.addExperience(50);
      expect(player.experience, 50);
      expect(player.level, 1); // Still level 1
      expect(player.experienceToNextLevel, 50);

      // Level up
      player.addExperience(50);
      expect(player.level, 2);
      expect(player.experience, 100);
    });

    test('Habit completion and karma logic', () {
      final habit = Habit(
        id: 'test',
        title: 'Test Habit',
        description: 'Test',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
        minCompletionCount: 2,
        karmaLevel: 0,
      );

      // Initial state
      expect(habit.getTodayCompletionCount(), 0);
      expect(habit.isCompletedToday, false);
      expect(habit.karmaLevel, 0);

      // Complete once (not enough)
      habit.incrementCompletion();
      expect(habit.getTodayCompletionCount(), 1);
      expect(habit.isCompletedToday, false);

      // Complete second time (enough)
      habit.incrementCompletion();
      expect(habit.getTodayCompletionCount(), 2);
      expect(habit.isCompletedToday, true);
    });

    test('Task status logic', () {
      final now = DateTime.now();

      final task = Task(
        id: 'test',
        title: 'Test Task',
        description: 'Test',
        experience: 25,
        createdDate: now,
        dueDate: now.add(Duration(days: 1)),
        priority: 3,
        category: 'general',
      );

      expect(task.completed, false);
      expect(task.isOverdue, false);
      expect(task.isDueToday,
          true); // Due tomorrow, but isDueToday checks same day
      expect(task.isDueSoon, true);
    });
  });
}
