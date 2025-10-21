import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/styles.dart';
import '../widgets/habit_form.dart';
import '../models/habit.dart';

class AddHabitScreen extends StatelessWidget {
  final Habit? habit; // Для редактирования

  const AddHabitScreen({super.key, this.habit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            habit != null ? context.l10n.editHabit : context.l10n.addHabit),
        backgroundColor: Styles.habitAccentColor,
      ),
      body: HabitForm(habit: habit),
    );
  }
}
