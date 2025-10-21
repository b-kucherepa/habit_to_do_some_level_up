import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/services/experience_service.dart';
import 'package:todo_rpg_app/styles.dart';
import '../screens/add_habit_screen.dart';
import '../services/hive_service.dart';
import '../models/habit.dart';
import '../widgets/habit_item_widget.dart';

class HabitsTab extends StatelessWidget {
  final Function(Habit) onHabitIncrement;
  final Function(Habit) onHabitDecrement;
  final Function(Habit) onHabitDelete;
  final HiveService _hiveService = HiveService();
  final ExperienceService experienceService;

  HabitsTab({
    super.key,
    required this.onHabitIncrement,
    required this.onHabitDecrement,
    required this.onHabitDelete,
    required this.experienceService,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hiveService.habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _hiveService.getHabits();

        if (habits.isEmpty) {
          return _buildEmptyState(context);
        }

        return ListView.builder(
          padding: EdgeInsets.all(Styles.largeGap),
          itemCount: habits.length,
          itemBuilder: (context, index) {
            final habit = habits[index];
            return HabitItemWidget(
              habit: habit,
              currentCount: habit.getTodayCompletionCount(),
              isEditable: true,
              onIncrement: () => onHabitIncrement(habit),
              onDecrement: () => onHabitDecrement(habit),
              onDelete: () => onHabitDelete(habit),
              onEdit: () => _editHabit(context, habit),
              showScheduleInfo: true,
              showKarmaIndicator: true,
            );
          },
        );
      },
    );
  }

  void _editHabit(BuildContext context, Habit habit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddHabitScreen(habit: habit),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Styles.habitsTabLargeIcon,
          SizedBox(height: Styles.largeGap),
          Text(context.l10n.habitsTabEmptyTitle),
          SizedBox(height: Styles.smallGap),
          Text(
            context.l10n.habitsTabEmptySubtitle,
            style: Styles.habitsEmptyHint,
          ),
        ],
      ),
    );
  }
}
