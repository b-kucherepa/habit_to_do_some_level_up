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
    final tasks = _hiveService.getTasks();
    final taskIndex = tasks.indexWhere((t) => t.id == task.id);

    if (taskIndex != -1) {
      final wasCompleted = task.completed;
      final updatedTask = Task(
        id: task.id,
        title: task.title,
        description: task.description,
        experience: task.experience,
        completed: completed,
        completedDate: completed ? DateTime.now() : null,
        createdDate: task.createdDate,
        dueDate: task.dueDate,
        priority: task.priority,
        category: task.category,
      );

      _hiveService.updateTask(updatedTask);

      // Update character experience
      if (completed && !wasCompleted) {
        _updateCharacterExperience(task.experience);
      } else if (!completed && wasCompleted) {
        _updateCharacterExperience(-task.experience);
      }
    }
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
    // Remove experience if task was completed
    if (task.completed) {
      _updateCharacterExperience(-task.experience);
    }
    _hiveService.deleteTask(task);
  }

  void _updateCharacterExperience(int experience) {
    final character = _hiveService.getFirstCharacter();
    if (character != null) {
      final oldLevel = character.level;

      final updatedCharacter = Character(
        id: character.id,
        goal: character.goal,
        experience: character.experience,
        level: character.level,
        createdDate: character.createdDate,
        curveExponent: character.curveExponent,
        experienceMultiplier: character.experienceMultiplier,
      );

      if (experience > 0) {
        updatedCharacter.addExperience(experience);
      } else {
        updatedCharacter.removeExperience(-experience);
      }

      _hiveService.updateCharacter(updatedCharacter);

      // Проверяем повышение уровня
      if (updatedCharacter.level > oldLevel) {
        // Можно добавить callback или использовать Provider для уведомления
        print('LEVEL UP! $oldLevel -> ${updatedCharacter.level}');
      }
    }
  }

  void addExperienceForDay(int experience) {
    final character = _hiveService.getFirstCharacter();
    if (character != null) {
      final oldLevel = character.level;

      final updatedCharacter = Character(
        id: character.id,
        goal: character.goal,
        experience: character.experience + experience,
        level: character.level,
        createdDate: character.createdDate,
        curveExponent: character.curveExponent,
        experienceMultiplier: character.experienceMultiplier,
      );

      updatedCharacter.updateLevel();
      _hiveService.updateCharacter(updatedCharacter);

      // Проверяем повышение уровня
      if (updatedCharacter.level > oldLevel) {
        print('LEVEL UP! $oldLevel -> ${updatedCharacter.level}');
        // Здесь можно добавить уведомление о повышении уровня
      }
    }
  }
}
