import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/character.dart';
import '../models/task.dart';
import '../models/habit.dart';
import 'add_habit_screen.dart';
import 'add_task_screen.dart';
import '../widgets/character_tab.dart';
import '../widgets/habits_tab.dart';
import '../widgets/tasks_tab.dart';

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
      case 0: return Colors.blue;
      case 1: return Colors.green;
      case 2: return Colors.orange;
      default: return Colors.blue;
    }
  }

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
        );
      case 2: 
        return TasksTab(
          tasksBox: tasksBox,
          charactersBox: charactersBox,
          onTaskToggle: _toggleTaskCompletion,
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
        
        if (completed) {
          _updateCharacterExperience(habit.experience);
        }
      }
    });
  }

  void _toggleTaskCompletion(Task task, bool completed) {
    setState(() {
      final tasks = _getTasksFromBox(tasksBox);
      final taskIndex = tasks.indexWhere((t) => t.id == task.id);
      
      if (taskIndex != -1) {
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
        
        if (completed) {
          _updateCharacterExperience(task.experience);
        }
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
      
      updatedCharacter.level = (updatedCharacter.experience / 100).floor() + 1;
      
      final characterKey = _getCharacterKeyById(character.id);
      if (characterKey != null) {
        charactersBox.put(characterKey, updatedCharacter);
      }
    }
  }

  void _createDefaultCharacter() {
    final character = Character(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'Adventurer',
      createdDate: DateTime.now(),
    );
    charactersBox.add(character);
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Helper methods
  List<Character> _getCharactersFromBox(Box box) {
    return box.values.map((dynamic item) => item as Character).toList();
  }

  List<Habit> _getHabitsFromBox(Box box) {
    return box.values.map((dynamic item) => item as Habit).toList();
  }

  List<Task> _getTasksFromBox(Box box) {
    return box.values.map((dynamic item) => item as Task).toList();
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

  int? _getHabitKeyById(String id) {
    final habits = habitsBox.toMap();
    for (var entry in habits.entries) {
      if ((entry.value as Habit).id == id) {
        return entry.key;
      }
    }
    return null;
  }

  int? _getTaskKeyById(String id) {
    final tasks = tasksBox.toMap();
    for (var entry in tasks.entries) {
      if ((entry.value as Task).id == id) {
        return entry.key;
      }
    }
    return null;
  }
}