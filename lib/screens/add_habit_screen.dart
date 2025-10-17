import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/habit.dart';

class AddHabitScreen extends StatefulWidget {
  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _experienceController = TextEditingController(text: '10');
  
  String _selectedScheduleType = 'daily';
  List<int> _selectedDaysOfWeek = [];
  List<int> _selectedDaysOfMonth = [];
  int? _customInterval;
  
  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<int> _weekDayNumbers = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Habit'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Habit Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
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
              SizedBox(height: 24),
              Text('Schedule Type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: _selectedScheduleType,
                items: [
                  DropdownMenuItem(value: 'daily', child: Text('Daily')),
                  DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
                  DropdownMenuItem(value: 'monthly', child: Text('Monthly')),
                  DropdownMenuItem(value: 'custom', child: Text('Custom Interval')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedScheduleType = value!;
                    _selectedDaysOfWeek.clear();
                    _selectedDaysOfMonth.clear();
                    _customInterval = null;
                  });
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 16),
              
              // Weekly schedule options
              if (_selectedScheduleType == 'weekly') ..._buildWeeklySchedule(),
              
              // Monthly schedule options  
              if (_selectedScheduleType == 'monthly') ..._buildMonthlySchedule(),
              
              // Custom interval options
              if (_selectedScheduleType == 'custom') ..._buildCustomSchedule(),
              
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveHabit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Save Habit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWeeklySchedule() {
    return [
      Text('Select days:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(7, (index) {
          return FilterChip(
            label: Text(_weekDays[index]),
            selected: _selectedDaysOfWeek.contains(_weekDayNumbers[index]),
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedDaysOfWeek.add(_weekDayNumbers[index]);
                } else {
                  _selectedDaysOfWeek.remove(_weekDayNumbers[index]);
                }
              });
            },
          );
        }),
      ),
      SizedBox(height: 16),
    ];
  }

  List<Widget> _buildMonthlySchedule() {
    return [
      Text('Select days of month:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(31, (index) {
          final day = index + 1;
          return FilterChip(
            label: Text(day.toString()),
            selected: _selectedDaysOfMonth.contains(day),
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedDaysOfMonth.add(day);
                } else {
                  _selectedDaysOfMonth.remove(day);
                }
              });
            },
          );
        }),
      ),
      SizedBox(height: 16),
    ];
  }

  List<Widget> _buildCustomSchedule() {
    return [
      Text('Repeat every X days:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      DropdownButtonFormField<int>(
        value: _customInterval,
        items: [1, 2, 3, 4, 5, 6, 7].map((days) {
          return DropdownMenuItem(
            value: days,
            child: Text('$days day${days > 1 ? 's' : ''}'),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _customInterval = value;
          });
        },
        decoration: InputDecoration(border: OutlineInputBorder()),
        validator: (value) {
          if (_selectedScheduleType == 'custom' && value == null) {
            return 'Please select interval';
          }
          return null;
        },
      ),
      SizedBox(height: 16),
    ];
  }

  void _saveHabit() {
    if (_formKey.currentState!.validate()) {
      // Validate schedule-specific requirements
      if (_selectedScheduleType == 'weekly' && _selectedDaysOfWeek.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select at least one day for weekly schedule')),
        );
        return;
      }
      
      if (_selectedScheduleType == 'monthly' && _selectedDaysOfMonth.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select at least one day for monthly schedule')),
        );
        return;
      }
      
      if (_selectedScheduleType == 'custom' && _customInterval == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select interval for custom schedule')),
        );
        return;
      }

      final habit = Habit(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        experience: int.parse(_experienceController.text),
        scheduleType: _selectedScheduleType,
        daysOfWeek: _selectedDaysOfWeek.isNotEmpty ? _selectedDaysOfWeek : null,
        daysOfMonth: _selectedDaysOfMonth.isNotEmpty ? _selectedDaysOfMonth : null,
        intervalDays: _customInterval,
        createdDate: DateTime.now(),
      );

      final habitsBox = Hive.box('habits');
      habitsBox.add(habit);

      Navigator.pop(context);
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