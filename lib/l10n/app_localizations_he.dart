// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'הרגל לעשות כדי להתקדם!';

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
  String get toNext => 'להבא';

  @override
  String get completeDayHint => 'השלם יום שהוחמצה';

  @override
  String get markCompletedHabitsHint => 'סמן הרגלים שהושלמו ליום זה:';

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
  String habitsNumberToday(Object habitsNumber) {
    return '$habitsNumber היום';
  }

  @override
  String get tasks => 'משימות';

  @override
  String get tasksDue => 'משימות שצריך להשלים';

  @override
  String get tasksDone => 'משימות שהושלמו';

  @override
  String get level => 'דרגה';

  @override
  String get todaysProgress => 'התקדמות היום';

  @override
  String get experienceShort => 'נקנ';

  @override
  String get congratulations => 'מזל טוב!';

  @override
  String levelReached(Object level) {
    return 'הגעת לדרגה $level!';
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
  String get defaultGoal => 'התקדם בחיים שלך!';

  @override
  String get progress => 'התקדמות';

  @override
  String get progressToLevel => 'התקדמות לדרגה';

  @override
  String get completed => 'הושלם';

  @override
  String get overdue => 'באיחור';

  @override
  String get karma => 'קארמה';

  @override
  String get karmaLevel => 'דרגת קארמה';

  @override
  String get karmaDescription => 'דרגת הקארמה של ההרגל משקפת את העקביות שלך.';

  @override
  String get resetProgress => 'אפס התקדמות';

  @override
  String get resetProgressTitle => 'לאפס התקדמות?';

  @override
  String get resetProgressDescription => 'פעולה זו תאפס לצמיתות:';

  @override
  String get resetWarningExperience => 'כל הניסיון והדרגה של השחקן';

  @override
  String get resetWarningHabits => 'היסטוריית ההשלמה של כל ההרגלים';

  @override
  String get resetWarningKarma => 'דרגות הקארמה של כל ההרגלים';

  @override
  String get resetTasksUnaffected => 'משימות לא יושפעו.';

  @override
  String get resetCannotUndone => 'לא ניתן לבטל פעולה זו!';

  @override
  String get resetCancel => 'ביטול';

  @override
  String get resetConfirm => 'אפס התקדמות';

  @override
  String get resetSuccess => 'ההתקדמות אופסה בהצלחה!';

  @override
  String get progressSettings => 'הגדרות';

  @override
  String get goalMotivation => 'מוטיבציה למטרה';

  @override
  String get goalMotivationHint => 'למה אתה צובר ניסיון?';

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
    return 'מעריך עקומה: $exponent. ערכים <1 מקלים על דרגות ראשונות, >1 מקלים על דרגות מתקדמות';
  }

  @override
  String get experienceMultiplier => 'מכפיל ניסיון';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'מכפיל ניסיון: $multiplier. ערכים גבוהים יותר מאטים את העלייה בדרגה';
  }

  @override
  String get levelProgressionPreview => 'תצוגה מקדימה של התקדמות הדרגות:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'נוסחה: נק\"נ = $multiplier × (דרגה-1)^$exponent';
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
  String get habitFormMinCompletion => 'מינימושלמות';

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
    return '$experience נק\"נ';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'מינימום $minCompletionCount';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '$currentCount היום';
  }

  @override
  String get habitItemNotToday => 'לא היום';

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
  String get habitItemDeleteConfirmationTitle => 'מחק הרגל';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'האם אתה בטוח שברצונך למחוק \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ פעולה זו תסיר $xpAmount נק\"נ מהשחקן שלך!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'ביטול';

  @override
  String get habitItemDeleteConfirmationDelete => 'מחק';

  @override
  String get habitsTabEmptyTitle => 'אין עדיין הרגלים!';

  @override
  String get habitsTabEmptySubtitle => 'הקש על + כדי להוסיף את ההרגל הראשון שלך';

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
  String get taskCategoryGeneral => 'כללי';

  @override
  String get taskCategoryHove => 'בית';

  @override
  String get taskCategorySocial => 'חברתי';

  @override
  String get taskCategoryOther => 'אחר';

  @override
  String get tasksTabEmptyTitle => 'אין עדיין משימות!';

  @override
  String get tasksTabEmptySubtitle => 'הקש על + כדי להוסיף את המשימה הראשונה שלך';

  @override
  String get tasksTabTotal => 'סה\"כ';

  @override
  String get tasksTabPending => 'ממתינות';

  @override
  String get tasksTabDone => 'הושלמו';

  @override
  String tasksTabPendingHeader(Object count) {
    return 'משימות ממתינות ($count)';
  }

  @override
  String get tasksTabCompletedHeader => 'משימות שהושלמו';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience נק\"נ';
  }

  @override
  String get tasksTabEditTooltip => 'ערוך משימה';

  @override
  String get tasksTabDeleteTooltip => 'מחק משימה';

  @override
  String get tasksTabDeleteConfirmationTitle => 'מחק משימה';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'האם אתה בטוח שברצונך למחוק \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ פעולה זו תסיר $xpAmount נק\"נ מהשחקן שלך!';
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
    return 'לפני $days ימים';
  }

  @override
  String tasksTabDueInDays(num days) {
    return 'בעוד $days ימים';
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
      one: 'יום 1',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'נא לבחור מרווח';

  @override
  String get weekdayMonday => 'ב\'';

  @override
  String get weekdayTuesday => 'ג\'';

  @override
  String get weekdayWednesday => 'ד\'';

  @override
  String get weekdayThursday => 'ה\'';

  @override
  String get weekdayFriday => 'ו\'';

  @override
  String get weekdaySaturday => 'ש\'';

  @override
  String get weekdaySunday => 'א\'';
}
