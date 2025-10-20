import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import '../services/hive_service.dart';
import '../models/habit.dart';
import '../schedule_selector.dart';

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
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildBasicInfoFields(),
            SizedBox(height: 24),
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
            SizedBox(height: 32),
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
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty)
              return context.l10n.habitFormTitleError;
            return null;
          },
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: _descriptionController,
          decoration: InputDecoration(
            labelText: context.l10n.habitFormDescription,
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(
                  labelText: context.l10n.habitFormExperience,
                  border: OutlineInputBorder(),
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
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _minCompletionController,
                decoration: InputDecoration(
                  labelText: context.l10n.habitFormMinCompletion,
                  border: OutlineInputBorder(),
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
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        widget.habit != null
            ? context.l10n.habitFormUpdate
            : context.l10n.habitFormSave,
        style: TextStyle(fontSize: 18, color: Colors.white),
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
      completionHistory: widget.habit?.completionHistory ?? {},
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
