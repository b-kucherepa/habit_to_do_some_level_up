// add_task_screen.dart
import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import '../services/hive_service.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Task? task;

  const AddTaskScreen({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(task != null ? context.l10n.editTask : context.l10n.addTask),
        backgroundColor: Styles.taskAccentColor,
        foregroundColor: Styles.foregroundColor,
      ),
      body: TaskForm(task: task),
    );
  }
}

class TaskForm extends StatefulWidget {
  final Task? task;

  const TaskForm({super.key, this.task});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _experienceController = TextEditingController(text: '25');

  DateTime _dueDate = DateTime.now().add(Duration(days: 1));
  int _priority = Task.defaultPriority;
  String _category = Task.defaultCategory;

  final HiveService _hiveService = HiveService();

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      final task = widget.task!;
      _titleController.text = task.title;
      _descriptionController.text = task.description;
      _experienceController.text = task.experience.toString();
      _dueDate = task.dueDate;
      _priority = task.priority;
      _category = task.category;
    } else {
      _dueDate = DateTime.now().add(Duration(days: 1));
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
            _buildBasicInfoFields(context),
            SizedBox(height: Styles.getGap('L')),
            _buildDueDateSelector(context),
            SizedBox(height: Styles.getGap('L')),
            _buildPrioritySelector(context),
            SizedBox(height: Styles.getGap('L')),
            _buildCategorySelector(context),
            SizedBox(height: Styles.getGap('XXL')),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoFields(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
              labelText: context.l10n.taskFormTitle,
              floatingLabelStyle: TextStyle(color: Styles.taskFormFrontColor),
              border: OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: Styles.taskFormFocusedBorder)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.l10n.taskFormTitleError;
            }
            return null;
          },
        ),
        SizedBox(height: Styles.getGap('L')),
        TextFormField(
          controller: _descriptionController,
          decoration: InputDecoration(
              labelText: context.l10n.taskFormDescription,
              floatingLabelStyle: TextStyle(color: Styles.taskFormFrontColor),
              border: OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: Styles.taskFormFocusedBorder)),
          maxLines: 3,
        ),
        SizedBox(height: Styles.getGap('L')),
        TextFormField(
          controller: _experienceController,
          decoration: InputDecoration(
              labelText: context.l10n.taskFormExperience,
              floatingLabelStyle: TextStyle(color: Styles.taskFormFrontColor),
              border: OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: Styles.taskFormFocusedBorder)),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.l10n.taskFormExperienceError;
            }
            if (int.tryParse(value) == null) {
              return context.l10n.taskFormNumberError;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDueDateSelector(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            context.l10n.taskFormDueDateLabel(
                _dueDate.toLocal().toString().split(' ')[0]),
            style: Styles.addFormFont,
          ),
        ),
        ElevatedButton(
          onPressed: () => _selectDueDate(context),
          style: ElevatedButton.styleFrom(
            foregroundColor: Styles.taskFormFrontColor,
            backgroundColor: Styles.foregroundColor,
          ),
          child: Text(context.l10n.taskFormSelectDate),
        ),
      ],
    );
  }

  Widget _buildPrioritySelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.taskFormPriorityLabel(_priority),
            style: Styles.addFormFont),
        Slider(
          thumbColor: Styles.taskAccentColor,
          activeColor: Styles.getTaskPriorityColor(_priority),
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

  Widget _buildCategorySelector(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: _category,
      items: Task.taskCategories.map((String category) {
        return DropdownMenuItem(
          value: category,
          child: Row(children: [
            Styles.getTaskCategoryIcon(category),
            SizedBox(width: Styles.getGap('S')),
            Text(
              _getLocalizedCategory(context, category),
              style: Styles.getTaskCategoryFont(category),
            )
          ]),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _category = value!;
        });
      },
      focusColor: Styles.taskCompletedBackColor,
      decoration: InputDecoration(
          labelText: context.l10n.taskFormCategory,
          floatingLabelStyle: TextStyle(color: Styles.taskFormFrontColor),
          border: OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: Styles.taskFormFocusedBorder)),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _saveTask,
      style: ElevatedButton.styleFrom(
        backgroundColor: Styles.taskAccentColor,
        padding: EdgeInsets.symmetric(vertical: Styles.getGap('L')),
      ),
      child: Text(
        widget.task != null
            ? context.l10n.taskFormUpdate
            : context.l10n.taskFormSave,
        style: Styles.addFormButtonFont,
      ),
    );
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Styles.datePickerColorScheme,
            dialogTheme: DialogThemeData(backgroundColor: Colors.white),
          ),
          child: child!,
        );
      },
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
        id: widget.task?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        experience: int.parse(_experienceController.text),
        createdDate: widget.task?.createdDate ?? DateTime.now(),
        dueDate: _dueDate,
        priority: _priority,
        category: _category,
        completed: widget.task?.completed ?? false,
        completedDate: widget.task?.completedDate,
      );

      _saveToHive(task);
      Navigator.pop(context);
    }
  }

  void _saveToHive(Task task) {
    if (widget.task != null) {
      _hiveService.updateTask(task);
    } else {
      _hiveService.tasksBox.add(task);
    }
  }

  String _getLocalizedCategory(BuildContext context, String category) =>
      switch (category) {
        'home' => context.l10n.taskCategoryHome,
        'social' => context.l10n.taskCategorySocial,
        'work' => context.l10n.taskCategoryWork,
        'personal' => context.l10n.taskCategoryPersonal,
        'health' => context.l10n.taskCategoryHealth,
        'learning' => context.l10n.taskCategoryLearning,
        'other' => context.l10n.taskCategoryOther,
        _ => context.l10n.taskCategoryOther,
      };

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}
