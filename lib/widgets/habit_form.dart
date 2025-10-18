import 'package:flutter/material.dart';
import '../services/hive_service.dart';
import '../models/habit.dart';
import '../schedule_selector.dart';

class HabitForm extends StatefulWidget {
  const HabitForm({super.key});

  @override
  _HabitFormState createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _experienceController = TextEditingController(text: '10');

  String _selectedScheduleType = 'daily';
  List<int> _selectedDaysOfWeek = [];
  List<int> _selectedDaysOfMonth = [];
  int? _customInterval;

  final HiveService _hiveService = HiveService();

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
            labelText: 'Habit Title',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Please enter a title';
            return null;
          },
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: _descriptionController,
          decoration: InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: _experienceController,
          decoration: InputDecoration(
            labelText: 'Experience Points',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter experience';
            }
            if (int.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
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
        'Save Habit',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  void _saveHabit() {
    if (!_formKey.currentState!.validate()) return;

    final scheduleValid = _validateSchedule();
    if (!scheduleValid) return;

    final habit = Habit(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      description: _descriptionController.text,
      experience: int.parse(_experienceController.text),
      scheduleType: _selectedScheduleType,
      daysOfWeek: _selectedDaysOfWeek.isNotEmpty ? _selectedDaysOfWeek : null,
      daysOfMonth:
          _selectedDaysOfMonth.isNotEmpty ? _selectedDaysOfMonth : null,
      intervalDays: _customInterval,
      createdDate: DateTime.now(),
    );

    _saveToHive(habit);
    Navigator.pop(context);
  }

  bool _validateSchedule() {
    if (_selectedScheduleType == 'weekly' && _selectedDaysOfWeek.isEmpty) {
      _showError('Please select at least one day for weekly schedule');
      return false;
    }

    if (_selectedScheduleType == 'monthly' && _selectedDaysOfMonth.isEmpty) {
      _showError('Please select at least one day for monthly schedule');
      return false;
    }

    if (_selectedScheduleType == 'custom' && _customInterval == null) {
      _showError('Please select interval for custom schedule');
      return false;
    }

    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _saveToHive(Habit habit) {
    _hiveService.habitsBox.add(habit);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}
