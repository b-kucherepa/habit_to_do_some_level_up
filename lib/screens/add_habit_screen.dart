import 'package:flutter/material.dart';
import '../widgets/habit_form.dart';
import '../models/habit.dart';

class AddHabitScreen extends StatelessWidget {
  final Habit? habit; // Для редактирования

  const AddHabitScreen({super.key, this.habit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(habit != null ? 'Edit Habit' : 'Add New Habit'),
        backgroundColor: Colors.green,
      ),
      body: HabitForm(habit: habit),
    );
  }
}
