import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_ch.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('ch'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Habit To Do Some Level Up!'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @addHabit.
  ///
  /// In en, this message translates to:
  /// **'Add Habit'**
  String get addHabit;

  /// No description provided for @addTask.
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get addTask;

  /// No description provided for @editHabit.
  ///
  /// In en, this message translates to:
  /// **'Edit Habit'**
  String get editHabit;

  /// No description provided for @editTask.
  ///
  /// In en, this message translates to:
  /// **'Edit Task'**
  String get editTask;

  /// No description provided for @toNext.
  ///
  /// In en, this message translates to:
  /// **'To Next'**
  String get toNext;

  /// No description provided for @completeDayHint.
  ///
  /// In en, this message translates to:
  /// **'Complete Missed Day'**
  String get completeDayHint;

  /// No description provided for @markCompletedHabitsHint.
  ///
  /// In en, this message translates to:
  /// **'Mark completed habits for this day:'**
  String get markCompletedHabitsHint;

  /// No description provided for @skipDayButton.
  ///
  /// In en, this message translates to:
  /// **'Skip This Day'**
  String get skipDayButton;

  /// No description provided for @completeDayButton.
  ///
  /// In en, this message translates to:
  /// **'Complete Day'**
  String get completeDayButton;

  /// No description provided for @scheduleType.
  ///
  /// In en, this message translates to:
  /// **'Schedule Type'**
  String get scheduleType;

  /// No description provided for @habits.
  ///
  /// In en, this message translates to:
  /// **'Habits'**
  String get habits;

  /// No description provided for @habitsDone.
  ///
  /// In en, this message translates to:
  /// **'Habits Done'**
  String get habitsDone;

  /// No description provided for @habitsNumberToday.
  ///
  /// In en, this message translates to:
  /// **'{habitsNumber} today'**
  String habitsNumberToday(Object habitsNumber);

  /// No description provided for @tasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasks;

  /// No description provided for @tasksDue.
  ///
  /// In en, this message translates to:
  /// **'Tasks Due'**
  String get tasksDue;

  /// No description provided for @tasksDone.
  ///
  /// In en, this message translates to:
  /// **'Tasks Done'**
  String get tasksDone;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @todaysProgress.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Progress'**
  String get todaysProgress;

  /// No description provided for @experienceShort.
  ///
  /// In en, this message translates to:
  /// **'EXP'**
  String get experienceShort;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @levelReached.
  ///
  /// In en, this message translates to:
  /// **'Level {level} reached!'**
  String levelReached(Object level);

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @dontForgetToUseAchievenents.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to use your achievements to... {goal}!'**
  String dontForgetToUseAchievenents(Object goal);

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @defaultGoal.
  ///
  /// In en, this message translates to:
  /// **'Level up your life!'**
  String get defaultGoal;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @progressToLevel.
  ///
  /// In en, this message translates to:
  /// **'Progress to Level'**
  String get progressToLevel;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @karma.
  ///
  /// In en, this message translates to:
  /// **'Karma'**
  String get karma;

  /// No description provided for @karmaLevel.
  ///
  /// In en, this message translates to:
  /// **'Karma Level'**
  String get karmaLevel;

  /// No description provided for @karmaDescription.
  ///
  /// In en, this message translates to:
  /// **'Habit karma level reflects your consistency.'**
  String get karmaDescription;

  /// No description provided for @resetProgress.
  ///
  /// In en, this message translates to:
  /// **'Reset Progress'**
  String get resetProgress;

  /// No description provided for @resetProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Progress?'**
  String get resetProgressTitle;

  /// No description provided for @resetProgressDescription.
  ///
  /// In en, this message translates to:
  /// **'This action will permanently reset:'**
  String get resetProgressDescription;

  /// No description provided for @resetWarningExperience.
  ///
  /// In en, this message translates to:
  /// **'All player experience and level'**
  String get resetWarningExperience;

  /// No description provided for @resetWarningHabits.
  ///
  /// In en, this message translates to:
  /// **'Completion history of all habits'**
  String get resetWarningHabits;

  /// No description provided for @resetWarningKarma.
  ///
  /// In en, this message translates to:
  /// **'Karma levels of all habits'**
  String get resetWarningKarma;

  /// No description provided for @resetTasksUnaffected.
  ///
  /// In en, this message translates to:
  /// **'Tasks will not be affected.'**
  String get resetTasksUnaffected;

  /// No description provided for @resetCannotUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone!'**
  String get resetCannotUndone;

  /// No description provided for @progressSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get progressSettings;

  /// No description provided for @goalMotivation.
  ///
  /// In en, this message translates to:
  /// **'Goal Motivation'**
  String get goalMotivation;

  /// No description provided for @goalMotivationHint.
  ///
  /// In en, this message translates to:
  /// **'What are you accumulating experience for?'**
  String get goalMotivationHint;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// No description provided for @german.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @portuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portuguese;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get chinese;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// No description provided for @korean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get korean;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get hindi;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @hebrew.
  ///
  /// In en, this message translates to:
  /// **'Hebrew'**
  String get hebrew;

  /// No description provided for @curveExponent.
  ///
  /// In en, this message translates to:
  /// **'Curve Exponent'**
  String get curveExponent;

  /// No description provided for @curveExponentDescription.
  ///
  /// In en, this message translates to:
  /// **'Curve exponent: {exponent}. Values <1 make early levels easier, >1 make later levels easier'**
  String curveExponentDescription(Object exponent);

  /// No description provided for @experienceMultiplier.
  ///
  /// In en, this message translates to:
  /// **'Experience Multiplier'**
  String get experienceMultiplier;

  /// No description provided for @experienceMultiplierDescription.
  ///
  /// In en, this message translates to:
  /// **'Experience multiplier: {multiplier}. Higher values make leveling slower'**
  String experienceMultiplierDescription(Object multiplier);

  /// No description provided for @levelProgressionPreview.
  ///
  /// In en, this message translates to:
  /// **'Level Progression Preview:'**
  String get levelProgressionPreview;

  /// No description provided for @levelFormula.
  ///
  /// In en, this message translates to:
  /// **'Formula: EXP = {multiplier} × (Level-1)^{exponent}'**
  String levelFormula(Object exponent, Object multiplier);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @habitFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Habit Title'**
  String get habitFormTitle;

  /// No description provided for @habitFormTitleError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get habitFormTitleError;

  /// No description provided for @habitFormDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get habitFormDescription;

  /// No description provided for @habitFormExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience Points'**
  String get habitFormExperience;

  /// No description provided for @habitFormExperienceError.
  ///
  /// In en, this message translates to:
  /// **'Please enter experience'**
  String get habitFormExperienceError;

  /// No description provided for @habitFormNumberError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get habitFormNumberError;

  /// No description provided for @habitFormMinCompletion.
  ///
  /// In en, this message translates to:
  /// **'Min Completion'**
  String get habitFormMinCompletion;

  /// No description provided for @habitFormMinCompletionError.
  ///
  /// In en, this message translates to:
  /// **'Please enter min count'**
  String get habitFormMinCompletionError;

  /// No description provided for @habitFormMinCountError.
  ///
  /// In en, this message translates to:
  /// **'At least 1'**
  String get habitFormMinCountError;

  /// No description provided for @habitFormUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Habit'**
  String get habitFormUpdate;

  /// No description provided for @habitFormSave.
  ///
  /// In en, this message translates to:
  /// **'Save Habit'**
  String get habitFormSave;

  /// No description provided for @habitFormWeeklyError.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one day for weekly schedule'**
  String get habitFormWeeklyError;

  /// No description provided for @habitFormMonthlyError.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one day for monthly schedule'**
  String get habitFormMonthlyError;

  /// No description provided for @habitFormCustomError.
  ///
  /// In en, this message translates to:
  /// **'Please select interval for custom schedule'**
  String get habitFormCustomError;

  /// No description provided for @habitItemExperience.
  ///
  /// In en, this message translates to:
  /// **'{experience} XP'**
  String habitItemExperience(Object experience);

  /// No description provided for @habitItemMinCompletion.
  ///
  /// In en, this message translates to:
  /// **'min {minCompletionCount}'**
  String habitItemMinCompletion(Object minCompletionCount);

  /// No description provided for @habitItemTodayCount.
  ///
  /// In en, this message translates to:
  /// **'{currentCount} today'**
  String habitItemTodayCount(Object currentCount);

  /// No description provided for @habitItemNotToday.
  ///
  /// In en, this message translates to:
  /// **'Not today'**
  String get habitItemNotToday;

  /// No description provided for @habitItemEditTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit habit'**
  String get habitItemEditTooltip;

  /// No description provided for @habitItemDeleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete habit'**
  String get habitItemDeleteTooltip;

  /// No description provided for @habitItemScheduleDaily.
  ///
  /// In en, this message translates to:
  /// **'daily'**
  String get habitItemScheduleDaily;

  /// No description provided for @habitItemScheduleWeekly.
  ///
  /// In en, this message translates to:
  /// **'weekly'**
  String get habitItemScheduleWeekly;

  /// No description provided for @habitItemScheduleMonthly.
  ///
  /// In en, this message translates to:
  /// **'monthly'**
  String get habitItemScheduleMonthly;

  /// No description provided for @habitItemScheduleCustom.
  ///
  /// In en, this message translates to:
  /// **'custom'**
  String get habitItemScheduleCustom;

  /// No description provided for @habitItemDeleteConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Habit'**
  String get habitItemDeleteConfirmationTitle;

  /// No description provided for @habitItemDeleteConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{habitTitle}\"?'**
  String habitItemDeleteConfirmationMessage(Object habitTitle);

  /// No description provided for @habitItemDeleteConfirmationWarning.
  ///
  /// In en, this message translates to:
  /// **'⚠️ This will remove {xpAmount} XP from your player!'**
  String habitItemDeleteConfirmationWarning(Object xpAmount);

  /// No description provided for @habitItemDeleteConfirmationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get habitItemDeleteConfirmationCancel;

  /// No description provided for @habitItemDeleteConfirmationDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get habitItemDeleteConfirmationDelete;

  /// No description provided for @habitsTabEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No habits yet!'**
  String get habitsTabEmptyTitle;

  /// No description provided for @habitsTabEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the + button to add your first habit'**
  String get habitsTabEmptySubtitle;

  /// No description provided for @taskFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Task Title'**
  String get taskFormTitle;

  /// No description provided for @taskFormTitleError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get taskFormTitleError;

  /// No description provided for @taskFormDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get taskFormDescription;

  /// No description provided for @taskFormExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience Points'**
  String get taskFormExperience;

  /// No description provided for @taskFormExperienceError.
  ///
  /// In en, this message translates to:
  /// **'Please enter experience'**
  String get taskFormExperienceError;

  /// No description provided for @taskFormNumberError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get taskFormNumberError;

  /// No description provided for @taskFormDueDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Due Date: {date}'**
  String taskFormDueDateLabel(Object date);

  /// No description provided for @taskFormSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get taskFormSelectDate;

  /// No description provided for @taskFormPriorityLabel.
  ///
  /// In en, this message translates to:
  /// **'Priority: {priority}'**
  String taskFormPriorityLabel(Object priority);

  /// No description provided for @taskFormCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get taskFormCategory;

  /// No description provided for @taskFormUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Task'**
  String get taskFormUpdate;

  /// No description provided for @taskFormSave.
  ///
  /// In en, this message translates to:
  /// **'Save Task'**
  String get taskFormSave;

  /// No description provided for @taskCategoryWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get taskCategoryWork;

  /// No description provided for @taskCategoryPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get taskCategoryPersonal;

  /// No description provided for @taskCategoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get taskCategoryHealth;

  /// No description provided for @taskCategoryLearning.
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get taskCategoryLearning;

  /// No description provided for @taskCategoryGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get taskCategoryGeneral;

  /// No description provided for @taskCategoryHove.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get taskCategoryHove;

  /// No description provided for @taskCategorySocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get taskCategorySocial;

  /// No description provided for @taskCategoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get taskCategoryOther;

  /// No description provided for @tasksTabEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No tasks yet!'**
  String get tasksTabEmptyTitle;

  /// No description provided for @tasksTabEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the + button to add your first task'**
  String get tasksTabEmptySubtitle;

  /// No description provided for @tasksTabTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get tasksTabTotal;

  /// No description provided for @tasksTabPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get tasksTabPending;

  /// No description provided for @tasksTabDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get tasksTabDone;

  /// No description provided for @tasksTabPendingHeader.
  ///
  /// In en, this message translates to:
  /// **'Pending Tasks ({count})'**
  String tasksTabPendingHeader(Object count);

  /// No description provided for @tasksTabCompletedHeader.
  ///
  /// In en, this message translates to:
  /// **'Completed Tasks'**
  String get tasksTabCompletedHeader;

  /// No description provided for @tasksTabExperience.
  ///
  /// In en, this message translates to:
  /// **'{experience} XP'**
  String tasksTabExperience(Object experience);

  /// No description provided for @tasksTabEditTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit task'**
  String get tasksTabEditTooltip;

  /// No description provided for @tasksTabDeleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete task'**
  String get tasksTabDeleteTooltip;

  /// No description provided for @tasksTabDeleteConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Task'**
  String get tasksTabDeleteConfirmationTitle;

  /// No description provided for @tasksTabDeleteConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{taskTitle}\"?'**
  String tasksTabDeleteConfirmationMessage(Object taskTitle);

  /// No description provided for @tasksTabDeleteConfirmationWarning.
  ///
  /// In en, this message translates to:
  /// **'⚠️ This will remove {xpAmount} XP from your player!'**
  String tasksTabDeleteConfirmationWarning(Object xpAmount);

  /// No description provided for @tasksTabDeleteConfirmationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get tasksTabDeleteConfirmationCancel;

  /// No description provided for @tasksTabDeleteConfirmationDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get tasksTabDeleteConfirmationDelete;

  /// No description provided for @tasksTabDueToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get tasksTabDueToday;

  /// No description provided for @tasksTabDueTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tasksTabDueTomorrow;

  /// No description provided for @tasksTabDueYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get tasksTabDueYesterday;

  /// No description provided for @tasksTabDueDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String tasksTabDueDaysAgo(num days);

  /// No description provided for @tasksTabDueInDays.
  ///
  /// In en, this message translates to:
  /// **'In {days} days'**
  String tasksTabDueInDays(num days);

  /// No description provided for @scheduleSelectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule Type'**
  String get scheduleSelectorTitle;

  /// No description provided for @scheduleTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get scheduleTypeDaily;

  /// No description provided for @scheduleTypeWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get scheduleTypeWeekly;

  /// No description provided for @scheduleTypeMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get scheduleTypeMonthly;

  /// No description provided for @scheduleTypeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom Interval'**
  String get scheduleTypeCustom;

  /// No description provided for @scheduleWeeklyTitle.
  ///
  /// In en, this message translates to:
  /// **'Select days:'**
  String get scheduleWeeklyTitle;

  /// No description provided for @scheduleMonthlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Select days of month:'**
  String get scheduleMonthlyTitle;

  /// No description provided for @scheduleCustomTitle.
  ///
  /// In en, this message translates to:
  /// **'Repeat every X days:'**
  String get scheduleCustomTitle;

  /// No description provided for @scheduleCustomInterval.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, one{1 day} other{{days} days}}'**
  String scheduleCustomInterval(num days);

  /// No description provided for @scheduleCustomError.
  ///
  /// In en, this message translates to:
  /// **'Please select interval'**
  String get scheduleCustomError;

  /// No description provided for @weekdayMonday.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get weekdayMonday;

  /// No description provided for @weekdayTuesday.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get weekdayTuesday;

  /// No description provided for @weekdayWednesday.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get weekdayWednesday;

  /// No description provided for @weekdayThursday.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get weekdayThursday;

  /// No description provided for @weekdayFriday.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get weekdayFriday;

  /// No description provided for @weekdaySaturday.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get weekdaySaturday;

  /// No description provided for @weekdaySunday.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get weekdaySunday;

  /// No description provided for @dayResetHour.
  ///
  /// In en, this message translates to:
  /// **'Day Reset Hour'**
  String get dayResetHour;

  /// No description provided for @dayResetHourDescription.
  ///
  /// In en, this message translates to:
  /// **'New day starts at {hour}:00'**
  String dayResetHourDescription(Object hour);

  /// No description provided for @dayResetHourLabel.
  ///
  /// In en, this message translates to:
  /// **'Set the hour when a new day begins (0-23)'**
  String get dayResetHourLabel;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @resetConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetConfirmationTitle;

  /// No description provided for @resetConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset your progress? This will reset settings, goal, level and experience and set creation date to now. Your habits and tasks, although, are not affected. This action cannot be undone.'**
  String get resetConfirmationMessage;

  /// No description provided for @resetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Progress data has been reset successfully!'**
  String get resetSuccess;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'ch', 'de', 'en', 'es', 'fr', 'he', 'hi', 'ja', 'ko', 'pt', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'ch': return AppLocalizationsCh();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'he': return AppLocalizationsHe();
    case 'hi': return AppLocalizationsHi();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
