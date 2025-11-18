// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Vanebaserad Nivåuppgång!';

  @override
  String get home => 'Hem';

  @override
  String get settings => 'Inställningar';

  @override
  String get addHabit => 'Lägg till vana';

  @override
  String get addTask => 'Lägg till uppgift';

  @override
  String get editHabit => 'Redigera vana';

  @override
  String get editTask => 'Redigera uppgift';

  @override
  String get toNext => 'Till nästa';

  @override
  String get completeDayHint => 'Fullför missad dag';

  @override
  String get markCompletedHabitsHint => 'Markera avslutade vanor för denna dag:';

  @override
  String get skipDayButton => 'Hoppa över denna dag';

  @override
  String get completeDayButton => 'Fullför dag';

  @override
  String get scheduleType => 'Schematyp';

  @override
  String get habits => 'Vanor';

  @override
  String get habitsDone => 'Avslutade vanor';

  @override
  String get tasks => 'Uppgifter';

  @override
  String get tasksDue => 'Förfallna uppgifter';

  @override
  String get tasksDone => 'Avslutade uppgifter';

  @override
  String get level => 'Nivå';

  @override
  String get todaysProgress => 'Dagens framsteg';

  @override
  String get experienceShort => 'EP';

  @override
  String get congratulations => 'Grattis!';

  @override
  String levelReached(Object level) {
    return 'Nivå $level uppnådd!';
  }

  @override
  String get continueButton => 'Fortsätt';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Glöm inte att använda dina prestationer för att... $goal!';
  }

  @override
  String get goal => 'Mål';

  @override
  String get defaultGoal => 'Nivåuppgradera ditt liv!';

  @override
  String playerProgressToLevel(Object level) {
    return 'Framsteg till nivå';
  }

  @override
  String get overdue => 'Försenad';

  @override
  String get goalMotivation => 'Mål motivation';

  @override
  String get goalMotivationHint => 'Vad samlar du erfarenhet för?';

  @override
  String get language => 'Språk';

  @override
  String get english => 'Engelska';

  @override
  String get russian => 'Ryska';

  @override
  String get german => 'Tyska';

  @override
  String get french => 'Franska';

  @override
  String get spanish => 'Spanska';

  @override
  String get portuguese => 'Portugisiska';

  @override
  String get polish => 'Polska';

  @override
  String get italian => 'Italienska';

  @override
  String get dutch => 'Nederländska';

  @override
  String get swedish => 'Svenska';

  @override
  String get norwegian => 'Norska';

  @override
  String get finnish => 'Finska';

  @override
  String get armenian => 'Armeniska';

  @override
  String get turkish => 'Turkiska';

  @override
  String get chinese => 'Kinesiska';

  @override
  String get japanese => 'Japanska';

  @override
  String get korean => 'Koreanska';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Arabiska';

  @override
  String get hebrew => 'Hebreiska';

  @override
  String get curveExponent => 'Kurvexponent';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Kurvexponent: $exponent. Värden <1 gör tidiga nivåer lättare, >1 gör senare nivåer lättare';
  }

  @override
  String get experienceMultiplier => 'Erfarenhetsmultiplikator';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Erfarenhetsmultiplikator: $multiplier. Högre värden gör nivåuppgång långsammare';
  }

  @override
  String get levelProgressionPreview => 'Förhandsvisning nivåprogression:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Formel: EP = $multiplier × (Nivå-1)^$exponent';
  }

  @override
  String get cancel => 'Avbryt';

  @override
  String get save => 'Spara';

  @override
  String get habitFormTitle => 'Vanetitel';

  @override
  String get habitFormTitleError => 'Ange en titel';

  @override
  String get habitFormDescription => 'Beskrivning';

  @override
  String get habitFormExperience => 'Erfarenhetspoäng';

  @override
  String get habitFormExperienceError => 'Ange erfarenhet';

  @override
  String get habitFormNumberError => 'Ange ett giltigt nummer';

  @override
  String get habitFormMinCompletion => 'Minsta fullföljande';

  @override
  String get habitFormMinCompletionError => 'Ange minsta antal';

  @override
  String get habitFormMinCountError => 'Minst 1';

  @override
  String get habitFormUpdate => 'Uppdatera vana';

  @override
  String get habitFormSave => 'Spara vana';

  @override
  String get habitFormWeeklyError => 'Välj minst en dag för veckoschema';

  @override
  String get habitFormMonthlyError => 'Välj minst en dag för månadsschema';

  @override
  String get habitFormCustomError => 'Välj intervall för anpassat schema';

  @override
  String habitItemExperience(Object experience) {
    return '$experience EP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '$karma i rad';
  }

  @override
  String get habitItemEditTooltip => 'Redigera vana';

  @override
  String get habitItemDeleteTooltip => 'Ta bort vana';

  @override
  String get habitItemScheduleDaily => 'daglig';

  @override
  String get habitItemScheduleWeekly => 'veckovis';

  @override
  String get habitItemScheduleMonthly => 'månadsvis';

  @override
  String get habitItemScheduleCustom => 'anpassad';

  @override
  String get habitItemDeleteConfirmationTitle => 'Ta bort vana';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Är du säker på att du vill ta bort \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Detta tar bort $xpAmount EP från din spelare!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Avbryt';

  @override
  String get habitItemDeleteConfirmationDelete => 'Ta bort';

  @override
  String get habitsTabEmptyTitle => 'Inga vanor än!';

  @override
  String get habitsTabEmptySubtitle => 'Tryck på + knappen för att lägga till din första vana';

  @override
  String get habitsTabOnOtherDaysHeader => 'On other days';

  @override
  String get taskFormTitle => 'Uppgiftstitel';

  @override
  String get taskFormTitleError => 'Ange en titel';

  @override
  String get taskFormDescription => 'Beskrivning';

  @override
  String get taskFormExperience => 'Erfarenhetspoäng';

  @override
  String get taskFormExperienceError => 'Ange erfarenhet';

  @override
  String get taskFormNumberError => 'Ange ett giltigt nummer';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Förfallodatum: $date';
  }

  @override
  String get taskFormSelectDate => 'Välj datum';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Prioritet: $priority';
  }

  @override
  String get taskFormCategory => 'Kategori';

  @override
  String get taskFormUpdate => 'Uppdatera uppgift';

  @override
  String get taskFormSave => 'Spara uppgift';

  @override
  String get taskCategoryWork => 'Arbete';

  @override
  String get taskCategoryPersonal => 'Personligt';

  @override
  String get taskCategoryHealth => 'Hälsa';

  @override
  String get taskCategoryLearning => 'Inlärning';

  @override
  String get taskCategoryHome => 'Hem';

  @override
  String get taskCategorySocial => 'Socialt';

  @override
  String get taskCategoryOther => 'Annat';

  @override
  String get tasksTabEmptyTitle => 'Inga uppgifter än!';

  @override
  String get tasksTabEmptySubtitle => 'Tryck på + knappen för att lägga till din första uppgift';

  @override
  String get tasksTabCompletedHeader => 'Avslutade uppgifter';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience EP';
  }

  @override
  String get tasksTabEditTooltip => 'Redigera uppgift';

  @override
  String get tasksTabDeleteTooltip => 'Ta bort uppgift';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Ta bort uppgift';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Är du säker på att du vill ta bort \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Detta tar bort $xpAmount EP från din spelare!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Avbryt';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Ta bort';

  @override
  String get tasksTabDueToday => 'Idag';

  @override
  String get tasksTabDueTomorrow => 'Imorgon';

  @override
  String get tasksTabDueYesterday => 'Igår';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'för $days dagar sedan',
      one: 'för $days dag sedan',
    );
    return '$_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return 'Om $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'Schematyp';

  @override
  String get scheduleTypeDaily => 'Daglig';

  @override
  String get scheduleTypeWeekly => 'Veckovis';

  @override
  String get scheduleTypeMonthly => 'Månadsvis';

  @override
  String get scheduleTypeCustom => 'Anpassat intervall';

  @override
  String get scheduleWeeklyTitle => 'Välj dagar:';

  @override
  String get scheduleMonthlyTitle => 'Välj datum i månaden:';

  @override
  String get scheduleCustomTitle => 'Upprepa varje X:e dag:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Välj intervall';

  @override
  String get weekdayMonday => 'Mån';

  @override
  String get weekdayTuesday => 'Tis';

  @override
  String get weekdayWednesday => 'Ons';

  @override
  String get weekdayThursday => 'Tor';

  @override
  String get weekdayFriday => 'Fre';

  @override
  String get weekdaySaturday => 'Lör';

  @override
  String get weekdaySunday => 'Sön';

  @override
  String get sortByTitle => 'By name';

  @override
  String get sortByExperience => 'By experience';

  @override
  String get sortByCompletionStatus => 'By completion status';

  @override
  String get sortByScheduleType => 'By schedule type';

  @override
  String get sortByKarma => 'By streak';

  @override
  String get sortByCompletionCount => 'By completion number';

  @override
  String get sortByMinCompletionCount => 'By min for completion';

  @override
  String get sortByPriority => 'By priority';

  @override
  String get sortByCategory => 'By category';

  @override
  String get sortByDueDate => 'By due date';

  @override
  String get sortAscending => 'Ascending sort';

  @override
  String get sortDescending => 'Descending sort';

  @override
  String get resetProgress => 'Återställ framsteg';

  @override
  String get resetConfirmationTitle => 'Återställ';

  @override
  String get resetConfirmationMessage => 'Är du säker på att du vill återställa ditt framsteg? Detta återställer inställningar, mål, nivå och erfarenhet och sätter skapandedatum till nu. Dina vanor och uppgifter påverkas dock inte. Denna åtgärd kan inte ångras.';

  @override
  String get resetSuccess => 'Framstegsdata har återställts framgångsrikt!';
}
