import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../services/hive_service.dart';
import '../services/experience_service.dart';
import '../widgets/habit_item_widget.dart';

class DayCompletionScreen extends StatefulWidget {
  final DateTime targetDate;
  final int daysAgo;
  final List<Habit> habits;
  final Map<String, int>? initialCompletionData;
  final Function(bool) onDayCompleted;

  const DayCompletionScreen({
    super.key,
    required this.targetDate,
    required this.daysAgo,
    required this.habits,
    this.initialCompletionData,
    required this.onDayCompleted,
  });

  @override
  _DayCompletionScreenState createState() => _DayCompletionScreenState();
}

class _DayCompletionScreenState extends State<DayCompletionScreen> {
  late Map<String, int> _completionCounts;
  final HiveService _hiveService = HiveService();
  final ExperienceService _experienceService = ExperienceService();

  @override
  void initState() {
    super.initState();
    _initializeCompletionCounts();
  }

  @override
  void didUpdateWidget(DayCompletionScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Если целевая дата изменилась (переход к следующему дню), переинициализируем счетчики
    if (oldWidget.targetDate != widget.targetDate) {
      _initializeCompletionCounts();
    }
  }

  void _initializeCompletionCounts() {
    // Инициализируем счетчики: либо из initialCompletionData, либо нули
    _completionCounts = {};
    for (final habit in widget.habits) {
      _completionCounts[habit.id] =
          widget.initialCompletionData?[habit.id] ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Complete Missed Day'),
            SizedBox(height: 4),
            Text(
              '${_formatDate(widget.targetDate)} (${widget.daysAgo} days ago)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Mark completed habits for this day:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children:
                widget.habits.map((habit) => _buildHabitItem(habit)).toList(),
          ),
        ),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildHabitItem(Habit habit) {
    final count = _completionCounts[habit.id] ?? 0;
    final isCompleted = count >= habit.minCompletionCount;

    return HabitItemWidget(
      habit: habit,
      currentCount: count,
      isEditable: true,
      onIncrement: () {
        setState(() {
          _completionCounts[habit.id] = count + 1;
        });
      },
      onDecrement: () {
        setState(() {
          if (count > 0) {
            _completionCounts[habit.id] = count - 1;
          }
        });
      },
      showScheduleInfo: false,
      showKarmaIndicator: true,
      backgroundColor: isCompleted ? Colors.green.shade50 : null,
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => widget.onDayCompleted(false),
              child: Text('Skip This Day'),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _completeDay,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Complete Day'),
            ),
          ),
        ],
      ),
    );
  }

  void _completeDay() {
    int totalExperience = 0;

    // Сохраняем выполнения для этого дня
    for (final habit in widget.habits) {
      final count = _completionCounts[habit.id] ?? 0;
      final dateKey = _dateToKey(widget.targetDate);

      if (count > 0) {
        // Обновляем привычку с новыми выполнениями
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

        // Добавляем выполнения за целевой день
        updatedHabit.completionHistory[dateKey] = count;

        // Обновляем карму
        if (count >= habit.minCompletionCount) {
          updatedHabit.karmaLevel = (habit.karmaLevel + 1).clamp(-3, 6);
        } else {
          updatedHabit.karmaLevel = (habit.karmaLevel - 1).clamp(-3, 6);
        }

        _hiveService.updateHabit(updatedHabit);

        // Начисляем опыт
        totalExperience += habit.experience * count;
      } else {
        // Не выполнено - уменьшаем карму
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
          karmaLevel: (habit.karmaLevel - 1).clamp(-3, 6),
        );
        _hiveService.updateHabit(updatedHabit);
      }
    }

    // Начисляем общий опыт
    if (totalExperience > 0) {
      _experienceService.addExperienceForDay(totalExperience);
    }

    // Уведомляем об успешном завершении дня
    widget.onDayCompleted(true);
  }

  String _dateToKey(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
