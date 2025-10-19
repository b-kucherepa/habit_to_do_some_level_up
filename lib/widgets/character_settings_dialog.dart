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
  late double _curveExponent;
  late double _experienceMultiplier;

  @override
  void initState() {
    super.initState();
    _goalController = TextEditingController(text: widget.character.goal);
    _curveExponent = widget.character.curveExponent;
    _experienceMultiplier = widget.character.experienceMultiplier;
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
            Text('Curve Exponent (m)'),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: _curveExponent,
                  min: 0.1,
                  max: 3.0,
                  divisions: 29, // (3.0 - 0.1) / 0.1 = 29 divisions
                  label: _curveExponent.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _curveExponent = value;
                    });
                  },
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0.1',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text('3.0',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Curve exponent: ${_curveExponent.toStringAsFixed(1)}. '
              'Values <1 make early levels easier, >1 make later levels easier',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text('Experience Multiplier (k)'),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: _experienceMultiplier,
                  min: 0.1,
                  max: 10.0,
                  divisions: 99, // (10.0 - 0.1) / 0.1 = 99 divisions
                  label: _experienceMultiplier.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _experienceMultiplier = value;
                    });
                  },
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0.1',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text('10.0',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Experience multiplier: ${_experienceMultiplier.toStringAsFixed(1)}. '
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

  Widget _buildSystemPreview() {
    final previewCharacter = Character(
      id: 'preview',
      goal: 'Preview',
      experience: 0,
      level: 1,
      createdDate: DateTime.now(),
      curveExponent: _curveExponent,
      experienceMultiplier:
          _experienceMultiplier * 100, // Convert to actual XP values
    );

    // Динамический цвет в зависимости от параметров
    final hue = (220 - (_curveExponent / 3.0) * 220).clamp(0.0, 220.0);
    final lineColor = HSLColor.fromAHSL(1.0, hue, 0.7, 0.6).toColor();

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
            height: 200,
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
          SizedBox(height: 8),
          Text(
            'Formula: XP = ${_experienceMultiplier.toStringAsFixed(1)} × (Level-1)^${_curveExponent.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _saveSettings() {
    final updatedCharacter = Character(
      id: widget.character.id,
      goal: _goalController.text.isNotEmpty
          ? _goalController.text
          : 'Accumulate experience for your RPG journey!',
      experience: widget.character.experience,
      level: widget.character.level,
      createdDate: widget.character.createdDate,
      curveExponent: _curveExponent,
      experienceMultiplier:
          _experienceMultiplier, // Convert to actual XP values
    );

    // Пересчитываем уровень с новой системой
    updatedCharacter.updateLevel();

    Navigator.of(context).pop(updatedCharacter);
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }
}
