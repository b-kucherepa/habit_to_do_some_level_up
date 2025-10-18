import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../models/character.dart';

class CharacterSettingsDialog extends StatefulWidget {
  final Character character;

  const CharacterSettingsDialog({super.key, required this.character});

  @override
  _CharacterSettingsDialogState createState() =>
      _CharacterSettingsDialogState();
}

class _CharacterSettingsDialogState extends State<CharacterSettingsDialog> {
  late TextEditingController _goalController;
  late TextEditingController _multiplierController;
  late String _selectedSystem;

  @override
  void initState() {
    super.initState();
    _goalController = TextEditingController(text: widget.character.goal);
    _multiplierController =
        TextEditingController(text: widget.character.multiplier.toString());
    _selectedSystem = widget.character.levelSystem;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.settings, color: Colors.blue),
          SizedBox(width: 8),
          Text('Progress Settings'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Goal Motivation'),
            SizedBox(height: 8),
            TextField(
              controller: _goalController,
              decoration: InputDecoration(
                hintText: 'What are you accumulating experience for?',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),
            Text('Level Calculation System'),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedSystem,
              items: [
                _buildSystemItem('linear', 'Linear', 'Level × 10 × Multiplier',
                    Icons.trending_flat, Colors.blue),
                _buildSystemItem(
                    'square',
                    'Square',
                    '(Level-1)² × 10 × Multiplier',
                    Icons.trending_up,
                    Colors.purple),
                _buildSystemItem(
                    'sqrt',
                    'Square Root',
                    '√(Level-1) × 10 × Multiplier',
                    Icons.trending_down,
                    Colors.green),
                _buildSystemItem(
                    'gauss',
                    'Gauss',
                    '(10 + Triangular(Level)) × Multiplier',
                    Icons.auto_graph,
                    Colors.orange),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedSystem = value!;
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            Text('Level Multiplier'),
            SizedBox(height: 8),
            TextField(
              controller: _multiplierController,
              decoration: InputDecoration(
                hintText: 'Multiplier for XP requirements',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                setState(() {
                  _selectedSystem = _selectedSystem;
                });
              },
            ),
            SizedBox(height: 8),
            Text(
              'Higher values make leveling slower',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 16),
            _buildSystemPreview(),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveSettings,
          child: Text('Save'),
        ),
      ],
    );
  }

  DropdownMenuItem<String> _buildSystemItem(
      String value, String name, String formula, IconData icon, Color color) {
    return DropdownMenuItem(
      value: value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              SizedBox(width: 8),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 4),
          Text(
            formula,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSystemPreview() {
    final multiplier =
        int.tryParse(_multiplierController.text) ?? widget.character.multiplier;
    final previewCharacter = Character(
      id: 'preview',
      goal: 'Preview',
      experience: 0,
      level: 1,
      createdDate: DateTime.now(),
      levelSystem: _selectedSystem,
      multiplier: multiplier,
    );

    final lineColor = switch (_selectedSystem) {
      'linear' => Colors.blue,
      'square' => Colors.purple,
      'sqrt' => Colors.green,
      'gauss' => Colors.orange,
      _ => Colors.blue
    };

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Level Progression Preview:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 500,
            height: 200, // Фиксированная высота для графика
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text('L${value.toInt()}');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 60,
                      getTitlesWidget: (value, meta) {
                        return Text('${value.toInt()}');
                      },
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: true),
                minX: 2,
                maxX: 10,
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                      8,
                      9,
                      10,
                    ].map((level) {
                      final expNeeded =
                          previewCharacter.getExperienceForLevel(level);
                      return FlSpot(level.toDouble(), expNeeded.toDouble());
                    }).toList(),
                    isCurved: true,
                    color: lineColor,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveSettings() {
    final multiplier =
        int.tryParse(_multiplierController.text) ?? widget.character.multiplier;

    final updatedCharacter = Character(
      id: widget.character.id,
      goal: _goalController.text.isNotEmpty
          ? _goalController.text
          : 'Accumulate experience for your RPG journey!',
      experience: widget.character.experience,
      level: widget.character.level,
      createdDate: widget.character.createdDate,
      levelSystem: _selectedSystem,
      multiplier: multiplier > 0 ? multiplier : 1,
    );

    // Пересчитываем уровень с новой системой
    updatedCharacter.updateLevel();

    Navigator.of(context).pop(updatedCharacter);
  }

  @override
  void dispose() {
    _goalController.dispose();
    _multiplierController.dispose();
    super.dispose();
  }
}
