// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'عادة للقيام ببعض المستويات المتقدمة!';

  @override
  String get home => 'الرئيسية';

  @override
  String get settings => 'الإعدادات';

  @override
  String get addHabit => 'إضافة عادة';

  @override
  String get addTask => 'إضافة مهمة';

  @override
  String get editHabit => 'تعديل العادة';

  @override
  String get editTask => 'تعديل المهمة';

  @override
  String get toNext => 'إلى التالي';

  @override
  String get completeDayHint => 'إكمال اليوم الفائت';

  @override
  String get markCompletedHabitsHint => 'ضع علامة على العادات المكتملة لهذا اليوم:';

  @override
  String get skipDayButton => 'تخطي هذا اليوم';

  @override
  String get completeDayButton => 'إكمال اليوم';

  @override
  String get scheduleType => 'نوع الجدول';

  @override
  String get habits => 'العادات';

  @override
  String get habitsDone => 'العادات المكتملة';

  @override
  String get tasks => 'المهام';

  @override
  String get tasksDue => 'المهام المستحقة';

  @override
  String get tasksDone => 'المهام المكتملة';

  @override
  String get level => 'المستوى';

  @override
  String get todaysProgress => 'تقدم اليوم';

  @override
  String get experienceShort => 'خبرة';

  @override
  String get congratulations => 'مبروك!';

  @override
  String levelReached(Object level) {
    return 'لقد وصلت إلى المستوى $level!';
  }

  @override
  String get continueButton => 'متابعة';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'لا تنس استخدام إنجازاتك لـ... $goal!';
  }

  @override
  String get goal => 'الهدف';

  @override
  String get defaultGoal => 'تطوير مستوى حياتك!';

  @override
  String playerProgressToLevel(Object level) {
    return 'التقدم نحو المستوى';
  }

  @override
  String get overdue => 'متأخر';

  @override
  String get goalMotivation => 'الدافع الهدف';

  @override
  String get goalMotivationHint => 'لماذا تكتسب الخبرة؟';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get russian => 'الروسية';

  @override
  String get german => 'الألمانية';

  @override
  String get french => 'الفرنسية';

  @override
  String get spanish => 'الإسبانية';

  @override
  String get portuguese => 'البرتغالية';

  @override
  String get polish => 'البولندية';

  @override
  String get italian => 'الإيطالية';

  @override
  String get dutch => 'الهولندية';

  @override
  String get swedish => 'السويدية';

  @override
  String get norwegian => 'النرويجية';

  @override
  String get finnish => 'الفنلندية';

  @override
  String get armenian => 'الأرمينية';

  @override
  String get turkish => 'التركية';

  @override
  String get chinese => 'الصينية';

  @override
  String get japanese => 'اليابانية';

  @override
  String get korean => 'الكورية';

  @override
  String get hindi => 'الهندية';

  @override
  String get arabic => 'العربية';

  @override
  String get hebrew => 'العبرية';

  @override
  String get curveExponent => 'أس المنحنى';

  @override
  String curveExponentDescription(Object exponent) {
    return 'أس المنحنى: $exponent. القيم <1 تجعل المستويات الأولى أسهل، والقيم >1 تجعل المستويات اللاحقة أسهل';
  }

  @override
  String get experienceMultiplier => 'مضاعف الخبرة';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'مضاعف الخبرة: $multiplier. القيم الأعلى تجعل التقدم في المستويات أبطأ';
  }

  @override
  String get levelProgressionPreview => 'معاينة تقدم المستوى:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'الصيغة: الخبرة = $multiplier × (المستوى-1)^$exponent';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get habitFormTitle => 'عنوان العادة';

  @override
  String get habitFormTitleError => 'يرجى إدخال عنوان';

  @override
  String get habitFormDescription => 'الوصف';

  @override
  String get habitFormExperience => 'نقاط الخبرة';

  @override
  String get habitFormExperienceError => 'يرجى إدخال الخبرة';

  @override
  String get habitFormNumberError => 'يرجى إدخال رقم صحيح';

  @override
  String get habitFormMinCompletion => 'الحد الأدنى للإكمال';

  @override
  String get habitFormMinCompletionError => 'يرجى إدخال الحد الأدنى للعدد';

  @override
  String get habitFormMinCountError => 'على الأقل 1';

  @override
  String get habitFormUpdate => 'تحديث العادة';

  @override
  String get habitFormSave => 'حفظ العادة';

  @override
  String get habitFormWeeklyError => 'يرجى اختيار يوم واحد على الأقل للجدول الأسبوعي';

  @override
  String get habitFormMonthlyError => 'يرجى اختيار يوم واحد على الأقل للجدول الشهري';

  @override
  String get habitFormCustomError => 'يرجى اختيار الفترة للجدول المخصص';

  @override
  String habitItemExperience(Object experience) {
    return '$experience نقطة خبرة';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'الحد الأدنى $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return 'سلسلة $karma';
  }

  @override
  String get habitItemEditTooltip => 'تعديل العادة';

  @override
  String get habitItemDeleteTooltip => 'حذف العادة';

  @override
  String get habitItemScheduleDaily => 'يومي';

  @override
  String get habitItemScheduleWeekly => 'أسبوعي';

  @override
  String get habitItemScheduleMonthly => 'شهري';

  @override
  String get habitItemScheduleCustom => 'مخصص';

  @override
  String get habitItemDeleteConfirmationTitle => 'حذف العادة';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'هل أنت متأكد من رغبتك في حذف \"$habitTitle\"؟';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ هذا سيزيل $xpAmount نقطة خبرة من لاعبك!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'إلغاء';

  @override
  String get habitItemDeleteConfirmationDelete => 'حذف';

  @override
  String get habitsTabEmptyTitle => 'لا توجد عادات بعد!';

  @override
  String get habitsTabEmptySubtitle => 'انقر على زر + لإضافة عادتك الأولى';

  @override
  String get habitsTabOnOtherDaysHeader => 'On other days';

  @override
  String get taskFormTitle => 'عنوان المهمة';

  @override
  String get taskFormTitleError => 'يرجى إدخال عنوان';

  @override
  String get taskFormDescription => 'الوصف';

  @override
  String get taskFormExperience => 'نقاط الخبرة';

  @override
  String get taskFormExperienceError => 'يرجى إدخال الخبرة';

  @override
  String get taskFormNumberError => 'يرجى إدخال رقم صحيح';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'تاريخ الاستحقاق: $date';
  }

  @override
  String get taskFormSelectDate => 'اختر التاريخ';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'الأولوية: $priority';
  }

  @override
  String get taskFormCategory => 'الفئة';

  @override
  String get taskFormUpdate => 'تحديث المهمة';

  @override
  String get taskFormSave => 'حفظ المهمة';

  @override
  String get taskCategoryWork => 'عمل';

  @override
  String get taskCategoryPersonal => 'شخصي';

  @override
  String get taskCategoryHealth => 'صحة';

  @override
  String get taskCategoryLearning => 'تعلم';

  @override
  String get taskCategoryHome => 'منزل';

  @override
  String get taskCategorySocial => 'اجتماعي';

  @override
  String get taskCategoryOther => 'أخرى';

  @override
  String get tasksTabEmptyTitle => 'لا توجد مهام بعد!';

  @override
  String get tasksTabEmptySubtitle => 'انقر على زر + لإضافة مهمتك الأولى';

  @override
  String get tasksTabCompletedHeader => 'المهام المكتملة';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience نقطة خبرة';
  }

  @override
  String get tasksTabEditTooltip => 'تعديل المهمة';

  @override
  String get tasksTabDeleteTooltip => 'حذف المهمة';

  @override
  String get tasksTabDeleteConfirmationTitle => 'حذف المهمة';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'هل أنت متأكد من رغبتك في حذف \"$taskTitle\"؟';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ هذا سيزيل $xpAmount نقطة خبرة من لاعبك!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'إلغاء';

  @override
  String get tasksTabDeleteConfirmationDelete => 'حذف';

  @override
  String get tasksTabDueToday => 'اليوم';

  @override
  String get tasksTabDueTomorrow => 'غداً';

  @override
  String get tasksTabDueYesterday => 'أمس';

  @override
  String tasksTabDueDaysAgo(num days) {
    return 'قبل $days يوم';
  }

  @override
  String tasksTabDueInDays(num days) {
    return 'خلال $days يوم';
  }

  @override
  String get scheduleSelectorTitle => 'نوع الجدول';

  @override
  String get scheduleTypeDaily => 'يومي';

  @override
  String get scheduleTypeWeekly => 'أسبوعي';

  @override
  String get scheduleTypeMonthly => 'شهري';

  @override
  String get scheduleTypeCustom => 'فترة مخصصة';

  @override
  String get scheduleWeeklyTitle => 'اختر الأيام:';

  @override
  String get scheduleMonthlyTitle => 'اختر أيام الشهر:';

  @override
  String get scheduleCustomTitle => 'كرر كل X يوم:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days يوم',
      many: '$days يوماً',
      few: '$days أيام',
      two: 'يومان',
      one: '1 يوم',
      zero: '0 يوم',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'يرجى اختيار الفترة';

  @override
  String get weekdayMonday => 'الاثنين';

  @override
  String get weekdayTuesday => 'الثلاثاء';

  @override
  String get weekdayWednesday => 'الأربعاء';

  @override
  String get weekdayThursday => 'الخميس';

  @override
  String get weekdayFriday => 'الجمعة';

  @override
  String get weekdaySaturday => 'السبت';

  @override
  String get weekdaySunday => 'الأحد';

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
  String get resetProgress => 'إعادة تعيين التقدم';

  @override
  String get resetConfirmationTitle => 'إعادة تعيين';

  @override
  String get resetConfirmationMessage => 'هل أنت متأكد من رغبتك في إعادة تعيين تقدمك؟ هذا سيعيد تعيين الإعدادات، الهدف، المستوى والخبرة وسيحول تاريخ الإنشاء إلى الآن. عاداتك ومهامك لن تتأثر. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get resetSuccess => 'تم إعادة تعيين بيانات التقدم بنجاح!';
}
