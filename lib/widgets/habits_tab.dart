import 'package:flutter/material.dart';
import '../services/hive_service.dart';
import '../models/habit.dart';
import '../widgets/habit_item_widget.dart';

class HabitsTab extends StatelessWidget {
  final Function(Habit) onHabitIncrement;
  final Function(Habit) onHabitDecrement;
  final Function(Habit) onHabitDelete;
  final HiveService _hiveService = HiveService();

  HabitsTab({
    super.key,
    required this.onHabitIncrement,
    required this.onHabitDecrement,
    required this.onHabitDelete,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hiveService.habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _hiveService.getHabits();

        if (habits.isEmpty) {
          return _buildEmptyState();
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
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
              showScheduleInfo: true,
              showKarmaIndicator: true,
            );
          },
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.auto_awesome, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No habits yet!'),
          SizedBox(height: 8),
          Text('Tap the + button to add your first habit',
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
