import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/character.dart';
import 'models/task.dart';
import 'models/habit.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Инициализируем Hive с путем на вашем диске
  await Hive.initFlutter('/mnt/L/flutter_data/todo_rpg');
  
  // Регистрируем адаптеры
  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(TaskAdapter()); // Добавляем адаптер для Task
  Hive.registerAdapter(HabitAdapter());
  
  // Открываем боксы
  await Hive.openBox('characters');
  await Hive.openBox('tasks'); // Добавляем открытие бокса задач
  await Hive.openBox('habits');
  await Hive.openBox('app_settings');
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG Todo & Habits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}