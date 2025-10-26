import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/services/hive_service.dart';
import 'package:provider/provider.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import '../language_manager.dart';
import '../models/player.dart';

class SettingsDialog extends StatefulWidget {
  final Player player;

  const SettingsDialog({super.key, required this.player});

  @override
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
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
          SizedBox(width: Styles.getGap('S')),
          Text(context.l10n.settings),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.goalMotivation),
            SizedBox(height: Styles.getGap('S')),
            TextField(
              controller: _goalController,
              decoration: InputDecoration(
                hintText: context.l10n.goalMotivationHint,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: Styles.settingsFormFocusedBorder),
              ),
              maxLines: 2,
            ),
            SizedBox(height: Styles.getGap('L')),
            Row(
              children: [
                Styles.languageOptionIcon,
                SizedBox(width: Styles.getGap('S')),
                Text(context.l10n.language),
                SizedBox(width: Styles.getGap('L')),
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
                        value: Locale('he'),
                        child: Text(context.l10n.hebrew),
                      ),
                      DropdownMenuItem(
                        value: Locale('hy'),
                        child: Text(context.l10n.armenian),
                      ),
                      DropdownMenuItem(
                        value: Locale('it'),
                        child: Text(context.l10n.italian),
                      ),
                      DropdownMenuItem(
                        value: Locale('nl'),
                        child: Text(context.l10n.dutch),
                      ),
                      DropdownMenuItem(
                        value: Locale('no'),
                        child: Text(context.l10n.norwegian),
                      ),
                      DropdownMenuItem(
                        value: Locale('pl'),
                        child: Text(context.l10n.polish),
                      ),
                      DropdownMenuItem(
                        value: Locale('sv'),
                        child: Text(context.l10n.swedish),
                      ),
                      DropdownMenuItem(
                        value: Locale('tr'),
                        child: Text(context.l10n.turkish),
                      ),
                      DropdownMenuItem(
                        value: Locale('fi'),
                        child: Text(context.l10n.finnish),
                      ),
                    ],
                    onChanged: (locale) {
                      if (locale != null) {
                        final hiveService =
                            Provider.of<HiveService>(context, listen: false);
                        languageManager.setLocale(locale, hiveService);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: Styles.getGap('L')),
            Text(context.l10n.curveExponent),
            SizedBox(height: Styles.getGap('S')),
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
                  thumbColor: Styles.settingsFormBorderColor,
                  activeColor: Styles.settingsFormFrontColor,
                  onChanged: (value) {
                    setState(() {
                      _curveExponent = value;
                    });
                  },
                ),
                SizedBox(height: Styles.getGap('XS')),
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
            SizedBox(height: Styles.getGap('S')),
            Text(
              context.l10n
                  .curveExponentDescription(_curveExponent.toStringAsFixed(1)),
              style: Styles.expPreviewSliderDescription,
            ),
            SizedBox(height: Styles.getGap('L')),
            Text(context.l10n.experienceMultiplier),
            SizedBox(height: Styles.getGap('M')),
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
                  thumbColor: Styles.settingsFormBorderColor,
                  activeColor: Styles.settingsFormFrontColor,
                  onChanged: (value) {
                    setState(() {
                      _experienceMultiplier = value;
                    });
                  },
                ),
                SizedBox(height: Styles.getGap('XS')),
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
            SizedBox(height: Styles.getGap('S')),
            Text(
              context.l10n.experienceMultiplierDescription(
                  _experienceMultiplier.toStringAsFixed(0)),
              style: Styles.expPreviewSliderDescription,
            ),
            SizedBox(height: Styles.getGap('XL')),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.accentBad,
                  foregroundColor: Styles.foregroundColor,
                ),
                onPressed: _showResetConfirmation,
                child: Text(context.l10n.resetProgress),
              ),
            ),
            SizedBox(height: Styles.getGap('XL')),
            _buildSystemPreview(),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.cancel, style: Styles.basicFont)),
        ElevatedButton(
          onPressed: _saveSettings,
          child: Text(
            context.l10n.save,
            style: Styles.settingsAccentedFont,
          ),
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
        lastLoginDate: DateTime.now());

    // Динамический цвет в зависимости от параметров
    Color lineColor = _getExpPreviewLineColor();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Styles.getGap('XXL')),
      decoration: BoxDecoration(
        color: Styles.expPreviewChartBackColor,
        borderRadius: BorderRadius.circular(Styles.getRadius('S')),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.levelProgressionPreview,
            style: Styles.expPreviewTitle,
          ),
          SizedBox(height: Styles.getGap('S')),
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
                      interval: Styles.isWideScreen(context)
                          ? Styles.expPreviewXIntervalWide
                          : Styles.expPreviewXIntervalNarrow,
                      getTitlesWidget: (value, meta) {
                        return Text('L${value.toInt()}');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      maxIncluded: false,
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
          SizedBox(height: Styles.getGap('S')),
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
    final rawHue = Styles.expPreviewLineIsHueInverted
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

  void _showResetConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.resetConfirmationTitle),
        content: Text(context.l10n.resetConfirmationMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.cancel, style: Styles.basicFont),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Styles.accentBad),
            onPressed: () {
              Navigator.of(context).pop(); // закрыть диалог подтверждения
              _resetCharacter();
            },
            child: Text(context.l10n.resetConfirmationTitle,
                style: Styles.basicWhiteFont),
          ),
        ],
      ),
    );
  }

  void _resetCharacter() {
    final hiveService = Provider.of<HiveService>(context, listen: false);
    hiveService.resetPlayerOnly();
    Navigator.of(context).pop(); // закрыть диалог настроек
    // Покажем уведомление об успешном сбросе
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.l10n.resetSuccess),
        backgroundColor: Styles.accentNeutral,
      ),
    );
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
        lastLoginDate: widget.player.lastLoginDate,
        languageCode: widget.player.languageCode);

    updatedPlayer.updateLevel();
    Navigator.of(context).pop(updatedPlayer);
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }
}
