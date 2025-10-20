import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'models/character.dart';
import 'models/habit.dart';
import 'models/task.dart';
import 'screens/day_completion_wrapper.dart'; // Изменён импорт

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<Character>('characters');
  await Hive.openBox<Habit>('habits');
  await Hive.openBox<Task>('tasks');
  await Hive.openBox('preferences');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG Todo & Habits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DayCompletionWrapper(), // Используем обёртку
    );
  }
}
