import 'package:flutter_test/flutter_test.dart';
import 'package:todo_rpg_app/models/character.dart';
import 'package:todo_rpg_app/models/habit.dart';
import 'package:todo_rpg_app/models/task.dart';

void main() {
  group('Service Logic Tests (Without Hive)', () {
    test('Character level progression logic', () {
      final character = Character(
        id: 'test',
        goal: 'Test',
        experience: 0,
        level: 1,
        createdDate: DateTime.now(),
        curveExponent: 1.0,
        experienceMultiplier: 100.0,
      );

      // Initial state
      expect(character.level, 1);
      expect(character.experience, 0);
      expect(character.experienceToNextLevel, 100);

      // Add experience
      character.addExperience(50);
      expect(character.experience, 50);
      expect(character.level, 1); // Still level 1
      expect(character.experienceToNextLevel, 50);

      // Level up
      character.addExperience(50);
      expect(character.level, 2);
      expect(character.experience, 100);
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
