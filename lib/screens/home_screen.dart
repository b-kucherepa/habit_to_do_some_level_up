import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/services/level_up_service.dart';
import 'package:todo_rpg_app/styles.dart';
import '../models/habit.dart';
import '../models/task.dart';
import '../services/experience_service.dart';
import '../services/hive_service.dart';
import '../widgets/player_tab.dart';
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
  static const _defaultSelectedIndex = 0;
  final HiveService _hiveService = HiveService();
  late final ExperienceService _experienceService;
  int _selectedIndex = _defaultSelectedIndex;

  @override
  void initState() {
    super.initState();
    // Получаем сервисы через Provider
    _experienceService = ExperienceService(
      _hiveService,
      Provider.of<LevelUpService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        backgroundColor: Styles.getAppBarColor(_selectedIndex),
      ),
      backgroundColor: Styles.tabsBackColor,
      body: _getBody(_selectedIndex),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return PlayerTab(
            //onCreatePlayer: _createDefaultPlayer,
            );
      case 1:
        return HabitsTab(
          onHabitIncrement: _incrementHabitCompletion,
          onHabitDecrement: _decrementHabitCompletion,
          onHabitDelete: _deleteHabit,
          experienceService: _experienceService,
        );
      case 2:
        return TasksTab(
          onTaskToggle: _toggleTaskCompletion,
          onTaskDelete: _deleteTask,
          experienceService: _experienceService,
        );
      default:
        return PlayerTab(
            //onCreatePlayer: _createDefaultPlayer,
            );
    }
  }

  Widget? _buildFloatingActionButton() {
    switch (_selectedIndex) {
      case 1:
        return FloatingActionButton(
          onPressed: () => _navigateToAddHabit(context),
          backgroundColor: Styles.habitAccentColor,
          child: Styles.addButtonLargeIcon,
        );
      case 2:
        return FloatingActionButton(
          onPressed: () => _navigateToAddTask(context),
          backgroundColor: Styles.taskAccentColor,
          child: Styles.addButtonLargeIcon,
        );
      default:
        return null;
    }
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Styles.navigatorBackColor,
      items: [
        BottomNavigationBarItem(
          icon: Styles.playerTabIcon,
          label: context.l10n.home,
        ),
        BottomNavigationBarItem(
          icon: Styles.habitsTabIcon,
          label: context.l10n.habits,
        ),
        BottomNavigationBarItem(
          icon: Styles.tasksTabIcon,
          label: context.l10n.tasks,
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
