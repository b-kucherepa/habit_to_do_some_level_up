import '../models/character.dart';
import '../models/habit.dart';
import '../models/task.dart';
import 'hive_service.dart';
import 'level_up_service.dart';

class ExperienceService {
  final HiveService _hiveService;
  final LevelUpService _levelUpService;

  ExperienceService(this._hiveService, this._levelUpService);

  void incrementHabitCompletion(Habit habit) {
    final habits = _hiveService.getHabits();
    final habitIndex = habits.indexWhere((h) => h.id == habit.id);

    if (habitIndex != -1) {
      final character = _hiveService.getFirstCharacter();
      final oldLevel = character.level;

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
        minCompletionCount: habit.minCompletionCount,
        karmaLevel: habit.karmaLevel,
      );

      updatedHabit.incrementCompletion();
      _hiveService.updateHabit(updatedHabit);

      // Обновляем персонажа с новым опытом
      final updatedCharacter = Character(
        id: character.id,
        goal: character.goal,
        experience: character.experience + habit.experience,
        level: character.level,
        createdDate: character.createdDate,
        curveExponent: character.curveExponent,
        experienceMultiplier: character.experienceMultiplier,
      );

      updatedCharacter.updateLevel();
      _hiveService.updateCharacter(updatedCharacter);

      // Проверяем повышение уровня и уведомляем
      if (updatedCharacter.level > oldLevel) {
        _levelUpService.notifyLevelUp(updatedCharacter.level);
      }
    }
  }

  void decrementHabitCompletion(Habit habit) {
    final habits = _hiveService.getHabits();
    final habitIndex = habits.indexWhere((h) => h.id == habit.id);

    if (habitIndex != -1) {
      final currentCount = habit.getTodayCompletionCount();
      if (currentCount > 0) {
        final character = _hiveService.getFirstCharacter();

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
          minCompletionCount: habit.minCompletionCount,
          karmaLevel: habit.karmaLevel,
        );

        updatedHabit.decrementCompletion();
        _hiveService.updateHabit(updatedHabit);

        // Обновляем персонажа (уменьшаем опыт)
        final updatedCharacter = Character(
          id: character.id,
          goal: character.goal,
          experience: character.experience - habit.experience,
          level: character.level,
          createdDate: character.createdDate,
          curveExponent: character.curveExponent,
          experienceMultiplier: character.experienceMultiplier,
        );

        updatedCharacter.updateLevel();
        _hiveService.updateCharacter(updatedCharacter);
      }
    }
  }

  void toggleTaskCompletion(Task task, bool completed) {
    final tasks = _hiveService.getTasks();
    final taskIndex = tasks.indexWhere((t) => t.id == task.id);

    if (taskIndex != -1) {
      final wasCompleted = task.completed;
      final character = _hiveService.getFirstCharacter();
      final oldLevel = character.level;

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
        final updatedCharacter = Character(
          id: character.id,
          goal: character.goal,
          experience: character.experience + task.experience,
          level: character.level,
          createdDate: character.createdDate,
          curveExponent: character.curveExponent,
          experienceMultiplier: character.experienceMultiplier,
        );

        updatedCharacter.updateLevel();
        _hiveService.updateCharacter(updatedCharacter);

        // Проверяем повышение уровня и уведомляем
        if (updatedCharacter.level > oldLevel) {
          _levelUpService.notifyLevelUp(updatedCharacter.level);
        }
      } else if (!completed && wasCompleted) {
        final updatedCharacter = Character(
          id: character.id,
          goal: character.goal,
          experience: character.experience - task.experience,
          level: character.level,
          createdDate: character.createdDate,
          curveExponent: character.curveExponent,
          experienceMultiplier: character.experienceMultiplier,
        );

        updatedCharacter.updateLevel();
        _hiveService.updateCharacter(updatedCharacter);
      }
    }
  }

  void deleteHabit(Habit habit) {
    final character = _hiveService.getFirstCharacter();

    // Remove experience for all completions today
    final todayCount = habit.getTodayCompletionCount();
    if (todayCount > 0) {
      final updatedCharacter = Character(
        id: character.id,
        goal: character.goal,
        experience: character.experience - (habit.experience * todayCount),
        level: character.level,
        createdDate: character.createdDate,
        curveExponent: character.curveExponent,
        experienceMultiplier: character.experienceMultiplier,
      );

      updatedCharacter.updateLevel();
      _hiveService.updateCharacter(updatedCharacter);
    }

    _hiveService.deleteHabit(habit);
  }

  void deleteTask(Task task) {
    final character = _hiveService.getFirstCharacter();

    // Remove experience if task was completed
    if (task.completed) {
      final updatedCharacter = Character(
        id: character.id,
        goal: character.goal,
        experience: character.experience - task.experience,
        level: character.level,
        createdDate: character.createdDate,
        curveExponent: character.curveExponent,
        experienceMultiplier: character.experienceMultiplier,
      );

      updatedCharacter.updateLevel();
      _hiveService.updateCharacter(updatedCharacter);
    }

    _hiveService.deleteTask(task);
  }

  void addExperienceForDay(int experience) {
    final character = _hiveService.getFirstCharacter();

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
  }

  // Новый метод для прямого добавления опыта (может пригодиться)
  void addExperienceDirectly(int experience) {
    final character = _hiveService.getFirstCharacter();

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
  }

  // Метод для сброса опыта (для тестирования)
  void resetExperience() {
    final character = _hiveService.getFirstCharacter();

    final updatedCharacter = Character(
      id: character.id,
      goal: character.goal,
      experience: Character.startingExperience,
      level: Character.startingLevel,
      createdDate: character.createdDate,
      curveExponent: character.curveExponent,
      experienceMultiplier: character.experienceMultiplier,
    );

    _hiveService.updateCharacter(updatedCharacter);
  }
}
