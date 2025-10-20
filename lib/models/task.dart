import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  static const defaultPriority = 3;
  static const minPriority = 1;
  static const maxPriority = 5;
  static const defaultCategory = 'general';
  static const List<String> taskCategories = [
    'general',
    'work',
    'personal',
    'health',
    'learning',
    'home',
    'social'
  ];

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int experience;

  @HiveField(4)
  bool completed;

  @HiveField(5)
  DateTime? completedDate;

  @HiveField(6)
  final DateTime createdDate;

  @HiveField(7)
  final DateTime dueDate;

  @HiveField(8)
  final int priority; // 1-5, где 5 - наивысший

  @HiveField(9)
  final String category; // work, personal, health, etc.

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.experience,
    this.completed = false,
    this.completedDate,
    required this.createdDate,
    required this.dueDate,
    this.priority = defaultPriority,
    this.category = defaultCategory,
  });

  bool get isOverdue => !completed && dueDate.isBefore(DateTime.now());
  bool get isDueToday =>
      !completed &&
      dueDate.day == DateTime.now().day &&
      dueDate.month == DateTime.now().month &&
      dueDate.year == DateTime.now().year;
  bool get isDueSoon =>
      !completed &&
      dueDate.isBefore(DateTime.now().add(Duration(days: 3))) &&
      !isDueToday &&
      !isOverdue;
}
