import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/habit.dart';
import '../models/character.dart';

class HabitsTab extends StatelessWidget {
  final Box habitsBox;
  final Box charactersBox;
  final Function(Habit, bool) onHabitToggle;

  const HabitsTab({
    Key? key,
    required this.habitsBox,
    required this.charactersBox,
    required this.onHabitToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _getHabitsFromBox(habitsBox);
        
        if (habits.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('No habits yet!'),
                SizedBox(height: 8),
                Text('Tap the + button to add your first habit', style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        }
        
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: habits.length,
          itemBuilder: (context, index) {
            final habit = habits[index];
            return _buildHabitItem(habit);
          },
        );
      },
    );
  }

  Widget _buildHabitItem(Habit habit) {
    final isCompleted = habit.isCompletedToday();
    final isDueToday = habit.isDueToday();
    
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: isDueToday ? (value) {
            onHabitToggle(habit, value ?? false);
          } : null,
        ),
        title: Text(
          habit.title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            color: isDueToday ? Colors.black : Colors.grey,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.description),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                SizedBox(width: 4),
                Text('${habit.experience} XP'),
                SizedBox(width: 16),
                _buildScheduleBadge(habit),
              ],
            ),
          ],
        ),
        trailing: !isDueToday ? Text('Not today', style: TextStyle(color: Colors.grey)) : null,
      ),
    );
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
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Habit> _getHabitsFromBox(Box box) {
    return box.values.map((dynamic item) => item as Habit).toList();
  }
}