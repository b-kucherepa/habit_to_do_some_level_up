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

  static const Color shadowColor = basicTextColor;

  static const Color contrastHeaderFontColor = foregroundColor;

  static final TextStyle titleFont = TextStyle(
      fontSize: getFontSize('XXL'),
      color: foregroundColor,
      fontWeight: FontWeight.w300,
      fontFamily: 'Noto Sans');

  static final TextStyle basicFont =
      TextStyle(fontSize: getFontSize('M'), color: basicTextColor);

  static final TextStyle basicWhiteFont =
      TextStyle(fontSize: getFontSize('M'), color: foregroundColor);
  static const double wideScreenMin = 800;

  static bool isWideScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > wideScreenMin;

  //Fallbacks
  static const Color fallbackColor = Colors.grey;
  static const Color fallbackFontColor = Colors.black;

  static final Icon fallbackIcon = Icon(
    Icons.square_outlined,
    color: fallbackFontColor,
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
  static const Color habitAccentColor = Color.fromARGB(255, 150, 0, 240);
  static const Color taskAccentColor = Color.fromARGB(255, 30, 210, 80);
  static const Color levelUpAccentColor = Color.fromARGB(255, 240, 150, 0);

  static Color getAppBarColor(int index) =>
      _appBarColor[index] ?? fallbackColor;

  static final Map<int, Color> _appBarColor = {
    0: playerAccentColor.withAlpha(220),
    1: habitAccentColor.withAlpha(220),
    2: taskAccentColor.withAlpha(220),
  };

  static final Icon playerTabIcon = Icon(Icons.person_outline_outlined);
  static final Icon habitsTabIcon = Icon(Icons.auto_graph_outlined);
  static final Icon tasksTabIcon = Icon(Icons.assignment_turned_in_outlined);

  //Common entries:

  static const Color entryUncompletedBackColor = foregroundColor;
  static const Color entryCardSidesColor = Color.fromARGB(20, 0, 0, 0);

  static final Icon editEntryIcon =
      Icon(Icons.edit_note_outlined, color: subTextColor, size: getGap('XL'));
  static final Icon deleteEntryIcon =
      Icon(Icons.delete_outline, color: subTextColor, size: getGap('XL'));

  static final Icon entryExperienceIcon =
      Icon(Icons.star, size: getIconSize('S'), color: levelUpAccentColor);

  static final TextStyle entryExpansionTileHeaderFont =
      TextStyle(fontSize: getFontSize('XXL'), fontWeight: FontWeight.bold);

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
    color: lightTextColor,
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
  static final Icon settingsIcon =
      Icon(Icons.settings, color: playerAccentColor);
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
  static const double expPreviewXIntervalWide = 2;
  static const double expPreviewXIntervalNarrow = 5;

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

//Buttons:
  static final TextStyle settingsAccentedFont =
      TextStyle(fontSize: getFontSize('M'), color: playerAccentColor);

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
      Icon(Icons.settings, color: subTextColor); //?????

  static Icon getPlayerLevelIcon(int level) =>
      Icon(Icons.star_rate, size: getIconSize('M'), color: levelUpAccentColor);
  static Icon getPlayerExperienceIcon(int level) => Icon(Icons.flare_outlined,
      size: getIconSize('M'), color: taskAccentColor);
  static Icon getPlayerNextLevelIcon(int level) =>
      Icon(Icons.place, size: getIconSize('M'), color: habitAccentColor);

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
      color: lightTextColor);

  static double counterSidesWidth = 32;

  //Habit schedule:
  static Color getHabitScheduleColor(String index) =>
      _habitScheduleColor[index] ?? fallbackColor;

  static const Map<String, Color> _habitScheduleColor = {
    'daily': Color.fromARGB(255, 0, 140, 240),
    'weekly': Color.fromARGB(255, 80, 240, 80),
    'monthly': Color.fromARGB(255, 240, 180, 0),
    'custom': Color.fromARGB(255, 240, 80, 240)
  };

  static Icon getHabitScheduleIcon(String index) =>
      _habitScheduleIcon[index] ?? fallbackIcon;

  static final Map<String, Icon> _habitScheduleIcon = {
    'daily': Icon(Icons.update,
        size: getIconSize('S'), color: getHabitScheduleColor('daily')),
    'weekly': Icon(Icons.table_chart_outlined,
        size: getIconSize('S'), color: getHabitScheduleColor('weekly')),
    'monthly': Icon(Icons.calendar_month_outlined,
        size: getIconSize('S'), color: getHabitScheduleColor('monthly')),
    'custom': Icon(Icons.autorenew_outlined,
        size: getIconSize('S'), color: getHabitScheduleColor('custom'))
  };

  static TextStyle getHabitScheduleFont(String index) => TextStyle(
      fontSize: getFontSize('M'),
      color: getHabitScheduleColor(index),
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto Monospace');

  //Karma:
  static Color getKarmaLevelColor(int index) =>
      _karmaLevelColor[index] ?? fallbackColor;

  static const Map<int, Color> _karmaLevelColor = {
    -4: Color.fromARGB(255, 230, 30, 30),
    -3: Color.fromARGB(255, 240, 80, 30),
    -2: Color.fromARGB(255, 240, 140, 30),
    -1: Color.fromARGB(255, 240, 200, 30),
    0: Styles.entryCardSidesColor,
    1: Color.fromARGB(255, 150, 240, 30),
    2: Color.fromARGB(255, 30, 240, 110),
    3: Color.fromARGB(255, 30, 240, 240),
    4: Color.fromARGB(255, 30, 190, 245),
    5: Color.fromARGB(255, 30, 140, 250)
  };

  static Icon getKarmaIcon(int index) => Icon(Icons.double_arrow_outlined,
      size: getIconSize('S'), color: getKarmaLevelColor(index));

  static TextStyle getKarmaFont(int index) => TextStyle(
      fontSize: getFontSize('M'),
      color: getKarmaLevelColor(index),
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto Monospace');

  static const double karmaBadgeWidth = 100;

  //Habit form:
  static final Color habitFormFrontColor = habitAccentColor;
  static final Color habitFormBorderColor = Color.fromARGB(255, 120, 60, 160);
  static final Color habitChipSelectedColor = habitAccentColor.withAlpha(80);

  static final TextStyle scheduleChipFont =
      TextStyle(color: basicTextColor, fontSize: getFontSize('M'));

  static final BorderSide habitFormFocusedBorder =
      BorderSide(color: habitFormFrontColor, width: 2.0);

  static final double scheduleWeeklyChipWidth = 48;
  static final double scheduleMonthlyChipWidth = 24;

//TASKS:
  static final Icon tasksTabLargeIcon = Icon(
      Icons.assignment_turned_in_outlined,
      size: getIconSize('XXXL'),
      color: subTextColor);

  //Tasks entry card:
  static const Color taskCompletedBackColor =
      Color.fromARGB(255, 230, 255, 235);

  //Tasks stats:
  static final TextStyle taskStatLabelDescriptionFont =
      TextStyle(fontSize: getFontSize('L'), color: subTextColor);

  //Tasks priority:
  static Color getTaskPriorityColor(int index) =>
      _taskPriorityColor[index] ?? fallbackColor;

  static const Map<int, Color> _taskPriorityColor = {
    1: Color.fromARGB(255, 30, 140, 255),
    2: Color.fromARGB(255, 30, 220, 240),
    3: Color.fromARGB(255, 60, 240, 60),
    4: Color.fromARGB(255, 240, 200, 30),
    5: Color.fromARGB(255, 240, 30, 30)
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

  //Task category:
  static Color getTaskCategoryColor(String index) =>
      _getTaskCategoryColor[index] ?? fallbackColor;

  static const Map<String, Color> _getTaskCategoryColor = {
    'home': Color.fromARGB(255, 0, 120, 240),
    'social': Color.fromARGB(255, 0, 210, 220),
    'work': Color.fromARGB(255, 240, 140, 0),
    'personal': Color.fromARGB(255, 240, 20, 140),
    'health': Color.fromARGB(255, 20, 220, 80),
    'learning': Color.fromARGB(255, 110, 20, 240),
    'other': subTextColor,
  };

  static Icon getTaskCategoryIcon(String index) =>
      _taskCategoryIcon[index] ?? fallbackIcon;

  static final Map<String, Icon> _taskCategoryIcon = {
    'home': Icon(Icons.home_outlined,
        size: getIconSize('S'), color: getTaskCategoryColor('home')),
    'social': Icon(Icons.group_outlined,
        size: getIconSize('S'), color: getTaskCategoryColor('social')),
    'work': Icon(Icons.work_outline,
        size: getIconSize('S'), color: getTaskCategoryColor('work')),
    'personal': Icon(Icons.favorite_border_outlined,
        size: getIconSize('S'), color: getTaskCategoryColor('personal')),
    'health': Icon(Icons.eco_outlined,
        size: getIconSize('S'), color: getTaskCategoryColor('health')),
    'learning': Icon(Icons.menu_book_outlined,
        size: getIconSize('S'), color: getTaskCategoryColor('learning')),
    'other': Icon(Icons.label_outline,
        size: getIconSize('S'), color: getTaskCategoryColor('label_outline')),
  };

  static TextStyle getTaskCategoryFont(String index) => TextStyle(
      fontSize: getFontSize('M'),
      color: getTaskCategoryColor(index),
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto Monospace');

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

  static final Icon levelUpButtonIcon = Icon(Icons.celebration_sharp);

//DAY COMPLETION:
  static const Color completeDayAccentColor = playerAccentColor;

  static const Color dayCompletedEntryBackColor =
      Color.fromARGB(255, 235, 240, 255);

  static final TextStyle completeDayHintFont =
      TextStyle(fontSize: getFontSize('M'), color: backgroundColor);
  static final TextStyle completeDayCompleteHeaderFont =
      TextStyle(fontSize: getFontSize('L'), fontWeight: FontWeight.bold);
  static final TextStyle markCompletedHabitsHintFont = TextStyle(
      fontSize: getFontSize('XL'),
      color: basicTextColor,
      fontWeight: FontWeight.bold);
}
