import 'package:flutter/material.dart';
import '../widgets/habit_form.dart';

class AddHabitScreen extends StatelessWidget {
  const AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Habit'),
        backgroundColor: Colors.green,
      ),
      body: HabitForm(),
    );
  }
}
