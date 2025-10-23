import 'package:flutter/material.dart';

class Styles {
//COMMONS:
  //Main:

  static const Color badAccent = Color.fromARGB(255, 255, 72, 72);
  static const Color warningAccent = Color.fromARGB(255, 255, 145, 0);
  static const Color goodAccent = Color.fromARGB(255, 0, 232, 8);
  static const Color neutralAccent = Color.fromARGB(255, 0, 140, 255);
  static const Color noAccent = Color.fromARGB(255, 0, 81, 255);
  static const Color fargroundColor = Color.fromARGB(255, 240, 240, 240);
  static const Color backgroundColor = Color.fromARGB(255, 251, 251, 251);
  static const Color foregroundColor = Colors.white;
  static const Color shadowColor = Colors.black;

  static const Color contrastHeaderFontColor = foregroundColor;

  static final TextStyle titleFont = TextStyle(
      fontSize: getFontSize('XXXL'),
      color: foregroundColor,
      fontWeight: FontWeight.w200,
      fontFamily: 'Noto Sans');

  //Fallbacks
  static const Color fallbackColor = Colors.grey;
  static const Color fallbackFontColor = Colors.black;

  static final Icon fallbackIcon = Icon(
    Icons.square_outlined,
    color: Colors.grey,
  );

  static final TextStyle fallbackFont = TextStyle(color: Colors.black);

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
  static const Color playerAccentColor = Color.fromARGB(255, 0, 140, 255);
  static const Color habitAccentColor = Color.fromARGB(255, 0, 199, 7);
  static const Color taskAccentColor = Color.fromARGB(255, 131, 0, 231);
  static const Color levelUpAccentColor = Color.fromARGB(255, 255, 179, 0);

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
      Icon(Icons.star, size: getIconSize('S'), color: Colors.amber);

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
    color: Color.fromARGB(255, 100, 100, 100),
  );

  static final TextStyle entrySubtextFont =
      TextStyle(fontSize: getFontSize('M'));

  static final TextStyle entryDeleteConfirmationMessageFont = TextStyle(
    fontSize: getFontSize('M'),
    color: Colors.deepOrange,
  );
  static final TextStyle entryDeleteConfirmationButtonFont = TextStyle(
    color: Colors.red,
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
      Icon(Icons.language, size: getIconSize('S'), color: Colors.grey);

  //Experience preview:
  static const Color expPreviewChartBackColor = foregroundColor;

  static final TextStyle expPreviewTitle =
      TextStyle(fontWeight: FontWeight.bold);
  static final TextStyle expPreviewFormula =
      TextStyle(fontSize: getFontSize('S'), fontStyle: FontStyle.italic);
  static final TextStyle expPreviewSliderDescription =
      TextStyle(fontSize: getFontSize('S'), color: Colors.grey);
  static final TextStyle expPreviewSliderExtremities =
      TextStyle(fontSize: getFontSize('S'), color: Colors.grey);

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
      Icon(Icons.settings, color: Colors.grey);

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
      TextStyle(fontSize: getFontSize('M'), color: Colors.grey);
  static final TextStyle playerStatItemDetailsFont = TextStyle(
      fontSize: getFontSize('M'), color: Color.fromARGB(255, 199, 199, 199));

  //Overview:
  static const Color playerOverviewBackColor = backgroundColor;
  static final Icon playerHabitsCountIcon =
      Icon(Icons.auto_awesome, size: getIconSize('M'), color: habitAccentColor);
  static final Icon playerTasksDueIcon =
      Icon(Icons.task, size: getIconSize('M'), color: warningAccent);
  static final Icon playerTasksDoneIcon =
      Icon(Icons.check_circle, size: getIconSize('M'), color: taskAccentColor);
  static final Icon playerOverdueIcon =
      Icon(Icons.warning, size: getIconSize('M'), color: badAccent);

  static final TextStyle playerOverviewCountFont =
      TextStyle(fontSize: getFontSize('XL'), fontWeight: FontWeight.bold);
  static final TextStyle playerOverviewLabelFont =
      TextStyle(fontSize: getFontSize('M'), color: Colors.grey);

//HABITS:
  static final Icon habitsTabLargeIcon = Icon(Icons.auto_graph_outlined,
      size: getIconSize('XXXL'), color: Colors.grey);

  static final TextStyle habitsEmptyHint = TextStyle(
    fontSize: getFontSize('XXL'),
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  //Habit entry card:
  static const Color habitCompletedBackColor =
      Color.fromARGB(255, 235, 255, 235);

  static final Icon habitCompletionMinIcon =
      Icon(Icons.check, size: getIconSize('S'), color: Colors.blue);

  static final TextStyle habitNotTodayFont = TextStyle(
    fontSize: getFontSize('S'),
    color: Colors.grey,
  );

  //Counter:
  static const Color habitCounterBackColor = entryUncompletedBackColor;

  static final Icon habitCounterIncreaseIcon =
      Icon(Icons.add, size: getIconSize('M'));
  static final Icon habitCounterDecreaseIcon =
      Icon(Icons.remove, size: getIconSize('M'));

  static final TextStyle habitTodayCountFont = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: getFontSize('L'),
  );

  static final TextStyle counterActiveFont = TextStyle(
    fontSize: getFontSize('L'),
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final TextStyle counterInactiveFont = TextStyle(
    fontSize: getFontSize('L'),
    fontWeight: FontWeight.bold,
    color: Colors.grey,
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
    1: Color.fromARGB(255, 191, 255, 0),
    2: Color.fromARGB(255, 0, 255, 4),
    3: Color.fromARGB(255, 0, 255, 153),
    4: Color.fromARGB(255, 0, 251, 255),
    5: Color.fromARGB(255, 0, 162, 255),
    6: Color.fromARGB(255, 0, 55, 255),
    7: Color.fromARGB(255, 140, 0, 255)
  };

//TASKS:
  static final Icon tasksTabLargeIcon = Icon(
      Icons.assignment_turned_in_outlined,
      size: getIconSize('XXXL'),
      color: Colors.grey);

  //Tasks entry card:
  static const Color taskCompletedBackColor =
      Color.fromARGB(255, 240, 235, 255);

  static const Color taskCategoryBackColor = Colors.grey;

  static final TextStyle taskCategory = TextStyle(fontSize: getFontSize('M'));

  static final TextStyle tasksCompletedHeaderFont = TextStyle(
      fontSize: getFontSize('XXL'),
      fontWeight: FontWeight.bold,
      color: taskAccentColor);
  static final TextStyle tasksCompletedPendingFont =
      TextStyle(fontSize: getFontSize('XXL'), fontWeight: FontWeight.bold);

  //Tasks stats:
  static const Color taskStatLabelTotalColor = Colors.blue;
  static const Color taskStatLabelPendingColor = Colors.orange;
  static const Color taskStatLabelDoneColor = Colors.green;

  static final TextStyle taskStatLabelTotalFont = TextStyle(
      fontSize: getFontSize('XL'),
      fontWeight: FontWeight.bold,
      color: taskStatLabelTotalColor);
  static final TextStyle taskStatLabelPendingFont = TextStyle(
      fontSize: getFontSize('XL'),
      fontWeight: FontWeight.bold,
      color: taskStatLabelPendingColor);
  static final TextStyle taskStatLabelDoneFont = TextStyle(
      fontSize: getFontSize('XL'),
      fontWeight: FontWeight.bold,
      color: taskStatLabelDoneColor);

  static final TextStyle taskStatLabelDescriptionFont =
      TextStyle(fontSize: getFontSize('L'), color: Colors.grey);

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
    'completed': goodAccent,
    'overdue': badAccent,
    "today": warningAccent,
    'soon': neutralAccent
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

//LEVEL UP:
  static const Color levelUpBackColor = Color.fromARGB(255, 255, 249, 208);

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
    color: Color.fromARGB(255, 108, 108, 108),
    fontStyle: FontStyle.italic,
  );

  //Level up button:
  static const Color levelUpButtonFontColor = foregroundColor;
  static const Color levelUpButtonBackColor = levelUpAccentColor;

  static final Icon levelUpButtonIcon = Icon(Icons.celebration);

//DAY COMPLETION:
  static const Color completeDayBackColor = Colors.blue;
  static const Color completeDayButtonColor = Colors.blue;

  static final TextStyle completeDayHint = TextStyle(
      fontSize: getFontSize('M'), color: Styles.contrastHeaderFontColor);
  static final TextStyle completeDayCompleteHeader =
      TextStyle(fontSize: getFontSize('L'), fontWeight: FontWeight.bold);
}
