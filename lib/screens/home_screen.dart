import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/character.dart';
import '../models/task.dart';
import '../models/habit.dart';
import '../widgets/character_tab.dart';
import '../widgets/habits_tab.dart';
import '../widgets/tasks_tab.dart';
import '../screens/add_habit_screen.dart';
import '../screens/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box charactersBox;
  late Box habitsBox;
  late Box tasksBox;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    charactersBox = Hive.box('characters');
    habitsBox = Hive.box('habits');
    tasksBox = Hive.box('tasks');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RPG Todo & Habits'),
        backgroundColor: _getAppBarColor(),
      ),
      body: _getBody(_selectedIndex),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Character',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: 'Habits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }

  Color _getAppBarColor() {
    switch (_selectedIndex) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  // В методе _getBody обновляем передачу параметров:
  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return CharacterTab(
          charactersBox: charactersBox,
          habitsBox: habitsBox,
          tasksBox: tasksBox,
          onCreateCharacter: _createDefaultCharacter,
        );
      case 1:
        return HabitsTab(
          habitsBox: habitsBox,
          charactersBox: charactersBox,
          onHabitToggle: _toggleHabitCompletion,
          onHabitDelete: _deleteHabit, // Добавляем этот параметр
        );
      case 2:
        return TasksTab(
          tasksBox: tasksBox,
          charactersBox: charactersBox,
          onTaskToggle: _toggleTaskCompletion,
          onTaskDelete: _deleteTask, // Добавляем этот параметр
        );
      default:
        return CharacterTab(
          charactersBox: charactersBox,
          habitsBox: habitsBox,
          tasksBox: tasksBox,
          onCreateCharacter: _createDefaultCharacter,
        );
    }
  }

  Widget? _buildFloatingActionButton() {
    switch (_selectedIndex) {
      case 1:
        return FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddHabitScreen()),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        );
      case 2:
        return FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            ).then((_) => setState(() {}));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
        );
      default:
        return null;
    }
  }

  void _toggleHabitCompletion(Habit habit, bool completed) {
    setState(() {
      final habits = _getHabitsFromBox(habitsBox);
      final habitIndex = habits.indexWhere((h) => h.id == habit.id);

      if (habitIndex != -1) {
        final wasCompleted = habit.isCompletedToday();
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
        );

        updatedHabit.markComplete(completed);

        final habitKey = _getHabitKeyById(habit.id);
        if (habitKey != null) {
          habitsBox.put(habitKey, updatedHabit);
        }

        // Обновляем опыт персонажа
        if (completed && !wasCompleted) {
          _updateCharacterExperience(habit.experience);
        } else if (!completed && wasCompleted) {
          _updateCharacterExperience(-habit.experience);
        }
      }
    });
  }

  void _toggleTaskCompletion(Task task, bool completed) {
    setState(() {
      final tasks = _getTasksFromBox(tasksBox);
      final taskIndex = tasks.indexWhere((t) => t.id == task.id);

      if (taskIndex != -1) {
        final wasCompleted = task.completed;
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

        final taskKey = _getTaskKeyById(task.id);
        if (taskKey != null) {
          tasksBox.put(taskKey, updatedTask);
        }

        // Обновляем опыт персонажа
        if (completed && !wasCompleted) {
          _updateCharacterExperience(task.experience);
        } else if (!completed && wasCompleted) {
          _updateCharacterExperience(-task.experience);
        }
      }
    });
  }

  void _deleteHabit(Habit habit) {
    _performHabitDeletion(habit);
  }

  void _deleteTask(Task task) {
    _performTaskDeletion(task);
  }

  void _performHabitDeletion(Habit habit) {
    setState(() {
      // Если привычка была выполнена сегодня, отнимаем опыт
      if (habit.isCompletedToday()) {
        _updateCharacterExperience(-habit.experience);
      }

      final habitKey = _getHabitKeyById(habit.id);
      if (habitKey != null) {
        habitsBox.delete(habitKey);
      }
    });
  }

  void _performTaskDeletion(Task task) {
    setState(() {
      // Если задача была выполнена, отнимаем опыт
      if (task.completed) {
        _updateCharacterExperience(-task.experience);
      }

      final taskKey = _getTaskKeyById(task.id);
      if (taskKey != null) {
        tasksBox.delete(taskKey);
      }
    });
  }

  void _updateCharacterExperience(int experience) {
    final characters = _getCharactersFromBox(charactersBox);
    if (characters.isNotEmpty) {
      final character = characters.first;
      final updatedCharacter = Character(
        id: character.id,
        name: character.name,
        experience: character.experience + experience,
        level: character.level,
        createdDate: character.createdDate,
      );

      // Обновляем уровень с учетом нового опыта
      if (experience > 0) {
        updatedCharacter.addExperience(experience);
      } else {
        updatedCharacter.removeExperience(-experience);
      }

      final characterKey = _getCharacterKeyById(character.id);
      if (characterKey != null) {
        charactersBox.put(characterKey, updatedCharacter);
      }
    }
  }

  Widget _buildTasksList() {
    return StreamBuilder(
      stream: tasksBox.watch(),
      builder: (context, snapshot) {
        final tasks = _getTasksFromBox(tasksBox);

        if (tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.task, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('No tasks yet!'),
                SizedBox(height: 8),
                Text('Tap the + button to add your first task',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        }

        final pendingTasks = tasks.where((task) => !task.completed).toList();
        final completedTasks = tasks.where((task) => task.completed).toList();

        return Column(
          children: [
            // Статистика задач
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTaskStat('Total', tasks.length, Colors.blue),
                  _buildTaskStat('Pending', pendingTasks.length, Colors.orange),
                  _buildTaskStat('Done', completedTasks.length, Colors.green),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  if (pendingTasks.isNotEmpty) ...[
                    Text(
                      'Pending Tasks (${pendingTasks.length})',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    ...pendingTasks
                        .map((task) => _buildTaskItem(task))
                        .toList(),
                    SizedBox(height: 16),
                  ],
                  if (completedTasks.isNotEmpty) ...[
                    Text(
                      'Completed Tasks (${completedTasks.length})',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(height: 8),
                    ...completedTasks
                        .map((task) => _buildTaskItem(task))
                        .toList(),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTaskStat(String label, int count, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Text(
            count.toString(),
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildTaskItem(Task task) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      color: task.completed ? Colors.green.shade50 : Colors.white,
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: (value) {
            _toggleTaskCompletion(task, value ?? false);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontWeight: task.completed ? FontWeight.normal : FontWeight.w500,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description.isNotEmpty) Text(task.description),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                SizedBox(width: 4),
                Text('${task.experience} XP'),
                SizedBox(width: 12),
                Icon(Icons.calendar_today,
                    size: 16, color: _getDueDateColor(task)),
                SizedBox(width: 4),
                Text(
                  _formatDueDate(task.dueDate),
                  style: TextStyle(color: _getDueDateColor(task)),
                ),
                SizedBox(width: 12),
                _buildPriorityBadge(task.priority),
              ],
            ),
          ],
        ),
        trailing: _buildCategoryChip(task.category),
      ),
    );
  }

  Widget _buildPriorityBadge(int priority) {
    Color color;
    String text;

    switch (priority) {
      case 1:
        color = Colors.green;
        text = 'P1';
        break;
      case 2:
        color = Colors.blue;
        text = 'P2';
        break;
      case 3:
        color = Colors.orange;
        text = 'P3';
        break;
      case 4:
        color = Colors.red;
        text = 'P4';
        break;
      case 5:
        color = Colors.purple;
        text = 'P5';
        break;
      default:
        color = Colors.grey;
        text = 'P$priority';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return Chip(
      label: Text(
        category[0].toUpperCase() + category.substring(1),
        style: TextStyle(fontSize: 10),
      ),
      backgroundColor: Colors.grey.withOpacity(0.1),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Color _getDueDateColor(Task task) {
    if (task.completed) return Colors.green;
    if (task.isOverdue) return Colors.red;
    if (task.isDueToday) return Colors.orange;
    if (task.isDueSoon) return Colors.blue;
    return Colors.grey;
  }

  String _formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);

    final difference = due.difference(today).inDays;

    if (difference == 0) return 'Today';
    if (difference == 1) return 'Tomorrow';
    if (difference == -1) return 'Yesterday';
    if (difference < 0) return '${difference.abs()} days ago';
    if (difference < 7) return 'In $difference days';

    return '${dueDate.day}/${dueDate.month}/${dueDate.year}';
  }

  // Добавляем вспомогательные методы для задач
  int? _getTaskKeyById(String id) {
    final tasks = tasksBox.toMap();
    for (var entry in tasks.entries) {
      if ((entry.value as Task).id == id) {
        return entry.key;
      }
    }
    return null;
  }

  List<Task> _getTasksFromBox(Box box) {
    return box.values.map((dynamic item) => item as Task).toList();
  }

  // Существующие методы остаются без изменений
  List<Character> _getCharactersFromBox(Box box) {
    return box.values.map((dynamic item) => item as Character).toList();
  }

  List<Habit> _getHabitsFromBox(Box box) {
    return box.values.map((dynamic item) => item as Habit).toList();
  }

  void _createDefaultCharacter() {
    final character = Character(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'Adventurer',
      createdDate: DateTime.now(),
    );
    charactersBox.add(character);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Добавляем существующие методы для привычек (если их нет)
  Widget _buildCharacterStats() {
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
                  onPressed: _createDefaultCharacter,
                  child: Text('Create First Character'),
                ),
              ],
            ),
          );
        }

        final character = characters.first;
        return Column(
          children: [
            Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      character.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Level: ${character.level}'),
                    Text('XP: ${character.experience}'),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: (character.experience % 100) / 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                        'Next level: ${100 - (character.experience % 100)} XP'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _buildTodaysOverview(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTodaysOverview() {
    return StreamBuilder(
      stream: habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _getHabitsFromBox(habitsBox);
        final todaysHabits =
            habits.where((habit) => habit.isDueToday()).toList();
        final completedHabits =
            todaysHabits.where((habit) => habit.isCompletedToday()).length;

        return StreamBuilder(
          stream: tasksBox.watch(),
          builder: (context, snapshot) {
            final tasks = _getTasksFromBox(tasksBox);
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

  Widget _buildHabitsList() {
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
          onChanged: isDueToday
              ? (value) {
                  _toggleHabitCompletion(habit, value ?? false);
                }
              : null,
        ),
        title: Text(
          habit.title,
          style: TextStyle(
            decoration:
                isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
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
        trailing: !isDueToday
            ? Text('Not today', style: TextStyle(color: Colors.grey))
            : null,
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
        style:
            TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  int? _getHabitKeyById(String id) {
    final habits = habitsBox.toMap();
    for (var entry in habits.entries) {
      if ((entry.value as Habit).id == id) {
        return entry.key;
      }
    }
    return null;
  }

  int? _getCharacterKeyById(String id) {
    final characters = charactersBox.toMap();
    for (var entry in characters.entries) {
      if ((entry.value as Character).id == id) {
        return entry.key;
      }
    }
    return null;
  }
}
