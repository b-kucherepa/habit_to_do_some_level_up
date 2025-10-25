// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Vane At Gøre Noget Niveau Op!';

  @override
  String get home => 'Hjem';

  @override
  String get settings => 'Indstillinger';

  @override
  String get addHabit => 'Tilføj Vane';

  @override
  String get addTask => 'Tilføj Opgave';

  @override
  String get editHabit => 'Rediger Vane';

  @override
  String get editTask => 'Rediger Opgave';

  @override
  String get toNext => 'Til Næste';

  @override
  String get completeDayHint => 'Fuldfør Glemt Dag';

  @override
  String get markCompletedHabitsHint => 'Marker fuldførte vaner for denne dag:';

  @override
  String get skipDayButton => 'Spring Dag Over';

  @override
  String get completeDayButton => 'Fuldfør Dag';

  @override
  String get scheduleType => 'Planlægningstype';

  @override
  String get habits => 'Vanner';

  @override
  String get habitsDone => 'Vanner Gjort';

  @override
  String get tasks => 'Opgaver';

  @override
  String get tasksDue => 'Opgaver Forfalder';

  @override
  String get tasksDone => 'Opgaver Gjort';

  @override
  String get level => 'Niveau';

  @override
  String get todaysProgress => 'Dagens Fremskridt';

  @override
  String get experienceShort => 'ERF';

  @override
  String get congratulations => 'Tillykke!';

  @override
  String levelReached(Object level) {
    return 'Niveau $level nået!';
  }

  @override
  String get continueButton => 'Fortsæt';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Glem ikke at bruge dine præstationer til at... $goal!';
  }

  @override
  String get goal => 'Mål';

  @override
  String get defaultGoal => 'Niveauop din tilværelse!';

  @override
  String playerProgressToLevel(Object level) {
    return 'Fremskridt til Niveau';
  }

  @override
  String get overdue => 'Overskredet';

  @override
  String get goalMotivation => 'Mål Motivation';

  @override
  String get goalMotivationHint => 'Hvad samler du erfaring til?';

  @override
  String get language => 'Sprog';

  @override
  String get english => 'Engelsk';

  @override
  String get russian => 'Russisk';

  @override
  String get german => 'Tysk';

  @override
  String get french => 'Fransk';

  @override
  String get spanish => 'Spansk';

  @override
  String get portuguese => 'Portugisisk';

  @override
  String get polish => 'Polsk';

  @override
  String get italian => 'Italiensk';

  @override
  String get dutch => 'Hollandsk';

  @override
  String get swedish => 'Svensk';

  @override
  String get norwegian => 'Norsk';

  @override
  String get finnish => 'Finsk';

  @override
  String get armenian => 'Armensk';

  @override
  String get turkish => 'Tyrkisk';

  @override
  String get chinese => 'Kinesisk';

  @override
  String get japanese => 'Japansk';

  @override
  String get korean => 'Koreansk';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Arabisk';

  @override
  String get hebrew => 'Hebræisk';

  @override
  String get curveExponent => 'Kurve Eksponent';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Kurve eksponent: $exponent. Værdier <1 gør tidlige niveauer nemmere, >1 gør senere niveauer nemmere';
  }

  @override
  String get experienceMultiplier => 'Erfarings Multiplikator';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Erfarings multiplikator: $multiplier. Højere værdier gør niveau stigning langsommere';
  }

  @override
  String get levelProgressionPreview => 'Niveau Fremskridts Forhåndsvisning:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Formel: ERF = $multiplier × (Niveau-1)^$exponent';
  }

  @override
  String get cancel => 'Annuller';

  @override
  String get save => 'Gem';

  @override
  String get habitFormTitle => 'Vane Titel';

  @override
  String get habitFormTitleError => 'Indtast en titel';

  @override
  String get habitFormDescription => 'Beskrivelse';

  @override
  String get habitFormExperience => 'Erfarings Point';

  @override
  String get habitFormExperienceError => 'Indtast erfaring';

  @override
  String get habitFormNumberError => 'Indtast et gyldigt tal';

  @override
  String get habitFormMinCompletion => 'Min Fuldførelse';

  @override
  String get habitFormMinCompletionError => 'Indtast minimum antal';

  @override
  String get habitFormMinCountError => 'Mindst 1';

  @override
  String get habitFormUpdate => 'Opdater Vane';

  @override
  String get habitFormSave => 'Gem Vane';

  @override
  String get habitFormWeeklyError => 'Vælg mindst én dag for ugeplan';

  @override
  String get habitFormMonthlyError => 'Vælg mindst én dag for månedsplan';

  @override
  String get habitFormCustomError => 'Vælg interval for brugerdefineret plan';

  @override
  String habitItemExperience(Object experience) {
    return '$experience ERF';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '$karma i træk';
  }

  @override
  String get habitItemEditTooltip => 'Rediger vane';

  @override
  String get habitItemDeleteTooltip => 'Slet vane';

  @override
  String get habitItemScheduleDaily => 'daglig';

  @override
  String get habitItemScheduleWeekly => 'ugentlig';

  @override
  String get habitItemScheduleMonthly => 'månedlig';

  @override
  String get habitItemScheduleCustom => 'brugerdefineret';

  @override
  String get habitItemDeleteConfirmationTitle => 'Slet Vane';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Er du sikker på, at du vil slette \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Dette fjerner $xpAmount ERF fra din spiller!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Annuller';

  @override
  String get habitItemDeleteConfirmationDelete => 'Slet';

  @override
  String get habitsTabEmptyTitle => 'Ingen vaner endnu!';

  @override
  String get habitsTabEmptySubtitle => 'Tryk på + knappen for at tilføje din første vane';

  @override
  String get taskFormTitle => 'Opgave Titel';

  @override
  String get taskFormTitleError => 'Indtast en titel';

  @override
  String get taskFormDescription => 'Beskrivelse';

  @override
  String get taskFormExperience => 'Erfarings Point';

  @override
  String get taskFormExperienceError => 'Indtast erfaring';

  @override
  String get taskFormNumberError => 'Indtast et gyldigt tal';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Forfaldsdato: $date';
  }

  @override
  String get taskFormSelectDate => 'Vælg Dato';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Prioritet: $priority';
  }

  @override
  String get taskFormCategory => 'Kategori';

  @override
  String get taskFormUpdate => 'Opdater Opgave';

  @override
  String get taskFormSave => 'Gem Opgave';

  @override
  String get taskCategoryWork => 'Arbejde';

  @override
  String get taskCategoryPersonal => 'Personlig';

  @override
  String get taskCategoryHealth => 'Sundhed';

  @override
  String get taskCategoryLearning => 'Læring';

  @override
  String get taskCategoryGeneral => 'Generelt';

  @override
  String get taskCategoryHome => 'Hjem';

  @override
  String get taskCategorySocial => 'Social';

  @override
  String get taskCategoryOther => 'Andet';

  @override
  String get tasksTabEmptyTitle => 'Ingen opgaver endnu!';

  @override
  String get tasksTabEmptySubtitle => 'Tryk på + knappen for at tilføje din første opgave';

  @override
  String get tasksTabCompletedHeader => 'Fuldførte Opgaver';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience ERF';
  }

  @override
  String get tasksTabEditTooltip => 'Rediger opgave';

  @override
  String get tasksTabDeleteTooltip => 'Slet opgave';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Slet Opgave';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Er du sikker på, at du vil slette \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Dette fjerner $xpAmount ERF fra din spiller!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Annuller';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Slet';

  @override
  String get tasksTabDueToday => 'I dag';

  @override
  String get tasksTabDueTomorrow => 'I morgen';

  @override
  String get tasksTabDueYesterday => 'I går';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'for $days dage siden',
      one: 'for $days dag siden',
    );
    return '$_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dage',
      one: '$days dag',
    );
    return 'Om $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'Planlægningstype';

  @override
  String get scheduleTypeDaily => 'Daglig';

  @override
  String get scheduleTypeWeekly => 'Ugentlig';

  @override
  String get scheduleTypeMonthly => 'Månedlig';

  @override
  String get scheduleTypeCustom => 'Brugerdefineret Interval';

  @override
  String get scheduleWeeklyTitle => 'Vælg dage:';

  @override
  String get scheduleMonthlyTitle => 'Vælg dage i måneden:';

  @override
  String get scheduleCustomTitle => 'Gentag hver X. dag:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dage',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Vælg interval';

  @override
  String get weekdayMonday => 'Man';

  @override
  String get weekdayTuesday => 'Tir';

  @override
  String get weekdayWednesday => 'Ons';

  @override
  String get weekdayThursday => 'Tor';

  @override
  String get weekdayFriday => 'Fre';

  @override
  String get weekdaySaturday => 'Lør';

  @override
  String get weekdaySunday => 'Søn';

  @override
  String get resetProgress => 'Nulstil Fremskridt';

  @override
  String get resetConfirmationTitle => 'Nulstil';

  @override
  String get resetConfirmationMessage => 'Er du sikker på, at du vil nulstille dine fremskridt? Dette nulstiller indstillinger, mål, niveau og erfaring og sætter oprettelsesdatoen til nu. Dine vaner og opgaver påvirkes dog ikke. Handlingen kan ikke fortrydes.';

  @override
  String get resetSuccess => 'Fremskridtsdata er blevet nulstillet!';
}
