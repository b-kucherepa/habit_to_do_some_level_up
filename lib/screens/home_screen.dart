import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../models/task.dart';
import '../services/experience_service.dart';
import '../services/hive_service.dart';
import '../widgets/character_tab.dart';
import '../widgets/habits_tab.dart';
import '../widgets/tasks_tab.dart';
import 'add_habit_screen.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HiveService _hiveService = HiveService();
  final ExperienceService _experienceService = ExperienceService();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Убираем initializeBoxes, так как боксы уже открыты в main.dart
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
      bottomNavigationBar: _buildBottomNavigationBar(),
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

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return CharacterTab(
            //onCreateCharacter: _createDefaultCharacter,
            );
      case 1:
        return HabitsTab(
          onHabitIncrement: _incrementHabitCompletion,
          onHabitDecrement: _decrementHabitCompletion,
          onHabitDelete: _deleteHabit,
        );
      case 2:
        return TasksTab(
          onTaskToggle: _toggleTaskCompletion,
          onTaskDelete: _deleteTask,
        );
      default:
        return CharacterTab(
            //onCreateCharacter: _createDefaultCharacter,
            );
    }
  }

  Widget? _buildFloatingActionButton() {
    switch (_selectedIndex) {
      case 1:
        return FloatingActionButton(
          onPressed: () => _navigateToAddHabit(context),
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
        );
      case 2:
        return FloatingActionButton(
          onPressed: () => _navigateToAddTask(context),
          backgroundColor: Colors.orange,
          child: Icon(Icons.add),
        );
      default:
        return null;
    }
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }

  void _incrementHabitCompletion(Habit habit) {
    setState(() {
      _experienceService.incrementHabitCompletion(habit);
    });
  }

  void _decrementHabitCompletion(Habit habit) {
    setState(() {
      _experienceService.decrementHabitCompletion(habit);
    });
  }

  void _toggleTaskCompletion(Task task, bool completed) {
    setState(() {
      _experienceService.toggleTaskCompletion(task, completed);
    });
  }

  void _deleteHabit(Habit habit) {
    setState(() {
      _experienceService.deleteHabit(habit);
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      _experienceService.deleteTask(task);
    });
  }

  void _createDefaultCharacter() {
    setState(() {
      _hiveService.createDefaultCharacter();
    });
  }

  void _navigateToAddHabit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddHabitScreen()),
    ).then((_) => setState(() {}));
  }

  void _navigateToAddTask(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    ).then((_) => setState(() {}));
  }

  void _navigateToEditTask(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    ).then((_) => setState(() {}));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
