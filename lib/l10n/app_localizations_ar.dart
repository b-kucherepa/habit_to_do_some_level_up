// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'RPG المهام والعادات';

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
  String get delete => 'حذف';

  @override
  String get edit => 'تعديل';

  @override
  String get toNext => 'إلى التالي';

  @override
  String get habitTitle => 'عنوان العادة';

  @override
  String get completeDayHint => 'إكمال اليوم الفائت';

  @override
  String get markCompletedHabitsHint => 'حدد العادات المكتملة لهذا اليوم:';

  @override
  String get skipDayButton => 'تخطي هذا اليوم';

  @override
  String get completeDayButton => 'إكمال اليوم';

  @override
  String get habitDescription => 'الوصف';

  @override
  String get experiencePoints => 'نقاط الخبرة';

  @override
  String get minCompletionCount => 'الحد الأدنى للإنجاز';

  @override
  String get scheduleType => 'نوع الجدول';

  @override
  String get daily => 'يومي';

  @override
  String get weekly => 'أسبوعي';

  @override
  String get monthly => 'شهري';

  @override
  String get custom => 'مخصص';

  @override
  String get selectDays => 'اختر الأيام';

  @override
  String get monday => 'الاثنين';

  @override
  String get tuesday => 'الثلاثاء';

  @override
  String get wednesday => 'الأربعاء';

  @override
  String get thursday => 'الخميس';

  @override
  String get friday => 'الجمعة';

  @override
  String get saturday => 'السبت';

  @override
  String get sunday => 'الأحد';

  @override
  String get player => 'الشخصية';

  @override
  String get habits => 'العادات';

  @override
  String get habitsDone => 'العادات المكتملة';

  @override
  String get tasks => 'المهام';

  @override
  String get tasksDue => 'المهام المستحقة';

  @override
  String get tasksDone => 'المهام المنتهية';

  @override
  String get level => 'المستوى';

  @override
  String habitsNumberToday(Object habitsNumber) {
    return '$habitsNumber اليوم';
  }

  @override
  String get todaysProgress => 'تقدم اليوم';

  @override
  String get experience => 'الخبرة';

  @override
  String get experienceShort => 'خبرة';

  @override
  String get congratulations => 'مبروك!';

  @override
  String levelReached(Object level) {
    return 'وصلت للمستوى $level!';
  }

  @override
  String get continueButton => 'متابعة';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'لا تنس استخدام إنجازاتك لـ $goal!';
  }

  @override
  String expCurveLabel(Object exponent, Object multiplier) {
    return 'أس المنحنى: $exponent, المضاعف: $multiplier';
  }

  @override
  String get goal => 'الهدف';

  @override
  String get defaultGoal => 'اكتسب الخبرة لرحلتك في RPG!';

  @override
  String get progress => 'التقدم';

  @override
  String get progressToLevel => 'التقدم نحو المستوى';

  @override
  String get completed => 'مكتمل';

  @override
  String get pending => 'قيد الانتظار';

  @override
  String get overdue => 'متأخر';

  @override
  String get dueToday => 'مستحق اليوم';

  @override
  String get dueSoon => 'قريب الاستحقاق';

  @override
  String get karma => 'الكارما';

  @override
  String get karmaLevel => 'مستوى الكارما';

  @override
  String get karmaDescription => 'مستوى الكارما يعكس مدى انتظامك.';

  @override
  String get resetProgress => 'إعادة التعيين';

  @override
  String get resetProgressTitle => 'إعادة تعيين التقدم؟';

  @override
  String get resetProgressDescription => 'هذا الإجراء سيعيد تعيين:';

  @override
  String get resetWarningExperience => 'كل خبرة ومستوى الشخصية';

  @override
  String get resetWarningHabits => 'سجل إكمال كل العادات';

  @override
  String get resetWarningKarma => 'مستويات الكارما لكل العادات';

  @override
  String get resetTasksUnaffected => 'المهام لن تتأثر.';

  @override
  String get resetCannotUndone => 'لا يمكن التراجع عن هذا الإجراء!';

  @override
  String get resetCancel => 'إلغاء';

  @override
  String get resetConfirm => 'إعادة تعيين التقدم';

  @override
  String get resetSuccess => 'تم إعادة تعيين التقدم بنجاح!';

  @override
  String get progressSettings => 'إعدادات التقدم';

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
    return 'أس المنحنى: $exponent. القيم <1 تجعل المستويات الأولى أسهل، >1 تجعل المستويات المتقدمة أسهل';
  }

  @override
  String get experienceMultiplier => 'مضاعف الخبرة';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'مضاعف الخبرة: $multiplier. القيم الأعلى تجعل الصعود للمستويات أبطأ';
  }

  @override
  String get levelProgressionPreview => 'معاينة تقدم المستوى:';

  @override
  String levelFormula(Object multiplier, Object exponent) {
    return 'الصيغة: خبرة = $multiplier × (المستوى-1)^$exponent';
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
  String get habitFormMinCompletionError => 'يرجى إدخال الحد الأدنى';

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
  String get habitFormCustomError => 'يرجى اختيار المدة للجدول المخصص';

  @override
  String habitItemExperience(Object experience) {
    return '$experience نقطة خبرة';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'الحد الأدنى $minCompletionCount';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '$currentCount اليوم';
  }

  @override
  String get habitItemNotToday => 'ليس لليوم';

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
    return 'هل أنت متأكد من حذف \"$habitTitle\"؟';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ هذا سيزيل $xpAmount نقطة خبرة من شخصيتك!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'إلغاء';

  @override
  String get habitItemDeleteConfirmationDelete => 'حذف';

  @override
  String get habitsTabEmptyTitle => 'لا توجد عادات بعد!';

  @override
  String get habitsTabEmptySubtitle => 'انقر على + لإضافة أول عادة';

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
  String get taskFormSelectDate => 'اختر تاريخ';

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
  String get taskCategoryOther => 'أخرى';

  @override
  String get tasksTabEmptyTitle => 'لا توجد مهام بعد!';

  @override
  String get tasksTabEmptySubtitle => 'انقر على + لإضافة أول مهمة';

  @override
  String get tasksTabTotal => 'الإجمالي';

  @override
  String get tasksTabPending => 'قيد الانتظار';

  @override
  String get tasksTabDone => 'منتهي';

  @override
  String tasksTabPendingHeader(Object count) {
    return 'المهام قيد الانتظار ($count)';
  }

  @override
  String tasksTabCompletedHeader(Object count) {
    return 'المهام المكتملة ($count)';
  }

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
    return 'هل أنت متأكد من حذف \"$taskTitle\"؟';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ هذا سيزيل $xpAmount نقطة خبرة من شخصيتك!';
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
  String tasksTabDueDaysAgo(Object days) {
    return 'قبل $days يوم';
  }

  @override
  String tasksTabDueInDays(Object days) {
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
  String get scheduleTypeCustom => 'مدة مخصصة';

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
      one: '1 يوم',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'يرجى اختيار المدة';

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
}
