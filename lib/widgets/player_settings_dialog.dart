import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/styles.dart';
import '../language_manager.dart';
import '../models/player.dart';

class PlayerSettingsDialog extends StatefulWidget {
  final Player player;

  const PlayerSettingsDialog({super.key, required this.player});

  @override
  _PlayerSettingsDialogState createState() => _PlayerSettingsDialogState();
}

class _PlayerSettingsDialogState extends State<PlayerSettingsDialog> {
  late TextEditingController _goalController;
  late double _curveExponent;
  late double _experienceMultiplier;

  @override
  void initState() {
    super.initState();
    _goalController = TextEditingController(text: widget.player.goal);
    _curveExponent = widget.player.curveExponent;
    _experienceMultiplier = widget.player.experienceMultiplier;
  }

  @override
  Widget build(BuildContext context) {
    final languageManager = context.watch<LanguageManager>();

    return AlertDialog(
      title: Row(
        children: [
          Styles.settingsIcon,
          SizedBox(width: Styles.gap['small']),
          Text(context.l10n.progressSettings),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.goalMotivation),
            SizedBox(height: Styles.gap['small']),
            TextField(
              controller: _goalController,
              decoration: InputDecoration(
                hintText: context.l10n.goalMotivationHint,
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: Styles.gap['large']),
            Row(
              children: [
                Styles.languageOptionIcon,
                SizedBox(width: Styles.gap['small']),
                Text(context.l10n.language),
                SizedBox(width: Styles.gap['large']),
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
            SizedBox(height: Styles.gap['large']),
            Text(context.l10n.curveExponent),
            SizedBox(height: Styles.gap['small']),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: _curveExponent,
                  min: Player.minCurveExponent,
                  max: Player.maxCurveExponent,
                  divisions:
                      ((Player.maxCurveExponent - Player.minCurveExponent) * 10)
                          .round(),
                  label: _curveExponent.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _curveExponent = value;
                    });
                  },
                ),
                SizedBox(height: Styles.gap['tiny']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Player.minCurveExponent.toStringAsFixed(1),
                        style: Styles.expPreviewSliderExtremities),
                    Text(Player.maxCurveExponent.toStringAsFixed(1),
                        style: Styles.expPreviewSliderExtremities),
                  ],
                ),
              ],
            ),
            SizedBox(height: Styles.gap['small']),
            Text(
              context.l10n
                  .curveExponentDescription(_curveExponent.toStringAsFixed(1)),
              style: Styles.expPreviewSliderDescription,
            ),
            SizedBox(height: Styles.gap['large']),
            Text(context.l10n.experienceMultiplier),
            SizedBox(height: Styles.gap['medium']),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: _experienceMultiplier,
                  min: Player.minExperienceMultiplier,
                  max: Player.maxExperienceMultiplier,
                  divisions: ((Player.maxExperienceMultiplier -
                              Player.minExperienceMultiplier) /
                          10)
                      .round(),
                  label: _experienceMultiplier.toStringAsFixed(0),
                  onChanged: (value) {
                    setState(() {
                      _experienceMultiplier = value;
                    });
                  },
                ),
                SizedBox(height: Styles.gap['tiny']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Player.minExperienceMultiplier.toStringAsFixed(0),
                        style: Styles.expPreviewSliderExtremities),
                    Text(Player.maxExperienceMultiplier.toStringAsFixed(0),
                        style: Styles.expPreviewSliderExtremities),
                  ],
                ),
              ],
            ),
            SizedBox(height: Styles.gap['small']),
            Text(
              context.l10n.experienceMultiplierDescription(
                  _experienceMultiplier.toStringAsFixed(0)),
              style: Styles.expPreviewSliderDescription,
            ),
            SizedBox(height: Styles.gap['large']),
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
    final previewPlayer = Player(
      id: 'preview',
      goal: 'Preview',
      experience: Player.startingExperience,
      level: Player.startingLevel,
      createdDate: DateTime.now(),
      curveExponent: _curveExponent,
      experienceMultiplier: _experienceMultiplier,
    );

    // Динамический цвет в зависимости от параметров
    Color lineColor = _getExpPreviewLineColor();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Styles.gap['medium'] ?? Styles.fallbackGap),
      decoration: BoxDecoration(
        color: Styles.expPreviewChartBackColor,
        borderRadius: BorderRadius.circular(
            Styles.radius['small'] ?? Styles.fallbackRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.levelProgressionPreview,
            style: Styles.expPreviewTitle,
          ),
          SizedBox(height: Styles.gap['small']),
          SizedBox(
            width: Styles.expPreviewWidth,
            height: Styles.expPreviewHeight,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: Styles.expPreviewXReservedSize,
                      interval: Styles.expPreviewXInterval,
                      getTitlesWidget: (value, meta) {
                        return Text('L${value.toInt()}');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: Styles.expPreviewYReservedSize,
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
                minX: Styles.expPreviewMinLevel.toDouble(),
                maxX: Styles.expPreviewMaxLevel.toDouble(),
                minY: Styles.expPreviewMinExp.toDouble(),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                        Styles.expPreviewMaxLevel -
                            Styles.expPreviewMinLevel +
                            1, (index) {
                      final level = index + Styles.expPreviewMinLevel;
                      final expNeeded =
                          previewPlayer.getExperienceForLevel(level);
                      return FlSpot(level.toDouble(), expNeeded.toDouble());
                    }),
                    isCurved: true,
                    color: lineColor,
                    barWidth: Styles.expPreviewLineWidth,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Styles.gap['small']),
          Text(
            context.l10n.levelFormula(_experienceMultiplier.toStringAsFixed(0),
                _curveExponent.toStringAsFixed(0)),
            style: Styles.expPreviewFormula,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getExpPreviewLineColor() {
    final curveGap = Player.maxCurveExponent - _curveExponent;
    final maxCurveGap = Player.maxCurveExponent - Player.minCurveExponent;
    final hueGap = Styles.expPreviewMaxLineHue - Styles.expPreviewMinLineHue;
    final hueModifier = ((curveGap) / maxCurveGap) * hueGap;
    final rawHue = Styles.isExpPreviewLineHueInverted
        ? Styles.expPreviewMinLineHue + hueModifier
        : Styles.expPreviewMaxLineHue - hueModifier;

    final clampedHue =
        rawHue.clamp(Styles.expPreviewMinLineHue, Styles.expPreviewMaxLineHue);
    final saturation = Styles.expPreviewLineSaturation;
    final lightness = Styles.expPreviewLineLightness;

    final lineColor =
        HSLColor.fromAHSL(1.0, clampedHue, saturation, lightness).toColor();
    return lineColor;
  }

  void _saveSettings() {
    final updatedPlayer = Player(
      id: widget.player.id,
      goal: _goalController.text.isNotEmpty
          ? _goalController.text
          : context.l10n.defaultGoal,
      experience: widget.player.experience,
      level: widget.player.level,
      createdDate: widget.player.createdDate,
      curveExponent: _curveExponent,
      experienceMultiplier: _experienceMultiplier,
    );

    // Пересчитываем уровень с новой системой
    updatedPlayer.updateLevel();

    Navigator.of(context).pop(updatedPlayer);
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }
}
