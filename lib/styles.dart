import 'package:flutter/material.dart';

class Styles {
//COMMONS:
  //Main:
  static const Color accentBad = Color.fromARGB(255, 240, 70, 70);
  static const Color accentWarning = Color.fromARGB(255, 255, 140, 0);
  static const Color accentGood = Color.fromARGB(255, 80, 220, 80);
  static const Color accentNeutral = Color.fromARGB(255, 0, 140, 240);
  static const Color fargroundColor = Color.fromARGB(255, 240, 240, 240);
  static const Color backgroundColor = Color.fromARGB(255, 250, 250, 250);
  static const Color foregroundColor = Colors.white;
  static const Color basicTextColor = Color.fromARGB(255, 50, 50, 50);
  static const Color subTextColor = Color.fromARGB(255, 120, 120, 120);
  static const Color lightTextColor = Color.fromARGB(255, 200, 200, 200);

  static const Color shadowColor = Colors.black;

  static const Color contrastHeaderFontColor = foregroundColor;

  static final TextStyle titleFont = TextStyle(
      fontSize: getFontSize('XXXL'),
      color: foregroundColor,
      fontWeight: FontWeight.w200,
      fontFamily: 'Noto Sans');

  static final TextStyle basicFont =
      TextStyle(fontSize: getFontSize('M'), color: basicTextColor);

  static const double wideScreenMin = 800;

  static bool isWideScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > wideScreenMin;

  //Fallbacks
  static const Color fallbackColor = Colors.grey;
  static const Color fallbackFontColor = Colors.black;

  static final Icon fallbackIcon = Icon(
    Icons.square_outlined,
    color: Colors.grey,
  );

  static final TextStyle fallbackFont = TextStyle(color: basicTextColor);

  static const double fallbackFontSize = 12;
  static const double fallbackBorderWidth = 4;
  static const double fallbackGap = 4;
  static const double fallbackRadius = 4;

  //Add buttons:
  static final Icon addButtonLargeIcon =
      Icon(Icons.add, color: foregroundColor);

  static final TextStyle addFormButtonFont =
      TextStyle(fontSize: getFontSize('XXXL'), color: foregroundColor);
  static final TextStyle addFormFont = TextStyle(fontSize: getFontSize('L'));

  //Tabs:
  static const Color tabsBackColor = fargroundColor;
  static const Color navigatorBackColor = foregroundColor;
  static const Color playerAccentColor = Color.fromARGB(255, 0, 140, 240);
  static const Color habitAccentColor = Color.fromARGB(255, 140, 0, 240);
  static const Color taskAccentColor = Color.fromARGB(255, 80, 220, 80);
  static const Color levelUpAccentColor = Color.fromARGB(255, 240, 170, 0);

  static Color getAppBarColor(int index) =>
      _appBarColor[index] ?? fallbackColor;

  static const Map<int, Color> _appBarColor = {
    0: playerAccentColor,
    1: habitAccentColor,
    2: taskAccentColor,
  };

  static final Icon playerTabIcon = Icon(Icons.person_outline_outlined);
  static final Icon habitsTabIcon = Icon(Icons.auto_graph_outlined);
  static final Icon tasksTabIcon = Icon(Icons.assignment_turned_in_outlined);

  //Common entries:
  static const Color entryUncompletedBackColor = foregroundColor;

  static final Icon editEntryIcon =
      Icon(Icons.edit_note_outlined, color: Colors.grey, size: getGap('XL'));
  static final Icon deleteEntryIcon =
      Icon(Icons.delete_outline, color: Colors.grey, size: getGap('XL'));

  static final Icon entryExperienceIcon =
      Icon(Icons.star, size: getIconSize('S'), color: levelUpAccentColor);

  static final TextStyle entryCompletedFont = TextStyle(
    fontSize: getFontSize('XL'),
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle entryUncompletedFont = TextStyle(
    fontSize: getFontSize('XL'),
    fontWeight: FontWeight.normal,
  );
  static final TextStyle entryInactiveFont = TextStyle(
    fontSize: getFontSize('XL'),
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static final TextStyle entryDescriptionFont = TextStyle(
    fontSize: getFontSize('S'),
    color: subTextColor,
  );

  static final TextStyle entrySubtextFont =
      TextStyle(fontSize: getFontSize('M'));

  static final TextStyle entryDeleteConfirmationMessageFont = TextStyle(
    fontSize: getFontSize('M'),
    color: accentWarning,
  );
  static final TextStyle entryDeleteConfirmationButtonFont = TextStyle(
    color: accentBad,
  );

  static double entryCardSidesWidth = 48;
  static double entryCardRadius = getRadius('M');

  //Sizes:
  static double getFontSize(String index) =>
      _fontSize[index] ?? fallbackFontSize;

  static final Map<String, double> _fontSize = {
    'XS': 10,
    'S': 12,
    'M': 14,
    'L': 16,
    'XL': 18,
    'XXL': 20,
    'XXXL': 24
  };

  static double getIconSize(String index) =>
      _iconSize[index] ?? fallbackFontSize;

  static final Map<String, double> _iconSize = {
    'XS': 16,
    'S': 20,
    'M': 24,
    'L': 32,
    'XL': 48,
    'XXL': 56,
    'XXXL': 64
  };

  static double getBorderWidth(String index) =>
      _borderWidth[index] ?? fallbackBorderWidth;

  static const Map<String, double> _borderWidth = {
    'XS': 2,
    'S': 4,
    'M': 8,
  };

  static double getGap(String index) => _gap[index] ?? fallbackBorderWidth;

  static const Map<String, double> _gap = {
    'XXS': 2,
    'XS': 4,
    'S': 8,
    'M': 12,
    'L': 16,
    'XL': 24,
    'XXL': 32,
  };

  static double getRadius(String index) =>
      _radius[index] ?? fallbackBorderWidth;

  static const Map<String, double> _radius = {
    'XS': 4,
    'S': 8,
    'M': 12,
    'L': 16,
    'XL': 20
  };

//SETTINGS:
  static final Icon settingsIcon = Icon(Icons.settings, color: Colors.blue);
  static final Icon languageOptionIcon =
      Icon(Icons.language, size: getIconSize('S'), color: subTextColor);

  static final Color settingsFormFrontColor = playerAccentColor;
  static final Color settingsFormBorderColor = Color.fromARGB(255, 10, 60, 200);

  static final BorderSide settingsFormFocusedBorder =
      BorderSide(color: settingsFormBorderColor, width: 2.0);

  //Experience preview:
  static const Color expPreviewChartBackColor = foregroundColor;

  static final TextStyle expPreviewTitle =
      TextStyle(fontWeight: FontWeight.bold);
  static final TextStyle expPreviewFormula =
      TextStyle(fontSize: getFontSize('S'), fontStyle: FontStyle.italic);
  static final TextStyle expPreviewSliderDescription =
      TextStyle(fontSize: getFontSize('S'), color: subTextColor);
  static final TextStyle expPreviewSliderExtremities =
      TextStyle(fontSize: getFontSize('S'), color: subTextColor);

  static const bool expPreviewLineIsHueInverted = true;

  static const int expPreviewMinExp = 0;
  static const int expPreviewMinLevel = 2;
  static const int expPreviewMaxLevel = 20;

  static const double expPreviewXReservedSize = 30;
  static const double expPreviewXInterval = 2;

  static const double expPreviewYReservedSize = 60;
  static const double expPreviewWidth = 500;
  static const double expPreviewHeight = 200;
  static const double expPreviewMinLineHue = 0;
  static const double expPreviewMaxLineHue = 210;
  static const double expPreviewLineSaturation = 0.7;
  static const double expPreviewLineLightness = 0.6;
  static const double expPreviewLineWidth = 3;

  //Hour selection:
  static Color getHourSkyColors(int index) =>
      _hourlySkyColors[index] ?? playerAccentColor;

  static final Map<int, Color> _hourlySkyColors = {
    0: Color.fromARGB(255, 0, 0, 30),
    1: Color.fromARGB(255, 0, 0, 90),
    2: Color.fromARGB(255, 0, 50, 100),
    3: Color.fromARGB(255, 0, 80, 120),
    4: Color.fromARGB(255, 100, 0, 130),
    5: Color.fromARGB(255, 190, 0, 110),
    6: Color.fromARGB(255, 255, 90, 0),
    7: Color.fromARGB(255, 255, 200, 0),
    8: Color.fromARGB(255, 90, 210, 255),
    9: Color.fromARGB(255, 30, 180, 255),
    10: Color.fromARGB(255, 0, 150, 255),
    11: Color.fromARGB(255, 0, 100, 255),
    12: Color.fromARGB(255, 0, 70, 255),
    13: Color.fromARGB(255, 40, 150, 255),
    14: Color.fromARGB(255, 60, 200, 255),
    15: Color.fromARGB(255, 90, 230, 255),
    16: Color.fromARGB(255, 140, 190, 250),
    17: Color.fromARGB(255, 150, 150, 255),
    18: Color.fromARGB(255, 255, 120, 0),
    19: Color.fromARGB(255, 255, 50, 0),
    20: Color.fromARGB(255, 210, 0, 40),
    21: Color.fromARGB(255, 100, 0, 170),
    22: Color.fromARGB(255, 50, 0, 140),
    23: Color.fromARGB(255, 0, 30, 130),
  };

//PLAYER:
  static const Color playerTitleCardBackColor = backgroundColor;

  static Color getPlayerFrontColor(int level) {
    final double saturation = playerFrontSaturation;
    final double lightness = playerFrontLightness;
    final double hue = (level * 132) % 360;
    return HSLColor.fromAHSL(1, hue, saturation, lightness).toColor();
  }

  static Color getPlayerBackColor(int level) {
    final double saturation = playerBackSaturation;
    final double lightness = playerBackLightness;
    final double hue = (level * 132) % 360;
    return HSLColor.fromAHSL(1, hue, saturation, lightness).toColor();
  }

  static double playerFrontSaturation = 0.9;
  static double playerFrontLightness = 0.6;
  static double playerBackSaturation = 0.3;
  static double playerBackLightness = 0.7;

  static TextStyle getPlayerGoalFont(int level) => TextStyle(
        fontSize: getFontSize('XXL'),
        fontWeight: FontWeight.bold,
        color: playerAccentColor,
      );
  /*static TextStyle getPlayerGoalFont(int level) => TextStyle(
        fontSize: getFontSize('XXL'),
        fontWeight: FontWeight.bold,
        color: getPlayerFrontColor(level),
      );*/

  static final TextStyle playerTodayProgressFont =
      TextStyle(fontSize: getFontSize('XXL'), fontWeight: FontWeight.bold);

  static final TextStyle playerBarFont = TextStyle(fontSize: getFontSize('L'));

  //Stats:
  static const Color playerStatItemBackColor = fargroundColor;

  static final Icon playerTabSettingsIcon =
      Icon(Icons.settings, color: subTextColor);

  static Icon getPlayerLevelIcon(int level) =>
      Icon(Icons.star, size: getIconSize('S'), color: playerAccentColor);
  static Icon getPlayerExperienceIcon(int level) => Icon(Icons.auto_awesome,
      size: getIconSize('S'), color: playerAccentColor);
  static Icon getPlayerNextLevelIcon(int level) =>
      Icon(Icons.flag, size: getIconSize('S'), color: playerAccentColor);

  /* static Icon getPlayerLevelIcon(int level) => Icon(Icons.star,
      size: getIconSize('S'), color: getPlayerFrontColor(level));
  static Icon getPlayerExperienceIcon(int level) => Icon(Icons.auto_awesome,
      size: getIconSize('S'), color: getPlayerFrontColor(level));
  static Icon getPlayerNextLevelIcon(int level) => Icon(Icons.flag,
      size: getIconSize('S'), color: getPlayerFrontColor(level));*/

  static final TextStyle playerStatItemCountFont =
      TextStyle(fontSize: getFontSize('L'), fontWeight: FontWeight.bold);
  static final TextStyle playerStatItemLabelFont =
      TextStyle(fontSize: getFontSize('M'), color: subTextColor);
  static final TextStyle playerStatItemDetailsFont =
      TextStyle(fontSize: getFontSize('M'), color: lightTextColor);

  //Overview:
  static const Color playerOverviewBackColor = backgroundColor;
  static final Icon playerHabitsCountIcon =
      Icon(Icons.auto_awesome, size: getIconSize('M'), color: habitAccentColor);
  static final Icon playerTasksDueIcon =
      Icon(Icons.task, size: getIconSize('M'), color: accentWarning);
  static final Icon playerTasksDoneIcon =
      Icon(Icons.check_circle, size: getIconSize('M'), color: taskAccentColor);
  static final Icon playerOverdueIcon =
      Icon(Icons.warning, size: getIconSize('M'), color: accentBad);

  static final TextStyle playerOverviewCountFont =
      TextStyle(fontSize: getFontSize('XL'), fontWeight: FontWeight.bold);
  static final TextStyle playerOverviewLabelFont =
      TextStyle(fontSize: getFontSize('M'), color: subTextColor);

//HABITS:
  static final Icon habitsTabLargeIcon = Icon(Icons.auto_graph_outlined,
      size: getIconSize('XXXL'), color: subTextColor);

  static final TextStyle habitsEmptyHint = TextStyle(
    fontSize: getFontSize('XXL'),
    fontWeight: FontWeight.bold,
    color: subTextColor,
  );

  //Habit entry card:
  static const Color habitCompletedBackColor =
      Color.fromARGB(255, 240, 235, 255);

  static final Icon habitCompletionMinIcon =
      Icon(Icons.check, size: getIconSize('S'), color: playerAccentColor);

  static final TextStyle habitNotTodayFont = TextStyle(
    fontSize: getFontSize('S'),
    color: subTextColor,
  );

  //Counter:
  static const Color habitCounterBackColor = entryUncompletedBackColor;

  static final Icon habitCounterIncreaseIcon =
      Icon(Icons.add, size: getIconSize('M'));
  static final Icon habitCounterDecreaseIcon =
      Icon(Icons.remove, size: getIconSize('M'));

  static final TextStyle habitTodayCountFont = TextStyle(
    color: accentGood,
    fontWeight: FontWeight.bold,
    fontSize: getFontSize('L'),
  );

  static final TextStyle counterActiveFont = TextStyle(
    fontSize: getFontSize('L'),
    fontWeight: FontWeight.bold,
    color: basicTextColor,
  );

  static final TextStyle counterInactiveFont = TextStyle(
    fontSize: getFontSize('L'),
    fontWeight: FontWeight.bold,
    color: subTextColor,
  );

  static double counterSidesWidth = 32;

  //Habit schedule:
  static Color getHabitScheduleColor(String index) =>
      _habitScheduleColor[index] ?? fallbackColor;

  static const Map<String, Color> _habitScheduleColor = {
    'daily': Colors.blue,
    'weekly': Colors.green,
    'monthly': Colors.orange,
    'custom': Colors.purple
  };

  static Icon getHabitScheduleIcon(String index) =>
      _habitScheduleIcon[index] ?? fallbackIcon;

  static final Map<String, Icon> _habitScheduleIcon = {
    'daily': Icon(Icons.repeat,
        size: getIconSize('S'), color: getHabitScheduleColor('daily')),
    'weekly': Icon(Icons.repeat,
        size: getIconSize('S'), color: getHabitScheduleColor('weekly')),
    'monthly': Icon(Icons.repeat,
        size: getIconSize('S'), color: getHabitScheduleColor('monthly')),
    'custom': Icon(Icons.repeat,
        size: getIconSize('S'), color: getHabitScheduleColor('custom'))
  };

  static TextStyle getHabitScheduleFont(String index) =>
      _habitScheduleFont[index] ?? fallbackFont;

  static final Map<String, TextStyle> _habitScheduleFont = {
    'daily': TextStyle(
        fontSize: getFontSize('M'),
        color: getHabitScheduleColor('daily'),
        fontWeight: FontWeight.bold),
    'weekly': TextStyle(
        fontSize: getFontSize('M'),
        color: getHabitScheduleColor('weekly'),
        fontWeight: FontWeight.bold),
    'monthly': TextStyle(
        fontSize: getFontSize('M'),
        color: getHabitScheduleColor('monthly'),
        fontWeight: FontWeight.bold),
    'custom': TextStyle(
        fontSize: getFontSize('M'),
        color: getHabitScheduleColor('custom'),
        fontWeight: FontWeight.bold)
  };

  static TextStyle getHabitSelectorTitleFont(String index) =>
      _habitSelectorTitleFont[index] ?? fallbackFont;

  static final Map<String, TextStyle> _habitSelectorTitleFont = {
    'daily': TextStyle(fontSize: getFontSize('L')),
    'weekly': TextStyle(fontSize: getFontSize('L')),
    'monthly': TextStyle(fontSize: getFontSize('L')),
    'custom': TextStyle(fontSize: getFontSize('L'))
  };

  //Karma:
  static Color getKarmaLevelColor(int index) =>
      _karmaLevelColor[index] ?? fallbackColor;

  static const Map<int, Color> _karmaLevelColor = {
    -4: Color.fromARGB(255, 142, 9, 0),
    -3: Color.fromARGB(255, 231, 0, 0),
    -2: Color.fromARGB(255, 255, 145, 0),
    -1: Color.fromARGB(255, 255, 255, 0),
    0: Color.fromARGB(255, 255, 255, 255),
    1: Color.fromARGB(255, 162, 255, 0),
    2: Color.fromARGB(255, 0, 255, 128),
    3: Color.fromARGB(255, 0, 255, 242),
    4: Color.fromARGB(255, 0, 162, 255),
    5: Color.fromARGB(255, 0, 55, 255)
  };

  //Habit form:
  static final Color habitFormFrontColor = habitAccentColor;
  static final Color habitFormBorderColor = Color.fromARGB(255, 110, 60, 160);

  static final BorderSide habitFormFocusedBorder =
      BorderSide(color: habitFormFrontColor, width: 2.0);

//TASKS:
  static final Icon tasksTabLargeIcon = Icon(
      Icons.assignment_turned_in_outlined,
      size: getIconSize('XXXL'),
      color: subTextColor);

  //Tasks entry card:
  static const Color taskCompletedBackColor =
      Color.fromARGB(255, 235, 255, 235);

  static const Color taskCategoryBackColor = subTextColor;

  static final TextStyle taskCategory = TextStyle(fontSize: getFontSize('M'));

  static final TextStyle tasksCompletedHeaderFont =
      TextStyle(fontSize: getFontSize('XXL'), fontWeight: FontWeight.bold);

  //Tasks stats:

  static final TextStyle taskStatLabelDescriptionFont =
      TextStyle(fontSize: getFontSize('L'), color: subTextColor);

  //Tasks priority:
  static Color getTaskPriorityColor(int index) =>
      _taskPriorityColor[index] ?? fallbackColor;

  static const Map<int, Color> _taskPriorityColor = {
    1: Color.fromARGB(255, 37, 121, 255),
    2: Color.fromARGB(255, 25, 213, 255),
    3: Color.fromARGB(255, 58, 252, 65),
    4: Color.fromARGB(255, 255, 239, 20),
    5: Color.fromARGB(255, 255, 47, 47)
  };

  static TextStyle getTaskPriorityFont(int index) =>
      _taskPriorityFont[index] ?? fallbackFont;

  static final Map<int, TextStyle> _taskPriorityFont = {
    1: TextStyle(
        fontSize: getFontSize('L'),
        color: getTaskPriorityColor(1),
        fontWeight: FontWeight.bold),
    2: TextStyle(
        fontSize: getFontSize('L'),
        color: getTaskPriorityColor(2),
        fontWeight: FontWeight.bold),
    3: TextStyle(
        fontSize: getFontSize('L'),
        color: getTaskPriorityColor(3),
        fontWeight: FontWeight.bold),
    4: TextStyle(
        fontSize: getFontSize('L'),
        color: getTaskPriorityColor(4),
        fontWeight: FontWeight.bold),
    5: TextStyle(
        fontSize: getFontSize('L'),
        color: getTaskPriorityColor(5),
        fontWeight: FontWeight.bold)
  };

  //Tasks state:
  static Color getTaskStateColor(String index) =>
      _taskStateColor[index] ?? fallbackColor;

  static final Map<String, Color> _taskStateColor = {
    'completed': accentGood,
    'overdue': accentBad,
    "today": accentWarning,
    'soon': accentNeutral
  };

  static Icon getTaskStateIcon(String index) =>
      _taskStateIcon[index] ?? fallbackIcon;

  static final Map<String, Icon> _taskStateIcon = {
    'completed': Icon(Icons.calendar_today,
        size: getIconSize('S'), color: getTaskStateColor('completed')),
    'overdue': Icon(Icons.calendar_today,
        size: getIconSize('S'), color: getTaskStateColor('overdue')),
    "today": Icon(Icons.calendar_today,
        size: getIconSize('S'), color: getTaskStateColor('today')),
    'soon': Icon(Icons.calendar_today,
        size: getIconSize('S'), color: getTaskStateColor('soon'))
  };

  static TextStyle getTaskStateFont(String index) =>
      _taskStateFont[index] ?? fallbackFont;

  static final Map<String, TextStyle> _taskStateFont = {
    'completed': TextStyle(color: getTaskStateColor('completed')),
    'overdue': TextStyle(color: getTaskStateColor('overdue')),
    "today": TextStyle(color: getTaskStateColor('today')),
    'soon': TextStyle(color: getTaskStateColor('soon'))
  };

//Task form:
  static final Color taskFormFrontColor = taskAccentColor;
  static final Color taskFormBorderColor = Color.fromARGB(255, 60, 160, 60);

  static final BorderSide taskFormFocusedBorder =
      BorderSide(color: taskFormBorderColor, width: 2.0);

  static final ColorScheme datePickerColorScheme = ColorScheme.light(
    primary: taskFormFrontColor, // Основной акцентный цвет
    onPrimary: foregroundColor, // Цвет текста/иконок на primary
    surface: backgroundColor, // Цвет фона диалога
    onSurface: basicTextColor, // Цвет текста на surface
  );

//LEVEL UP:
  static const Color levelUpBackColor = Color.fromARGB(255, 255, 250, 200);

  static final Icon levelUpLargeIcon = Icon(
    Icons.auto_awesome,
    size: getIconSize('XXXL'),
    color: levelUpAccentColor,
  );

  static final TextStyle levelUpCongratulations = TextStyle(
    fontSize: getFontSize('XXXL'),
    fontWeight: FontWeight.bold,
    color: levelUpAccentColor,
  );
  //Level label:
  static const Color levelUpLabelBackColor = foregroundColor;

  static final TextStyle levelUpLabel = TextStyle(
    fontSize: getFontSize('XXL'),
    fontWeight: FontWeight.bold,
    color: levelUpAccentColor,
  );
  static final TextStyle levelUpDetails = TextStyle(
    fontSize: getFontSize('L'),
    color: subTextColor,
    fontStyle: FontStyle.italic,
  );

  //Level up button:
  static const Color levelUpButtonFontColor = foregroundColor;
  static const Color levelUpButtonBackColor = levelUpAccentColor;

  static final Icon levelUpButtonIcon = Icon(Icons.celebration);

//DAY COMPLETION:
  static const Color completeDayBackColor = playerAccentColor;
  static const Color completeDayButtonColor = playerAccentColor;

  static final TextStyle completeDayHint = TextStyle(
      fontSize: getFontSize('M'), color: Styles.contrastHeaderFontColor);
  static final TextStyle completeDayCompleteHeader =
      TextStyle(fontSize: getFontSize('L'), fontWeight: FontWeight.bold);
}
