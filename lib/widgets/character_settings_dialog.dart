import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import '../language_manager.dart';
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
    final languageManager = context.watch<LanguageManager>();

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.settings, color: Colors.blue),
          SizedBox(width: 8),
          Text(context.l10n.progressSettings),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.goalMotivation),
            SizedBox(height: 8),
            TextField(
              controller: _goalController,
              decoration: InputDecoration(
                hintText: context.l10n.goalMotivationHint,
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.language, size: 20, color: Colors.grey),
                SizedBox(width: 8),
                Text(context.l10n.language),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<Locale>(
                    value: languageManager.locale,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        value: Locale('en'),
                        child: Text(context.l10n.english),
                      ),
                      DropdownMenuItem(
                        value: Locale('ru'),
                        child: Text(context.l10n.russian),
                      ),
                      DropdownMenuItem(
                        value: Locale('de'),
                        child: Text(context.l10n.german),
                      ),
                      DropdownMenuItem(
                        value: Locale('fr'),
                        child: Text(context.l10n.french),
                      ),
                      DropdownMenuItem(
                        value: Locale('es'),
                        child: Text(context.l10n.spanish),
                      ),
                      DropdownMenuItem(
                        value: Locale('pt'),
                        child: Text(context.l10n.portuguese),
                      ),
                      DropdownMenuItem(
                        value: Locale('zh'),
                        child: Text(context.l10n.chinese),
                      ),
                      DropdownMenuItem(
                        value: Locale('ja'),
                        child: Text(context.l10n.japanese),
                      ),
                      DropdownMenuItem(
                        value: Locale('ko'),
                        child: Text(context.l10n.korean),
                      ),
                      DropdownMenuItem(
                        value: Locale('hi'),
                        child: Text(context.l10n.hindi),
                      ),
                      DropdownMenuItem(
                        value: Locale('ar'),
                        child: Text(context.l10n.arabic),
                      ),
                      DropdownMenuItem(
                        value: Locale('he'),
                        child: Text(context.l10n.hebrew),
                      ),
                    ],
                    onChanged: (locale) {
                      if (locale != null) {
                        languageManager.setLocale(locale);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(context.l10n.curveExponent),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: _curveExponent,
                  min: Character.minCurveExponent,
                  max: Character.maxCurveExponent,
                  divisions: ((Character.maxCurveExponent -
                              Character.minCurveExponent) *
                          10)
                      .round(),
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
                    Text(Character.minCurveExponent.toStringAsFixed(1),
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(Character.maxCurveExponent.toStringAsFixed(1),
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              context.l10n
                  .curveExponentDescription(_curveExponent.toStringAsFixed(1)),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(context.l10n.experienceMultiplier),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: _experienceMultiplier,
                  min: Character.minExperienceMultiplier,
                  max: Character.maxExperienceMultiplier,
                  divisions: ((Character.maxExperienceMultiplier -
                              Character.minExperienceMultiplier) /
                          10)
                      .round(),
                  label: _experienceMultiplier.toStringAsFixed(0),
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
                    Text(Character.minExperienceMultiplier.toStringAsFixed(0),
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(Character.maxExperienceMultiplier.toStringAsFixed(0),
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              context.l10n.experienceMultiplierDescription(
                  _experienceMultiplier.toStringAsFixed(1)),
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
          child: Text(context.l10n.cancel),
        ),
        ElevatedButton(
          onPressed: _saveSettings,
          child: Text(context.l10n.save),
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
      experienceMultiplier: _experienceMultiplier,
    );

    // Динамический цвет в зависимости от параметров
    final hue = (((2 - _curveExponent) / 1.2) * 210).clamp(0.0, 210.0);
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
            context.l10n.levelProgressionPreview,
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
                      interval: 2,
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
                maxX: 20,
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(19, (index) {
                      final level = index + 2;
                      final expNeeded =
                          previewCharacter.getExperienceForLevel(level);
                      return FlSpot(level.toDouble(), expNeeded.toDouble());
                    }),
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
            context.l10n.levelFormula(_experienceMultiplier.toStringAsFixed(1),
                _curveExponent.toStringAsFixed(1)),
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
          : context.l10n.defaultGoal,
      experience: widget.character.experience,
      level: widget.character.level,
      createdDate: widget.character.createdDate,
      curveExponent: _curveExponent,
      experienceMultiplier: _experienceMultiplier,
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
