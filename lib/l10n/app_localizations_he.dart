// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'הרגל לעשות - התקדמות ברמות!';

  @override
  String get home => 'בית';

  @override
  String get settings => 'הגדרות';

  @override
  String get addHabit => 'הוסף הרגל';

  @override
  String get addTask => 'הוסף משימה';

  @override
  String get editHabit => 'ערוך הרגל';

  @override
  String get editTask => 'ערוך משימה';

  @override
  String get toNext => 'לבא בתור';

  @override
  String get completeDayHint => 'השלם יום שהוחמצה';

  @override
  String get markCompletedHabitsHint => 'סמן הרגלים שהושלמו עבור יום זה:';

  @override
  String get skipDayButton => 'דלג על יום זה';

  @override
  String get completeDayButton => 'השלם יום';

  @override
  String get scheduleType => 'סוג לוח זמנים';

  @override
  String get habits => 'הרגלים';

  @override
  String get habitsDone => 'הרגלים שהושלמו';

  @override
  String get tasks => 'משימות';

  @override
  String get tasksDue => 'משימות שצריך להשלים';

  @override
  String get tasksDone => 'משימות שהושלמו';

  @override
  String get level => 'רמה';

  @override
  String get todaysProgress => 'התקדמות היום';

  @override
  String get experienceShort => 'נ\"נ';

  @override
  String get congratulations => 'מזל טוב!';

  @override
  String levelReached(Object level) {
    return 'הגעת לרמה $level!';
  }

  @override
  String get continueButton => 'המשך';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'אל תשכח להשתמש בהישגים שלך כדי... $goal!';
  }

  @override
  String get goal => 'מטרה';

  @override
  String get defaultGoal => 'להתקדם בחיים!';

  @override
  String playerProgressToLevel(Object level) {
    return 'התקדמות לרמה';
  }

  @override
  String get overdue => 'באיחור';

  @override
  String get goalMotivation => 'מוטיבציה למטרה';

  @override
  String get goalMotivationHint => 'בשביל מה אתה צובר ניסיון?';

  @override
  String get language => 'שפה';

  @override
  String get english => 'אנגלית';

  @override
  String get russian => 'רוסית';

  @override
  String get german => 'גרמנית';

  @override
  String get french => 'צרפתית';

  @override
  String get spanish => 'ספרדית';

  @override
  String get portuguese => 'פורטוגזית';

  @override
  String get polish => 'פולנית';

  @override
  String get italian => 'איטלקית';

  @override
  String get dutch => 'הולנדית';

  @override
  String get swedish => 'שוודית';

  @override
  String get norwegian => 'נורווגית';

  @override
  String get finnish => 'פינית';

  @override
  String get armenian => 'ארמנית';

  @override
  String get turkish => 'טורקית';

  @override
  String get chinese => 'סינית';

  @override
  String get japanese => 'יפנית';

  @override
  String get korean => 'קוריאנית';

  @override
  String get hindi => 'הינדי';

  @override
  String get arabic => 'ערבית';

  @override
  String get hebrew => 'עברית';

  @override
  String get curveExponent => 'מעריך עקומה';

  @override
  String curveExponentDescription(Object exponent) {
    return 'מעריך עקומה: $exponent. ערכים קטנים מ-1 מקלים על הרמות הראשונות, ערכים גדולים מ-1 מקלים על הרמות המאוחרות יותר';
  }

  @override
  String get experienceMultiplier => 'מכפיל ניסיון';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'מכפיל ניסיון: $multiplier. ערכים גבוהים יותר מאטים את העלייה ברמות';
  }

  @override
  String get levelProgressionPreview => 'תצוגה מקדימה של התקדמות הרמות:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'נוסחה: נ\"נ = $multiplier × (רמה-1)^$exponent';
  }

  @override
  String get cancel => 'ביטול';

  @override
  String get save => 'שמור';

  @override
  String get habitFormTitle => 'כותרת הרגל';

  @override
  String get habitFormTitleError => 'נא להזין כותרת';

  @override
  String get habitFormDescription => 'תיאור';

  @override
  String get habitFormExperience => 'נקודות ניסיון';

  @override
  String get habitFormExperienceError => 'נא להזין ניסיון';

  @override
  String get habitFormNumberError => 'נא להזין מספר תקין';

  @override
  String get habitFormMinCompletion => 'מינימושלמים';

  @override
  String get habitFormMinCompletionError => 'נא להזין כמות מינימלית';

  @override
  String get habitFormMinCountError => 'לפחות 1';

  @override
  String get habitFormUpdate => 'עדכן הרגל';

  @override
  String get habitFormSave => 'שמור הרגל';

  @override
  String get habitFormWeeklyError => 'נא לבחור לפחות יום אחד ללוח זמנים שבועי';

  @override
  String get habitFormMonthlyError => 'נא לבחור לפחות יום אחד ללוח זמנים חודשי';

  @override
  String get habitFormCustomError => 'נא לבחור מרווח ללוח זמנים מותאם';

  @override
  String habitItemExperience(Object experience) {
    return '$experience נ\"נ';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'מינימום $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return 'רצף של $karma';
  }

  @override
  String get habitItemEditTooltip => 'ערוך הרגל';

  @override
  String get habitItemDeleteTooltip => 'מחק הרגל';

  @override
  String get habitItemScheduleDaily => 'יומי';

  @override
  String get habitItemScheduleWeekly => 'שבועי';

  @override
  String get habitItemScheduleMonthly => 'חודשי';

  @override
  String get habitItemScheduleCustom => 'מותאם';

  @override
  String get habitItemDeleteConfirmationTitle => 'מחיקת הרגל';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'האם אתה בטוח שברצונך למחוק את \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ פעולה זו תסיר $xpAmount נ\"נ מהשחקן שלך!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'ביטול';

  @override
  String get habitItemDeleteConfirmationDelete => 'מחק';

  @override
  String get habitsTabEmptyTitle => 'אין עדיין הרגלים!';

  @override
  String get habitsTabEmptySubtitle => 'הקש על כפתור + כדי להוסיף את ההרגל הראשון שלך';

  @override
  String get taskFormTitle => 'כותרת משימה';

  @override
  String get taskFormTitleError => 'נא להזין כותרת';

  @override
  String get taskFormDescription => 'תיאור';

  @override
  String get taskFormExperience => 'נקודות ניסיון';

  @override
  String get taskFormExperienceError => 'נא להזין ניסיון';

  @override
  String get taskFormNumberError => 'נא להזין מספר תקין';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'תאריך יעד: $date';
  }

  @override
  String get taskFormSelectDate => 'בחר תאריך';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'עדיפות: $priority';
  }

  @override
  String get taskFormCategory => 'קטגוריה';

  @override
  String get taskFormUpdate => 'עדכן משימה';

  @override
  String get taskFormSave => 'שמור משימה';

  @override
  String get taskCategoryWork => 'עבודה';

  @override
  String get taskCategoryPersonal => 'אישי';

  @override
  String get taskCategoryHealth => 'בריאות';

  @override
  String get taskCategoryLearning => 'למידה';

  @override
  String get taskCategoryHome => 'בית';

  @override
  String get taskCategorySocial => 'חברתי';

  @override
  String get taskCategoryOther => 'אחר';

  @override
  String get tasksTabEmptyTitle => 'אין עדיין משימות!';

  @override
  String get tasksTabEmptySubtitle => 'הקש על כפתור + כדי להוסיף את המשימה הראשונה שלך';

  @override
  String get tasksTabCompletedHeader => 'משימות שהושלמו';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience נ\"נ';
  }

  @override
  String get tasksTabEditTooltip => 'ערוך משימה';

  @override
  String get tasksTabDeleteTooltip => 'מחק משימה';

  @override
  String get tasksTabDeleteConfirmationTitle => 'מחיקת משימה';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'האם אתה בטוח שברצונך למחוק את \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ פעולה זו תסיר $xpAmount נ\"נ מהשחקן שלך!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'ביטול';

  @override
  String get tasksTabDeleteConfirmationDelete => 'מחק';

  @override
  String get tasksTabDueToday => 'היום';

  @override
  String get tasksTabDueTomorrow => 'מחר';

  @override
  String get tasksTabDueYesterday => 'אתמול';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ימים',
      one: 'יום אחד',
    );
    return 'לפני $_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ימים',
      one: 'יום אחד',
    );
    return 'בעוד $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'סוג לוח זמנים';

  @override
  String get scheduleTypeDaily => 'יומי';

  @override
  String get scheduleTypeWeekly => 'שבועי';

  @override
  String get scheduleTypeMonthly => 'חודשי';

  @override
  String get scheduleTypeCustom => 'מרווח מותאם';

  @override
  String get scheduleWeeklyTitle => 'בחר ימים:';

  @override
  String get scheduleMonthlyTitle => 'בחר ימים בחודש:';

  @override
  String get scheduleCustomTitle => 'חזור כל X ימים:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ימים',
      one: 'יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'נא לבחור מרווח';

  @override
  String get weekdayMonday => 'יום ב\'';

  @override
  String get weekdayTuesday => 'יום ג\'';

  @override
  String get weekdayWednesday => 'יום ד\'';

  @override
  String get weekdayThursday => 'יום ה\'';

  @override
  String get weekdayFriday => 'יום ו\'';

  @override
  String get weekdaySaturday => 'שבת';

  @override
  String get weekdaySunday => 'יום א\'';

  @override
  String get resetProgress => 'אפס התקדמות';

  @override
  String get resetConfirmationTitle => 'איפוס';

  @override
  String get resetConfirmationMessage => 'האם אתה בטוח שברצונך לאפס את ההתקדמות שלך? פעולה זו תאפס את ההגדרות, המטרה, הרמה והניסיון, ותקבע את תאריך היצירה להווה. ההרגלים והמשימות שלך לא יושפעו. לא ניתן לבטל פעולה זו.';

  @override
  String get resetSuccess => 'נתוני ההתקדמות אופסו בהצלחה!';
}
