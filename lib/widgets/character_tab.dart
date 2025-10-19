import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/hive_service.dart';
import '../widgets/character_settings_dialog.dart';

class CharacterTab extends StatefulWidget {
  const CharacterTab({super.key});

  @override
  _CharacterTabState createState() => _CharacterTabState();
}

class _CharacterTabState extends State<CharacterTab> {
  final HiveService _hiveService = HiveService();
  bool _showLevelUpAnimation = false;

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
                Icon(Icons.person, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('No character data'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _createDefaultCharacter,
                  child: Text('Initialize Stats'),
                ),
              ],
            ),
          );
        }

        final character = characters.first;
        return Column(
          children: [
            _buildStatsCard(character),
            SizedBox(height: 16),
            Expanded(child: _buildTodaysOverview()),
          ],
        );
      },
    );
  }

  Widget _buildStatsCard(Character character) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    character.goal,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.grey),
                  onPressed: () => _showSettingsDialog(character),
                  tooltip: 'Settings',
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                _buildStatItem('Level', '${character.level}', Icons.star),
                SizedBox(width: 16),
                _buildStatItem(
                    'XP', '${character.experience}', Icons.auto_awesome),
                SizedBox(width: 16),
                _buildStatItem('To Next', '${character.experienceToNextLevel}',
                    Icons.flag),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Progress to Level ${character.level + 1}'),
                    Text(
                        '${(character.levelProgress * 100).toStringAsFixed(1)}%'),
                  ],
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: character.levelProgress,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.blue,
                  minHeight: 8,
                ),
              ],
            ),
            SizedBox(height: 8),
            _buildLevelSystemInfo(character),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: Colors.blue.shade700),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelSystemInfo(Character character) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.trending_up, size: 16, color: Colors.blue),
          SizedBox(width: 6),
          Text(
            'Curve: m=${character.curveExponent.toStringAsFixed(1)}, k=${character.experienceMultiplier.toInt()}',
            style: TextStyle(
                fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
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
        final completedHabitsCount = todaysHabits.fold<int>(
            0, (sum, habit) => sum + habit.getTodayCompletionCount());

        return StreamBuilder(
          stream: _hiveService.tasksBox.watch(),
          builder: (context, snapshot) {
            final tasks = _hiveService.getTasks();
            final todaysTasks = tasks
                .where((task) => task.isDueToday && !task.completed)
                .length;
            final overdueTasks = tasks.where((task) => task.isOverdue).length;
            final completedTasks = tasks.where((task) => task.completed).length;

            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Progress",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      _buildOverviewCard('Habits Done', '$completedHabitsCount',
                          Icons.auto_awesome, Colors.green,
                          subtitle: '/${todaysHabits.length} today'),
                      SizedBox(width: 12),
                      _buildOverviewCard(
                        'Tasks Due',
                        '$todaysTasks',
                        Icons.task,
                        Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      _buildOverviewCard(
                        'Tasks Done',
                        '$completedTasks',
                        Icons.check_circle,
                        Colors.green,
                      ),
                      SizedBox(width: 12),
                      _buildOverviewCard(
                        'Overdue',
                        '$overdueTasks',
                        Icons.warning,
                        Colors.red,
                      ),
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
      String title, String value, IconData icon, Color color,
      {String? subtitle}) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _createDefaultCharacter() {
    final character = Character(
      id: 'default',
      goal: 'Accumulate experience to create your RPG character!',
      createdDate: DateTime.now(),
      curveExponent: 1.5,
      experienceMultiplier: 1.0,
    );
    _hiveService.charactersBox.add(character);
    setState(() {});
  }

  Future<void> _showSettingsDialog(Character character) async {
    final result = await showDialog<Character>(
      context: context,
      builder: (context) => CharacterSettingsDialog(character: character),
    );

    if (result != null && mounted) {
      _hiveService.updateCharacter(result);

      // Проверяем, повысился ли уровень
      final oldLevel = character.level;
      if (result.level > oldLevel) {
        _showLevelUpDialog(result.level, result.goal);
      }
    }
  }

  void _showLevelUpDialog(int newLevel, String goal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.celebration, color: Colors.amber),
            SizedBox(width: 8),
            Text('Congratulations!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Level $newLevel reached!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Don\'t forget to use your achievements to $goal!',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}
