// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AppLocalizationsHy extends AppLocalizations {
  AppLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get appTitle => 'Սովորություն՝ Կյանքը Մակարդակ Բարձրացնելու համար';

  @override
  String get home => 'Գլխավոր';

  @override
  String get settings => 'Կարգավորումներ';

  @override
  String get addHabit => 'Ավելացնել Սովորություն';

  @override
  String get addTask => 'Ավելացնել Առաջադրանք';

  @override
  String get editHabit => 'Փոփոխել Սովորությունը';

  @override
  String get editTask => 'Փոփոխել Առաջադրանքը';

  @override
  String get toNext => 'Դեպի Հաջորդը';

  @override
  String get completeDayHint => 'Կատարել Բաց Թողած Օրը';

  @override
  String get markCompletedHabitsHint => 'Նշել այս օրվա կատարված սովորությունները՝';

  @override
  String get skipDayButton => 'Բաց Թողնել Օրը';

  @override
  String get completeDayButton => 'Ավարտել Օրը';

  @override
  String get scheduleType => 'Ժամանակացույցի Տեսակը';

  @override
  String get habits => 'Սովորություններ';

  @override
  String get habitsDone => 'Կատարված Սովորություններ';

  @override
  String get tasks => 'Առաջադրանքներ';

  @override
  String get tasksDue => 'Պարտադիր Առաջադրանքներ';

  @override
  String get tasksDone => 'Կատարված Առաջադրանքներ';

  @override
  String get level => 'Մակարդակ';

  @override
  String get todaysProgress => 'Այսօրվա Առաջընթացը';

  @override
  String get experienceShort => 'Փ';

  @override
  String get congratulations => 'Շնորհավորում ենք';

  @override
  String levelReached(Object level) {
    return 'Հասել եք $level-րդ մակարդակին';
  }

  @override
  String get continueButton => 'Շարունակել';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Մի մոռացեք օգտագործել ձեր նվաճումները... $goal-ի համար';
  }

  @override
  String get goal => 'Նպատակ';

  @override
  String get defaultGoal => 'Բարձրացրու քո կյանքի մակարդակը';

  @override
  String playerProgressToLevel(Object level) {
    return 'Առաջընթաց դեպի Մակարդակ';
  }

  @override
  String get overdue => 'Հարկադիր հետաձգված';

  @override
  String get goalMotivation => 'Նպատակի Մոտիվացիա';

  @override
  String get goalMotivationHint => 'Ինչի՞ համար եք փորձ ձեռք բերում';

  @override
  String get language => 'Լեզու';

  @override
  String get english => 'Անգլերեն';

  @override
  String get russian => 'Ռուսերեն';

  @override
  String get german => 'Գերմաներեն';

  @override
  String get french => 'Ֆրանսերեն';

  @override
  String get spanish => 'Իսպաներեն';

  @override
  String get portuguese => 'Պորտուգալերեն';

  @override
  String get polish => 'Լեհերեն';

  @override
  String get italian => 'Իտալերեն';

  @override
  String get dutch => 'Հոլանդերեն';

  @override
  String get swedish => 'Շվեդերեն';

  @override
  String get norwegian => 'Նորվեգերեն';

  @override
  String get finnish => 'Ֆիններեն';

  @override
  String get armenian => 'Հայերեն';

  @override
  String get turkish => 'Թուրքերեն';

  @override
  String get chinese => 'Չինարեն';

  @override
  String get japanese => 'Ճապոներեն';

  @override
  String get korean => 'Կորեերեն';

  @override
  String get hindi => 'Հինդի';

  @override
  String get arabic => 'Արաբերեն';

  @override
  String get hebrew => 'Եբրայերեն';

  @override
  String get curveExponent => 'Կորի Արտահայտիչ';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Կորի արտահայտիչ՝ $exponent: Արժեքները <1-ը հեշտացնում են սկզբնական մակարդակները, >1-ը՝ հեշտացնում են ուշ մակարդակները';
  }

  @override
  String get experienceMultiplier => 'Փորձի Բազմապատկիչ';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Փորձի բազմապատկիչ՝ $multiplier: Բարձր արժեքները դանդաղեցնում են մակարդակի բարձրացումը';
  }

  @override
  String get levelProgressionPreview => 'Մակարդակի Առաջընթացի Նախադիտում';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Բանաձև՝ Փորձ = $multiplier × (Մակարդակ-1)^$exponent';
  }

  @override
  String get cancel => 'Չեղարկել';

  @override
  String get save => 'Պահպանել';

  @override
  String get habitFormTitle => 'Սովորության Անվանում';

  @override
  String get habitFormTitleError => 'Խնդրում ենք նշել անվանում';

  @override
  String get habitFormDescription => 'Նկարագրություն';

  @override
  String get habitFormExperience => 'Փորձի Միավորներ';

  @override
  String get habitFormExperienceError => 'Խնդրում ենք նշել փորձ';

  @override
  String get habitFormNumberError => 'Խնդրում ենք նշել վավեր թիվ';

  @override
  String get habitFormMinCompletion => 'Նվազագույն Կատարում';

  @override
  String get habitFormMinCompletionError => 'Խնդրում ենք նշել նվազագույն քանակ';

  @override
  String get habitFormMinCountError => 'Առնվազն 1';

  @override
  String get habitFormUpdate => 'Թարմացնել Սովորությունը';

  @override
  String get habitFormSave => 'Պահպանել Սովորությունը';

  @override
  String get habitFormWeeklyError => 'Խնդրում ենք ընտրել առնվազն մեկ օր շաբաթական ժամանակացույցի համար';

  @override
  String get habitFormMonthlyError => 'Խնդրում ենք ընտրել առնվազն մեկ օր ամսական ժամանակացույցի համար';

  @override
  String get habitFormCustomError => 'Խնդրում ենք ընտրել միջակայք հատուկ ժամանակացույցի համար';

  @override
  String habitItemExperience(Object experience) {
    return '$experience Փ';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'նվազ. $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '$karma անընդմեջ';
  }

  @override
  String get habitItemEditTooltip => 'Փոփոխել սովորությունը';

  @override
  String get habitItemDeleteTooltip => 'Ջնջել սովորությունը';

  @override
  String get habitItemScheduleDaily => 'օրեկան';

  @override
  String get habitItemScheduleWeekly => 'շաբաթական';

  @override
  String get habitItemScheduleMonthly => 'ամսական';

  @override
  String get habitItemScheduleCustom => 'հատուկ';

  @override
  String get habitItemDeleteConfirmationTitle => 'Ջնջել Սովորությունը';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Համոզված ե՞ք, որ ցանկանում եք ջնջել \"$habitTitle\"-ը';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Սա կհեռացնի $xpAmount Փորձ ձեր խաղացողից';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Չեղարկել';

  @override
  String get habitItemDeleteConfirmationDelete => 'Ջնջել';

  @override
  String get habitsTabEmptyTitle => 'Դեռ սովորություններ չկան';

  @override
  String get habitsTabEmptySubtitle => 'Սեղմեք + կոճակը ձեր առաջին սովորությունը ավելացնելու համար';

  @override
  String get taskFormTitle => 'Առաջադրանքի Անվանում';

  @override
  String get taskFormTitleError => 'Խնդրում ենք նշել անվանում';

  @override
  String get taskFormDescription => 'Նկարագրություն';

  @override
  String get taskFormExperience => 'Փորձի Միավորներ';

  @override
  String get taskFormExperienceError => 'Խնդրում ենք նշել փորձ';

  @override
  String get taskFormNumberError => 'Խնդրում ենք նշել վավեր թիվ';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Վերջնաժամկետ՝ $date';
  }

  @override
  String get taskFormSelectDate => 'Ընտրել Ամսաթիվ';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Առաջնահերթություն՝ $priority';
  }

  @override
  String get taskFormCategory => 'Կատեգորիա';

  @override
  String get taskFormUpdate => 'Թարմացնել Առաջադրանքը';

  @override
  String get taskFormSave => 'Պահպանել Առաջադրանքը';

  @override
  String get taskCategoryWork => 'Աշխատանք';

  @override
  String get taskCategoryPersonal => 'Անձնական';

  @override
  String get taskCategoryHealth => 'Առողջություն';

  @override
  String get taskCategoryLearning => 'Ուսուցում';

  @override
  String get taskCategoryGeneral => 'Ընդհանուր';

  @override
  String get taskCategoryHome => 'Տուն';

  @override
  String get taskCategorySocial => 'Հասարակական';

  @override
  String get taskCategoryOther => 'Այլ';

  @override
  String get tasksTabEmptyTitle => 'Դեռ առաջադրանքներ չկան';

  @override
  String get tasksTabEmptySubtitle => 'Սեղմեք + կոճակը ձեր առաջին առաջադրանքը ավելացնելու համար';

  @override
  String get tasksTabCompletedHeader => 'Կատարված Առաջադրանքներ';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience Փ';
  }

  @override
  String get tasksTabEditTooltip => 'Փոփոխել առաջադրանքը';

  @override
  String get tasksTabDeleteTooltip => 'Ջնջել առաջադրանքը';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Ջնջել Առաջադրանքը';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Համոզված ե՞ք, որ ցանկանում եք ջնջել \"$taskTitle\"-ը';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Սա կհեռացնի $xpAmount Փորձ ձեր խաղացողից';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Չեղարկել';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Ջնջել';

  @override
  String get tasksTabDueToday => 'Այսօր';

  @override
  String get tasksTabDueTomorrow => 'Վաղը';

  @override
  String get tasksTabDueYesterday => 'Երեկ';

  @override
  String tasksTabDueDaysAgo(num days) {
    return '$days օր առաջ';
  }

  @override
  String tasksTabDueInDays(num days) {
    return '$days օրից';
  }

  @override
  String get scheduleSelectorTitle => 'Ժամանակացույցի Տեսակը';

  @override
  String get scheduleTypeDaily => 'Օրեկան';

  @override
  String get scheduleTypeWeekly => 'Շաբաթական';

  @override
  String get scheduleTypeMonthly => 'Ամսական';

  @override
  String get scheduleTypeCustom => 'Հատուկ Միջակայք';

  @override
  String get scheduleWeeklyTitle => 'Ընտրեք օրերը.';

  @override
  String get scheduleMonthlyTitle => 'Ընտրեք ամսվա օրերը.';

  @override
  String get scheduleCustomTitle => 'Կրկնել ամեն X օրը.';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days օր',
      one: '1 օր',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Խնդրում ենք ընտրել միջակայք';

  @override
  String get weekdayMonday => 'Երկ';

  @override
  String get weekdayTuesday => 'Երք';

  @override
  String get weekdayWednesday => 'Չոր';

  @override
  String get weekdayThursday => 'Հինգ';

  @override
  String get weekdayFriday => 'Ուրբ';

  @override
  String get weekdaySaturday => 'Շաբ';

  @override
  String get weekdaySunday => 'Կիր';

  @override
  String get resetProgress => 'Վերականգնել Առաջընթացը';

  @override
  String get resetConfirmationTitle => 'Վերականգնել';

  @override
  String get resetConfirmationMessage => 'Համոզված ե՞ք, որ ցանկանում եք վերականգնել ձեր առաջընթացը: Սա կվերականգնի կարգավորումները, նպատակը, մակարդակը և փորձը, և կստեղծի ստեղծման ամսաթիվը: Ձեր սովորություններն ու առաջադրանքները, սակայն, չեն տուժի: Այս գործողությունը չի կարող չեղարկվել:';

  @override
  String get resetSuccess => 'Առաջընթացի տվյալները հաջողությամբ վերականգնվել են';
}
