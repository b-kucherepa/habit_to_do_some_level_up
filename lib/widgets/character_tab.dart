import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/character.dart';
import '../models/habit.dart';
import '../models/task.dart';

class CharacterTab extends StatelessWidget {
  final Box charactersBox;
  final Box habitsBox;
  final Box tasksBox;
  final VoidCallback onCreateCharacter;

  const CharacterTab({
    Key? key,
    required this.charactersBox,
    required this.habitsBox,
    required this.tasksBox,
    required this.onCreateCharacter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: charactersBox.watch(),
      builder: (context, snapshot) {
        final characters = _getCharactersFromBox(charactersBox);
        
        if (characters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No characters yet'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onCreateCharacter,
                  child: Text('Create First Character'),
                ),
              ],
            ),
          );
        }
        
        final character = characters.first;
        return Column(
          children: [
            _buildCharacterCard(character),
            Expanded(
              child: _buildTodaysOverview(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCharacterCard(Character character) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              character.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Level: ${character.level}'),
            Text('XP: ${character.experience}'),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: (character.experience % 100) / 100,
            ),
            SizedBox(height: 8),
            Text('Next level: ${100 - (character.experience % 100)} XP'),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaysOverview() {
    return StreamBuilder(
      stream: habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _getHabitsFromBox(habitsBox);
        final todaysHabits = habits.where((habit) => habit.isDueToday()).toList();
        final completedHabits = todaysHabits.where((habit) => habit.isCompletedToday()).length;
        
        return StreamBuilder(
          stream: tasksBox.watch(),
          builder: (context, snapshot) {
            final tasks = _getTasksFromBox(tasksBox);
            final todaysTasks = tasks.where((task) => task.isDueToday && !task.completed).length;
            final overdueTasks = tasks.where((task) => task.isOverdue).length;
            
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Overview",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      _buildOverviewCard('Habits', '$completedHabits/${todaysHabits.length}', Icons.auto_awesome, Colors.green),
                      SizedBox(width: 12),
                      _buildOverviewCard('Due Today', '$todaysTasks', Icons.task, Colors.orange),
                      SizedBox(width: 12),
                      _buildOverviewCard('Overdue', '$overdueTasks', Icons.warning, Colors.red),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOverviewCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color),
              SizedBox(height: 8),
              Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  List<Character> _getCharactersFromBox(Box box) {
    return box.values.map((dynamic item) => item as Character).toList();
  }

  List<Habit> _getHabitsFromBox(Box box) {
    return box.values.map((dynamic item) => item as Habit).toList();
  }

  List<Task> _getTasksFromBox(Box box) {
    return box.values.map((dynamic item) => item as Task).toList();
  }
}