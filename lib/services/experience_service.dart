import '../models/player.dart';
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
      final player = _hiveService.getFirstPlayer();
      final oldLevel = player.level;

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
      final updatedPlayer = Player(
        id: player.id,
        goal: player.goal,
        experience:
            _calculateNewExperience(player.experience, habit.experience),
        level: player.level,
        createdDate: player.createdDate,
        curveExponent: player.curveExponent,
        experienceMultiplier: player.experienceMultiplier,
      );

      updatedPlayer.updateLevel();
      _hiveService.updatePlayer(updatedPlayer);

      // Проверяем повышение уровня и уведомляем
      if (updatedPlayer.level > oldLevel) {
        _levelUpService.notifyLevelUp(updatedPlayer.level);
      }
    }
  }

  void decrementHabitCompletion(Habit habit) {
    final habits = _hiveService.getHabits();
    final habitIndex = habits.indexWhere((h) => h.id == habit.id);

    if (habitIndex != -1) {
      final currentCount = habit.getTodayCompletionCount();
      if (currentCount > 0) {
        final player = _hiveService.getFirstPlayer();

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
        final updatedPlayer = Player(
          id: player.id,
          goal: player.goal,
          experience:
              _calculateNewExperience(player.experience, -habit.experience),
          level: player.level,
          createdDate: player.createdDate,
          curveExponent: player.curveExponent,
          experienceMultiplier: player.experienceMultiplier,
        );

        updatedPlayer.updateLevel();
        _hiveService.updatePlayer(updatedPlayer);
      }
    }
  }

  void toggleTaskCompletion(Task task, bool completed) {
    final tasks = _hiveService.getTasks();
    final taskIndex = tasks.indexWhere((t) => t.id == task.id);

    if (taskIndex != -1) {
      final wasCompleted = task.completed;
      final player = _hiveService.getFirstPlayer();
      final oldLevel = player.level;

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

      // Update player experience
      if (completed && !wasCompleted) {
        final updatedPlayer = Player(
          id: player.id,
          goal: player.goal,
          experience:
              _calculateNewExperience(player.experience, task.experience),
          level: player.level,
          createdDate: player.createdDate,
          curveExponent: player.curveExponent,
          experienceMultiplier: player.experienceMultiplier,
        );

        updatedPlayer.updateLevel();
        _hiveService.updatePlayer(updatedPlayer);

        // Проверяем повышение уровня и уведомляем
        if (updatedPlayer.level > oldLevel) {
          _levelUpService.notifyLevelUp(updatedPlayer.level);
        }
      } else if (!completed && wasCompleted) {
        final updatedPlayer = Player(
          id: player.id,
          goal: player.goal,
          experience:
              _calculateNewExperience(player.experience, -task.experience),
          level: player.level,
          createdDate: player.createdDate,
          curveExponent: player.curveExponent,
          experienceMultiplier: player.experienceMultiplier,
        );

        updatedPlayer.updateLevel();
        _hiveService.updatePlayer(updatedPlayer);
      }
    }
  }

  void deleteHabit(Habit habit) {
    final player = _hiveService.getFirstPlayer();

    // Remove experience for all completions today
    final todayCount = habit.getTodayCompletionCount();
    if (todayCount > 0) {
      final updatedPlayer = Player(
        id: player.id,
        goal: player.goal,
        experience: _calculateNewExperience(
            player.experience, -(habit.experience * todayCount)),
        level: player.level,
        createdDate: player.createdDate,
        curveExponent: player.curveExponent,
        experienceMultiplier: player.experienceMultiplier,
      );

      updatedPlayer.updateLevel();
      _hiveService.updatePlayer(updatedPlayer);
    }

    _hiveService.deleteHabit(habit);
  }

  void deleteTask(Task task) {
    final player = _hiveService.getFirstPlayer();

    // Remove experience if task was completed
    if (task.completed) {
      final updatedPlayer = Player(
        id: player.id,
        goal: player.goal,
        experience: _calculateNewExperience(player.experience, task.experience),
        level: player.level,
        createdDate: player.createdDate,
        curveExponent: player.curveExponent,
        experienceMultiplier: player.experienceMultiplier,
      );

      updatedPlayer.updateLevel();
      _hiveService.updatePlayer(updatedPlayer);
    }

    _hiveService.deleteTask(task);
  }

  void addExperienceForDay(int experience) {
    final player = _hiveService.getFirstPlayer();

    final updatedPlayer = Player(
      id: player.id,
      goal: player.goal,
      experience: _calculateNewExperience(player.experience, experience),
      level: player.level,
      createdDate: player.createdDate,
      curveExponent: player.curveExponent,
      experienceMultiplier: player.experienceMultiplier,
    );

    updatedPlayer.updateLevel();
    _hiveService.updatePlayer(updatedPlayer);
  }

  // Новый метод для прямого добавления опыта (может пригодиться)
  void addExperienceDirectly(int experience) {
    final player = _hiveService.getFirstPlayer();

    final updatedPlayer = Player(
      id: player.id,
      goal: player.goal,
      experience: _calculateNewExperience(player.experience, experience),
      level: player.level,
      createdDate: player.createdDate,
      curveExponent: player.curveExponent,
      experienceMultiplier: player.experienceMultiplier,
    );

    updatedPlayer.updateLevel();
    _hiveService.updatePlayer(updatedPlayer);
  }

  // Метод для сброса опыта (для тестирования)
  void resetExperience() {
    final player = _hiveService.getFirstPlayer();

    final updatedPlayer = Player(
      id: player.id,
      goal: player.goal,
      experience: Player.startingExperience,
      level: Player.startingLevel,
      createdDate: player.createdDate,
      curveExponent: player.curveExponent,
      experienceMultiplier: player.experienceMultiplier,
    );

    _hiveService.updatePlayer(updatedPlayer);
  }

  int _calculateNewExperience(int experience, int difference) =>
      (experience + difference)
          .clamp(Player.startingExperience, Player.maxExperience);
}
