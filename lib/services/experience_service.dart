import '../models/character.dart';
import '../models/habit.dart';
import '../models/task.dart';
import 'hive_service.dart';

class ExperienceService {
  final HiveService _hiveService = HiveService();

  void incrementHabitCompletion(Habit habit) {
    final habits = _hiveService.getHabits();
    final habitIndex = habits.indexWhere((h) => h.id == habit.id);

    if (habitIndex != -1) {
      final updatedHabit = Habit(
        id: habit.id,
        title: habit.title,
        description: habit.description,
        experience: habit.experience,
        scheduleType: habit.scheduleType,
        daysOfWeek: habit.daysOfWeek,
        daysOfMonth: habit.daysOfMonth,
        intervalDays: habit.intervalDays,
        createdDate: habit.createdDate,
        completionHistory: {...habit.completionHistory},
      );

      updatedHabit.incrementCompletion();
      _hiveService.updateHabit(updatedHabit);
      _updateCharacterExperience(habit.experience);
    }
  }

  void decrementHabitCompletion(Habit habit) {
    final habits = _hiveService.getHabits();
    final habitIndex = habits.indexWhere((h) => h.id == habit.id);

    if (habitIndex != -1) {
      final currentCount = habit.getTodayCompletionCount();
      if (currentCount > 0) {
        final updatedHabit = Habit(
          id: habit.id,
          title: habit.title,
          description: habit.description,
          experience: habit.experience,
          scheduleType: habit.scheduleType,
          daysOfWeek: habit.daysOfWeek,
          daysOfMonth: habit.daysOfMonth,
          intervalDays: habit.intervalDays,
          createdDate: habit.createdDate,
          completionHistory: {...habit.completionHistory},
        );

        updatedHabit.decrementCompletion();
        _hiveService.updateHabit(updatedHabit);
        _updateCharacterExperience(-habit.experience);
      }
    }
  }

  void toggleTaskCompletion(Task task, bool completed) {
    // ... существующий код без изменений
  }

  void deleteHabit(Habit habit) {
    // Remove experience for all completions today
    final todayCount = habit.getTodayCompletionCount();
    if (todayCount > 0) {
      _updateCharacterExperience(-habit.experience * todayCount);
    }
    _hiveService.deleteHabit(habit);
  }

  void deleteTask(Task task) {
    // ... существующий код без изменений
  }

  void _updateCharacterExperience(int experience) {
    final character = _hiveService.getFirstCharacter();
    if (character != null) {
      final updatedCharacter = Character(
        id: character.id,
        name: character.name,
        experience: character.experience,
        level: character.level,
        createdDate: character.createdDate,
      );

      if (experience > 0) {
        updatedCharacter.addExperience(experience);
      } else {
        updatedCharacter.removeExperience(-experience);
      }

      _hiveService.updateCharacter(updatedCharacter);
    }
  }
}
