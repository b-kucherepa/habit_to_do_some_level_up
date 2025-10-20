import 'package:flutter/material.dart';
import '../services/hive_service.dart';
import '../models/habit.dart';

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

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: habits.length,
          itemBuilder: (context, index) {
            final habit = habits[index];
            return _buildHabitItem(habit, context);
          },
        );
      },
    );
  }

  Widget _buildHabitItem(Habit habit, BuildContext context) {
    final completionCount = habit.getTodayCompletionCount();
    final isDueToday = habit.isDueToday();
    final isCompleted = completionCount >= habit.minCompletionCount;

    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: _buildCounterControls(habit, completionCount, isDueToday),
        title: Text(
          habit.title,
          style: TextStyle(
            color: isDueToday ? Colors.black : Colors.grey,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (habit.description.isNotEmpty) Text(habit.description),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                SizedBox(width: 4),
                Text('${habit.experience} XP'),
                SizedBox(width: 8),
                Icon(Icons.repeat, size: 16, color: Colors.blue),
                SizedBox(width: 2),
                Text('min ${habit.minCompletionCount}'),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isDueToday)
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text('Not today', style: TextStyle(color: Colors.grey)),
              ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.grey),
              onPressed: () =>
                  _showDeleteConfirmation(habit, completionCount, context),
              tooltip: 'Delete habit',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterControls(
      Habit habit, int completionCount, bool isDueToday) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildKarmaIndicator(habit),
        IconButton(
          icon: Icon(Icons.remove, size: 20),
          onPressed: isDueToday && completionCount > 0
              ? () => onHabitDecrement(habit)
              : null,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 36, minHeight: 36),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            '$completionCount',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDueToday ? Colors.black : Colors.grey,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add, size: 20),
          onPressed: isDueToday ? () => onHabitIncrement(habit) : null,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 36, minHeight: 36),
        ),
      ],
    );
  }

  Future<void> _showDeleteConfirmation(
      Habit habit, int completionCount, BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Delete Habit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Are you sure you want to delete "${habit.title}"?'),
              if (completionCount > 0)
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    '⚠️ This will remove ${habit.experience * completionCount} XP from your character!',
                    style: TextStyle(color: Colors.orange, fontSize: 12),
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (shouldDelete == true) {
      onHabitDelete(habit);
    }
  }

  Widget _buildScheduleBadge(Habit habit) {
    Color color;
    String text;

    switch (habit.scheduleType) {
      case 'daily':
        color = Colors.blue;
        text = 'Daily';
        break;
      case 'weekly':
        color = Colors.green;
        text = 'Weekly';
        break;
      case 'monthly':
        color = Colors.orange;
        text = 'Monthly';
        break;
      case 'custom':
        color = Colors.purple;
        text = 'Custom';
        break;
      default:
        color = Colors.grey;
        text = habit.scheduleType;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildKarmaIndicator(Habit habit) {
    return Container(
      width: 16,
      //height: double.infinity,
      decoration: BoxDecoration(
          color: habit.karmaColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(6))),
    );
  }
}
