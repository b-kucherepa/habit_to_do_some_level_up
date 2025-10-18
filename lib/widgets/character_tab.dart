import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/hive_service.dart';

class CharacterTab extends StatelessWidget {
  final VoidCallback onCreateCharacter;
  final HiveService _hiveService = HiveService();

  CharacterTab({
    super.key,
    required this.onCreateCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hiveService.charactersBox.watch(),
      builder: (context, snapshot) {
        final characters = _hiveService.getCharacters();

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
            Expanded(child: _buildTodaysOverview()),
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
      stream: _hiveService.habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _hiveService.getHabits();
        final todaysHabits =
            habits.where((habit) => habit.isDueToday()).toList();
        final completedHabits = todaysHabits.fold<int>(
            0, (sum, habit) => sum + habit.getTodayCompletionCount());

        return StreamBuilder(
          stream: _hiveService.tasksBox.watch(),
          builder: (context, snapshot) {
            final tasks = _hiveService.getTasks();
            final todaysTasks = tasks
                .where((task) => task.isDueToday && !task.completed)
                .length;
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
                      _buildOverviewCard(
                          'Habits',
                          '$completedHabits/${todaysHabits.length}',
                          Icons.auto_awesome,
                          Colors.green),
                      SizedBox(width: 12),
                      _buildOverviewCard('Due Today', '$todaysTasks',
                          Icons.task, Colors.orange),
                      SizedBox(width: 12),
                      _buildOverviewCard('Overdue', '$overdueTasks',
                          Icons.warning, Colors.red),
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

  Widget _buildOverviewCard(
      String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color),
              SizedBox(height: 8),
              Text(value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
