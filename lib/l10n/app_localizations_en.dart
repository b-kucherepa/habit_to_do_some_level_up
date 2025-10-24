// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Habit To Do Some Level Up!';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get addHabit => 'Add Habit';

  @override
  String get addTask => 'Add Task';

  @override
  String get editHabit => 'Edit Habit';

  @override
  String get editTask => 'Edit Task';

  @override
  String get toNext => 'To Next';

  @override
  String get completeDayHint => 'Complete Missed Day';

  @override
  String get markCompletedHabitsHint => 'Mark completed habits for this day:';

  @override
  String get skipDayButton => 'Skip This Day';

  @override
  String get completeDayButton => 'Complete Day';

  @override
  String get scheduleType => 'Schedule Type';

  @override
  String get habits => 'Habits';

  @override
  String get habitsDone => 'Habits Done';

  @override
  String habitsNumberToday(Object habitsNumber) {
    return '$habitsNumber today';
  }

  @override
  String get tasks => 'Tasks';

  @override
  String get tasksDue => 'Tasks Due';

  @override
  String get tasksDone => 'Tasks Done';

  @override
  String get level => 'Level';

  @override
  String get todaysProgress => 'Today\'s Progress';

  @override
  String get experienceShort => 'EXP';

  @override
  String get congratulations => 'Congratulations!';

  @override
  String levelReached(Object level) {
    return 'Level $level reached!';
  }

  @override
  String get continueButton => 'Continue';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Don\'t forget to use your achievements to... $goal!';
  }

  @override
  String get goal => 'Goal';

  @override
  String get defaultGoal => 'Level up your life!';

  @override
  String get progress => 'Progress';

  @override
  String get progressToLevel => 'Progress to Level';

  @override
  String get completed => 'Completed';

  @override
  String get overdue => 'Overdue';

  @override
  String get karma => 'Karma';

  @override
  String get karmaLevel => 'Karma Level';

  @override
  String get karmaDescription => 'Habit karma level reflects your consistency.';

  @override
  String get resetProgress => 'Reset Progress';

  @override
  String get resetProgressTitle => 'Reset Progress?';

  @override
  String get resetProgressDescription => 'This action will permanently reset:';

  @override
  String get resetWarningExperience => 'All player experience and level';

  @override
  String get resetWarningHabits => 'Completion history of all habits';

  @override
  String get resetWarningKarma => 'Karma levels of all habits';

  @override
  String get resetTasksUnaffected => 'Tasks will not be affected.';

  @override
  String get resetCannotUndone => 'This action cannot be undone!';

  @override
  String get resetCancel => 'Cancel';

  @override
  String get resetConfirm => 'Reset Progress';

  @override
  String get resetSuccess => 'Progress has been reset successfully!';

  @override
  String get progressSettings => 'Settings';

  @override
  String get goalMotivation => 'Goal Motivation';

  @override
  String get goalMotivationHint => 'What are you accumulating experience for?';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get russian => 'Russian';

  @override
  String get german => 'German';

  @override
  String get french => 'French';

  @override
  String get spanish => 'Spanish';

  @override
  String get portuguese => 'Portuguese';

  @override
  String get chinese => 'Chinese';

  @override
  String get japanese => 'Japanese';

  @override
  String get korean => 'Korean';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Arabic';

  @override
  String get hebrew => 'Hebrew';

  @override
  String get curveExponent => 'Curve Exponent';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Curve exponent: $exponent. Values <1 make early levels easier, >1 make later levels easier';
  }

  @override
  String get experienceMultiplier => 'Experience Multiplier';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Experience multiplier: $multiplier. Higher values make leveling slower';
  }

  @override
  String get levelProgressionPreview => 'Level Progression Preview:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Formula: EXP = $multiplier × (Level-1)^$exponent';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get habitFormTitle => 'Habit Title';

  @override
  String get habitFormTitleError => 'Please enter a title';

  @override
  String get habitFormDescription => 'Description';

  @override
  String get habitFormExperience => 'Experience Points';

  @override
  String get habitFormExperienceError => 'Please enter experience';

  @override
  String get habitFormNumberError => 'Please enter a valid number';

  @override
  String get habitFormMinCompletion => 'Min Completion';

  @override
  String get habitFormMinCompletionError => 'Please enter min count';

  @override
  String get habitFormMinCountError => 'At least 1';

  @override
  String get habitFormUpdate => 'Update Habit';

  @override
  String get habitFormSave => 'Save Habit';

  @override
  String get habitFormWeeklyError => 'Please select at least one day for weekly schedule';

  @override
  String get habitFormMonthlyError => 'Please select at least one day for monthly schedule';

  @override
  String get habitFormCustomError => 'Please select interval for custom schedule';

  @override
  String habitItemExperience(Object experience) {
    return '$experience XP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min $minCompletionCount';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '$currentCount today';
  }

  @override
  String get habitItemNotToday => 'Not today';

  @override
  String get habitItemEditTooltip => 'Edit habit';

  @override
  String get habitItemDeleteTooltip => 'Delete habit';

  @override
  String get habitItemScheduleDaily => 'daily';

  @override
  String get habitItemScheduleWeekly => 'weekly';

  @override
  String get habitItemScheduleMonthly => 'monthly';

  @override
  String get habitItemScheduleCustom => 'custom';

  @override
  String get habitItemDeleteConfirmationTitle => 'Delete Habit';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Are you sure you want to delete \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ This will remove $xpAmount XP from your player!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Cancel';

  @override
  String get habitItemDeleteConfirmationDelete => 'Delete';

  @override
  String get habitsTabEmptyTitle => 'No habits yet!';

  @override
  String get habitsTabEmptySubtitle => 'Tap the + button to add your first habit';

  @override
  String get taskFormTitle => 'Task Title';

  @override
  String get taskFormTitleError => 'Please enter a title';

  @override
  String get taskFormDescription => 'Description';

  @override
  String get taskFormExperience => 'Experience Points';

  @override
  String get taskFormExperienceError => 'Please enter experience';

  @override
  String get taskFormNumberError => 'Please enter a valid number';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Due Date: $date';
  }

  @override
  String get taskFormSelectDate => 'Select Date';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Priority: $priority';
  }

  @override
  String get taskFormCategory => 'Category';

  @override
  String get taskFormUpdate => 'Update Task';

  @override
  String get taskFormSave => 'Save Task';

  @override
  String get taskCategoryWork => 'Work';

  @override
  String get taskCategoryPersonal => 'Personal';

  @override
  String get taskCategoryHealth => 'Health';

  @override
  String get taskCategoryLearning => 'Learning';

  @override
  String get taskCategoryGeneral => 'General';

  @override
  String get taskCategoryHove => 'Home';

  @override
  String get taskCategorySocial => 'Social';

  @override
  String get taskCategoryOther => 'Other';

  @override
  String get tasksTabEmptyTitle => 'No tasks yet!';

  @override
  String get tasksTabEmptySubtitle => 'Tap the + button to add your first task';

  @override
  String get tasksTabTotal => 'Total';

  @override
  String get tasksTabPending => 'Pending';

  @override
  String get tasksTabDone => 'Done';

  @override
  String tasksTabPendingHeader(Object count) {
    return 'Pending Tasks ($count)';
  }

  @override
  String get tasksTabCompletedHeader => 'Completed Tasks';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience XP';
  }

  @override
  String get tasksTabEditTooltip => 'Edit task';

  @override
  String get tasksTabDeleteTooltip => 'Delete task';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Delete Task';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Are you sure you want to delete \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ This will remove $xpAmount XP from your player!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Cancel';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Delete';

  @override
  String get tasksTabDueToday => 'Today';

  @override
  String get tasksTabDueTomorrow => 'Tomorrow';

  @override
  String get tasksTabDueYesterday => 'Yesterday';

  @override
  String tasksTabDueDaysAgo(num days) {
    return '$days days ago';
  }

  @override
  String tasksTabDueInDays(num days) {
    return 'In $days days';
  }

  @override
  String get scheduleSelectorTitle => 'Schedule Type';

  @override
  String get scheduleTypeDaily => 'Daily';

  @override
  String get scheduleTypeWeekly => 'Weekly';

  @override
  String get scheduleTypeMonthly => 'Monthly';

  @override
  String get scheduleTypeCustom => 'Custom Interval';

  @override
  String get scheduleWeeklyTitle => 'Select days:';

  @override
  String get scheduleMonthlyTitle => 'Select days of month:';

  @override
  String get scheduleCustomTitle => 'Repeat every X days:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Please select interval';

  @override
  String get weekdayMonday => 'Mon';

  @override
  String get weekdayTuesday => 'Tue';

  @override
  String get weekdayWednesday => 'Wed';

  @override
  String get weekdayThursday => 'Thu';

  @override
  String get weekdayFriday => 'Fri';

  @override
  String get weekdaySaturday => 'Sat';

  @override
  String get weekdaySunday => 'Sun';

  @override
  String get dayResetHour => 'Day Reset Hour';

  @override
  String dayResetHourDescription(Object hour) {
    return 'New day starts at $hour:00';
  }

  @override
  String get dayResetHourLabel => 'Set the hour when a new day begins (0-23)';
}
