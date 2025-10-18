import 'package:flutter/material.dart';
import '../services/hive_service.dart';
import '../models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _experienceController = TextEditingController(text: '25');

  DateTime _dueDate = DateTime.now().add(Duration(days: 1));
  int _priority = 3;
  String _category = 'general';

  final List<String> _categories = [
    'general',
    'work',
    'personal',
    'health',
    'learning',
    'home',
    'social'
  ];

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
            SizedBox(height: 16),
            _buildDueDateSelector(),
            SizedBox(height: 16),
            _buildPrioritySelector(),
            SizedBox(height: 16),
            _buildCategorySelector(),
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
            labelText: 'Task Title',
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
      ],
    );
  }

  Widget _buildDueDateSelector() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Due Date: ${_dueDate.toLocal().toString().split(' ')[0]}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ElevatedButton(
          onPressed: () => _selectDueDate(context),
          child: Text('Select Date'),
        ),
      ],
    );
  }

  Widget _buildPrioritySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority: $_priority', style: TextStyle(fontSize: 16)),
        Slider(
          value: _priority.toDouble(),
          min: 1,
          max: 5,
          divisions: 4,
          onChanged: (value) {
            setState(() {
              _priority = value.toInt();
            });
          },
        ),
      ],
    );
  }

  Widget _buildCategorySelector() {
    return DropdownButtonFormField<String>(
      initialValue: _category,
      items: _categories.map((String category) {
        return DropdownMenuItem(
          value: category,
          child: Text(_capitalizeFirstLetter(category)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _category = value!;
        });
      },
      decoration: InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _saveTask,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        'Save Task',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _dueDate) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final task = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        experience: int.parse(_experienceController.text),
        createdDate: DateTime.now(),
        dueDate: _dueDate,
        priority: _priority,
        category: _category,
      );

      _saveToHive(task);
      Navigator.pop(context);
    }
  }

  void _saveToHive(Task task) {
    _hiveService.tasksBox.add(task);
  }

  String _capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}
