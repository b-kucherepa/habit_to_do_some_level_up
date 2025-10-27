// add_habit_screen.dart
import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import '../services/hive_service.dart';
import '../models/habit.dart';
import '../widgets/schedule_selector.dart';

class AddHabitScreen extends StatelessWidget {
  final Habit? habit;

  const AddHabitScreen({super.key, this.habit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            habit != null ? context.l10n.editHabit : context.l10n.addHabit),
        backgroundColor: Styles.habitAccentColor,
        foregroundColor: Styles.foregroundColor,
      ),
      body: HabitForm(habit: habit),
    );
  }
}

class HabitForm extends StatefulWidget {
  final Habit? habit;

  const HabitForm({super.key, this.habit});

  @override
  _HabitFormState createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _experienceController = TextEditingController(text: '10');
  final _minCompletionController = TextEditingController(text: '1');

  String _selectedScheduleType = 'daily';
  List<int> _selectedDaysOfWeek = [];
  List<int> _selectedDaysOfMonth = [];
  int? _customInterval;

  final HiveService _hiveService = HiveService();

  @override
  void initState() {
    super.initState();
    if (widget.habit != null) {
      final habit = widget.habit!;
      _titleController.text = habit.title;
      _descriptionController.text = habit.description;
      _experienceController.text = habit.experience.toString();
      _minCompletionController.text = habit.minCompletionCount.toString();
      _selectedScheduleType = habit.scheduleType;
      _selectedDaysOfWeek = habit.daysOfWeek ?? [];
      _selectedDaysOfMonth = habit.daysOfMonth ?? [];
      _customInterval = habit.intervalDays;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Styles.getGap('L')),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: Styles.getGap('S')),
            _buildBasicInfoFields(),
            SizedBox(height: Styles.getGap('XL')),
            ScheduleSelector(
              scheduleType: _selectedScheduleType,
              onScheduleTypeChanged: (newType) {
                setState(() {
                  _selectedScheduleType = newType;
                  _selectedDaysOfWeek.clear();
                  _selectedDaysOfMonth.clear();
                  _customInterval = null;
                });
              },
              selectedDaysOfWeek: _selectedDaysOfWeek,
              selectedDaysOfMonth: _selectedDaysOfMonth,
              customInterval: _customInterval,
              onDaysOfWeekChanged: (days) =>
                  setState(() => _selectedDaysOfWeek = days),
              onDaysOfMonthChanged: (days) =>
                  setState(() => _selectedDaysOfMonth = days),
              onCustomIntervalChanged: (interval) =>
                  setState(() => _customInterval = interval),
            ),
            SizedBox(height: Styles.getGap('XXL')),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoFields() {
    return Column(
      children: [
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            labelText: context.l10n.habitFormTitle,
            floatingLabelStyle: TextStyle(color: Styles.habitFormFrontColor),
            border: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: Styles.habitFormFocusedBorder),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.l10n.habitFormTitleError;
            }
            return null;
          },
        ),
        SizedBox(height: Styles.getGap('L')),
        TextFormField(
          controller: _descriptionController,
          decoration: InputDecoration(
            labelText: context.l10n.habitFormDescription,
            floatingLabelStyle: TextStyle(color: Styles.habitFormFrontColor),
            border: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: Styles.habitFormFocusedBorder),
          ),
          maxLines: 3,
        ),
        SizedBox(height: Styles.getGap('L')),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(
                  labelText: context.l10n.habitFormExperience,
                  floatingLabelStyle:
                      TextStyle(color: Styles.habitFormFrontColor),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: Styles.habitFormFocusedBorder),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.habitFormExperienceError;
                  }
                  if (int.tryParse(value) == null) {
                    return context.l10n.habitFormNumberError;
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: Styles.getGap('L')),
            Expanded(
              child: TextFormField(
                controller: _minCompletionController,
                decoration: InputDecoration(
                  labelText: context.l10n.habitFormMinCompletion,
                  floatingLabelStyle:
                      TextStyle(color: Styles.habitFormFrontColor),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: Styles.habitFormFocusedBorder),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.habitFormMinCompletionError;
                  }
                  if (int.tryParse(value) == null || int.parse(value) < 1) {
                    return context.l10n.habitFormMinCountError;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _saveHabit,
      style: ElevatedButton.styleFrom(
        backgroundColor: Styles.habitAccentColor,
        padding: EdgeInsets.symmetric(vertical: Styles.getGap('L')),
      ),
      child: Text(
        widget.habit != null
            ? context.l10n.habitFormUpdate
            : context.l10n.habitFormSave,
        style: Styles.addFormButtonFont,
      ),
    );
  }

  void _saveHabit() {
    if (!_formKey.currentState!.validate()) return;

    final scheduleValid = _validateSchedule();
    if (!scheduleValid) return;

    final habit = Habit(
      id: widget.habit?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      description: _descriptionController.text,
      experience: int.parse(_experienceController.text),
      minCompletionCount: int.parse(_minCompletionController.text),
      scheduleType: _selectedScheduleType,
      daysOfWeek: _selectedDaysOfWeek.isNotEmpty ? _selectedDaysOfWeek : null,
      daysOfMonth:
          _selectedDaysOfMonth.isNotEmpty ? _selectedDaysOfMonth : null,
      intervalDays: _customInterval,
      createdDate: widget.habit?.createdDate ?? DateTime.now(),
      completionCount: widget.habit?.completionCount ?? 0,
      karmaLevel: widget.habit?.karmaLevel ?? 0,
    );

    _saveToHive(habit);
    Navigator.pop(context);
  }

  bool _validateSchedule() {
    if (_selectedScheduleType == 'weekly' && _selectedDaysOfWeek.isEmpty) {
      _showError(context.l10n.habitFormWeeklyError);
      return false;
    }

    if (_selectedScheduleType == 'monthly' && _selectedDaysOfMonth.isEmpty) {
      _showError(context.l10n.habitFormMonthlyError);
      return false;
    }

    if (_selectedScheduleType == 'custom' && _customInterval == null) {
      _showError(context.l10n.habitFormCustomError);
      return false;
    }

    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _saveToHive(Habit habit) {
    if (widget.habit != null) {
      _hiveService.updateHabit(habit);
    } else {
      _hiveService.habitsBox.add(habit);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}
