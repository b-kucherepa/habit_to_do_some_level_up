import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import '../models/habit.dart';
import '../services/hive_service.dart';
import '../services/experience_service.dart';
import '../widgets/habit_item_widget.dart';

class DayCompletionScreen extends StatefulWidget {
  final DateTime targetDate;
  final int daysAgo;
  final Function(bool) onDayCompleted;

  const DayCompletionScreen({
    super.key,
    required this.targetDate,
    required this.daysAgo,
    required this.onDayCompleted,
  });

  @override
  _DayCompletionScreenState createState() => _DayCompletionScreenState();
}

class _DayCompletionScreenState extends State<DayCompletionScreen> {
  final HiveService _hiveService = HiveService();
  late final ExperienceService experienceService;
  late List<Habit> habitsDueToday = List.empty();

  @override
  void initState() {
    super.initState();
    // Получаем ExperienceService через Provider
    experienceService = Provider.of<ExperienceService>(context, listen: false);
  }

  @override
  void didUpdateWidget(DayCompletionScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Styles.titleFont,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.completeDayHint),
            SizedBox(height: Styles.getGap('XS')),
            Text(
                '${_formatDate(widget.targetDate)} (${widget.daysAgo} days ago)',
                style: Styles.completeDayHintFont),
          ],
        ),
        backgroundColor: Styles.completeDayAccentColor,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    habitsDueToday = _hiveService
        .getHabits()
        .toList()
        .where((habit) => habit.isDueOnDay(widget.targetDate))
        .toList();

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(Styles.getGap('L')),
            child: Text(context.l10n.markCompletedHabitsHint,
                style: Styles.markCompletedHabitsHintFont)),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: Styles.getGap('L')),
            children:
                habitsDueToday.map((habit) => _buildHabitItem(habit)).toList(),
          ),
        ),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildHabitItem(Habit habit) {
    return HabitItemWidget(
      habit: habit,
      currentCount: habit.completionCount,
      currentDay: widget.targetDate,
      isEditable: true,
      onIncrement: () {
        setState(() {
          habit.completionCount += 1;
        });
      },
      onDecrement: () {
        setState(() {
          if (habit.completionCount > 0) {
            habit.completionCount -= 1;
          }
        });
      },
      showScheduleInfo: false,
      showKarmaIndicator: true,
      backgroundColor:
          habit.isCompletedToday ? Styles.dayCompletedEntryBackColor : null,
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.all(Styles.getGap('L')),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => widget.onDayCompleted(false),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Styles.completeDayAccentColor),
              child: Text(context.l10n.skipDayButton),
            ),
          ),
          SizedBox(width: Styles.getGap('L')),
          Expanded(
            child: ElevatedButton(
              onPressed: _completeDay,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.completeDayAccentColor,
                  foregroundColor: Styles.foregroundColor),
              child: Text(context.l10n.completeDayButton),
            ),
          ),
        ],
      ),
    );
  }

  void _completeDay() {
    int totalExperience = 0;

    // Сохраняем выполнения для этого дня и считаем опыт
    for (Habit habit in habitsDueToday) {
      Habit updatedHabit = Habit(
        id: habit.id,
        title: habit.title,
        description: habit.description,
        experience: habit.experience,
        scheduleType: habit.scheduleType,
        daysOfWeek: habit.daysOfWeek,
        daysOfMonth: habit.daysOfMonth,
        intervalDays: habit.intervalDays,
        createdDate: habit.createdDate,
        completionCount: 0,
        minCompletionCount: habit.minCompletionCount,
        karmaLevel: habit.karmaLevel,
      );

      if (habit.completionCount > 0) {
        // Начисляем опыт
        totalExperience += habit.experience * habit.completionCount;
      }

      // Обновляем карму

      if (habit.isCompletedToday) {
        updatedHabit.karmaLevel =
            (habit.karmaLevel + 1).clamp(Habit.minKarma, Habit.maxKarma);
      } else {
        updatedHabit.karmaLevel =
            (habit.karmaLevel - 1).clamp(Habit.minKarma, Habit.maxKarma);
      }

      _hiveService.updateHabit(updatedHabit);
    }

    // Начисляем общий опыт через ExperienceService (теперь без контекста)
    if (totalExperience > 0) {
      experienceService.addExperienceForDay(totalExperience);
    }

    final allHabits = _hiveService.getHabits().toList();

    for (final habit in allHabits) {
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
        completionCount: 0,
        minCompletionCount: habit.minCompletionCount,
        karmaLevel: habit.karmaLevel,
      );

      _hiveService.updateHabit(updatedHabit);
    }

    // Уведомляем об успешном завершении дня
    widget.onDayCompleted(true);
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
