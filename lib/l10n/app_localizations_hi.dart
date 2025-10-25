// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'आदत से स्तर ऊपर!';

  @override
  String get home => 'होम';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get addHabit => 'आदत जोड़ें';

  @override
  String get addTask => 'कार्य जोड़ें';

  @override
  String get editHabit => 'आदत संपादित करें';

  @override
  String get editTask => 'कार्य संपादित करें';

  @override
  String get toNext => 'अगले तक';

  @override
  String get completeDayHint => 'छूटा हुआ दिन पूरा करें';

  @override
  String get markCompletedHabitsHint => 'इस दिन के लिए पूरी की गई आदतों को चिह्नित करें:';

  @override
  String get skipDayButton => 'इस दिन को छोड़ें';

  @override
  String get completeDayButton => 'दिन पूरा करें';

  @override
  String get scheduleType => 'अनुसूची प्रकार';

  @override
  String get habits => 'आदतें';

  @override
  String get habitsDone => 'आदतें पूरी';

  @override
  String get tasks => 'कार्य';

  @override
  String get tasksDue => 'कार्य बाकी';

  @override
  String get tasksDone => 'कार्य पूरे';

  @override
  String get level => 'स्तर';

  @override
  String get todaysProgress => 'आज की प्रगति';

  @override
  String get experienceShort => 'एक्सपी';

  @override
  String get congratulations => 'बधाई हो!';

  @override
  String levelReached(Object level) {
    return 'स्तर $level प्राप्त!';
  }

  @override
  String get continueButton => 'जारी रखें';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'अपनी उपलब्धियों का उपयोग करना न भूलें... $goal!';
  }

  @override
  String get goal => 'लक्ष्य';

  @override
  String get defaultGoal => 'अपनी जिंदगी का स्तर ऊपर करो!';

  @override
  String playerProgressToLevel(Object level) {
    return 'स्तर तक प्रगति';
  }

  @override
  String get overdue => 'विलंबित';

  @override
  String get goalMotivation => 'लक्ष्य प्रेरणा';

  @override
  String get goalMotivationHint => 'आप अनुभव किसके लिए जमा कर रहे हैं?';

  @override
  String get language => 'भाषा';

  @override
  String get english => 'अंग्रेज़ी';

  @override
  String get russian => 'रूसी';

  @override
  String get german => 'जर्मन';

  @override
  String get french => 'फ्रेंच';

  @override
  String get spanish => 'स्पेनिश';

  @override
  String get portuguese => 'पुर्तगाली';

  @override
  String get polish => 'पोलिश';

  @override
  String get italian => 'इतालवी';

  @override
  String get dutch => 'डच';

  @override
  String get swedish => 'स्वीडिश';

  @override
  String get norwegian => 'नॉर्वेजियन';

  @override
  String get finnish => 'फिनिश';

  @override
  String get armenian => 'आर्मेनियाई';

  @override
  String get turkish => 'तुर्की';

  @override
  String get chinese => 'चीनी';

  @override
  String get japanese => 'जापानी';

  @override
  String get korean => 'कोरियाई';

  @override
  String get hindi => 'हिंदी';

  @override
  String get arabic => 'अरबी';

  @override
  String get hebrew => 'हिब्रू';

  @override
  String get curveExponent => 'वक्र घातांक';

  @override
  String curveExponentDescription(Object exponent) {
    return 'वक्र घातांक: $exponent. 1 से कम मान शुरुआती स्तरों को आसान बनाते हैं, 1 से अधिक मान बाद के स्तरों को आसान बनाते हैं';
  }

  @override
  String get experienceMultiplier => 'अनुभव गुणक';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'अनुभव गुणक: $multiplier. उच्च मान स्तर बढ़ाना धीमा करते हैं';
  }

  @override
  String get levelProgressionPreview => 'स्तर प्रगति पूर्वावलोकन:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'सूत्र: EXP = $multiplier × (स्तर-1)^$exponent';
  }

  @override
  String get cancel => 'रद्द करें';

  @override
  String get save => 'सेव करें';

  @override
  String get habitFormTitle => 'आदत का शीर्षक';

  @override
  String get habitFormTitleError => 'कृपया एक शीर्षक दर्ज करें';

  @override
  String get habitFormDescription => 'विवरण';

  @override
  String get habitFormExperience => 'अनुभव अंक';

  @override
  String get habitFormExperienceError => 'कृपया अनुभव दर्ज करें';

  @override
  String get habitFormNumberError => 'कृपया एक वैध संख्या दर्ज करें';

  @override
  String get habitFormMinCompletion => 'न्यूनतम पूर्णता';

  @override
  String get habitFormMinCompletionError => 'कृपया न्यूनतम संख्या दर्ज करें';

  @override
  String get habitFormMinCountError => 'कम से कम 1';

  @override
  String get habitFormUpdate => 'आदत अपडेट करें';

  @override
  String get habitFormSave => 'आदत सेव करें';

  @override
  String get habitFormWeeklyError => 'कृपया साप्ताहिक अनुसूची के लिए कम से कम एक दिन चुनें';

  @override
  String get habitFormMonthlyError => 'कृपया मासिक अनुसूची के लिए कम से कम एक दिन चुनें';

  @override
  String get habitFormCustomError => 'कृपया कस्टम अनुसूची के लिए अंतराल चुनें';

  @override
  String habitItemExperience(Object experience) {
    return '$experience एक्सपी';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'न्यून. $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '$karma स्ट्रीक';
  }

  @override
  String get habitItemEditTooltip => 'आदत संपादित करें';

  @override
  String get habitItemDeleteTooltip => 'आदत हटाएं';

  @override
  String get habitItemScheduleDaily => 'दैनिक';

  @override
  String get habitItemScheduleWeekly => 'साप्ताहिक';

  @override
  String get habitItemScheduleMonthly => 'मासिक';

  @override
  String get habitItemScheduleCustom => 'कस्टम';

  @override
  String get habitItemDeleteConfirmationTitle => 'आदत हटाएं';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'क्या आप वाकई \"$habitTitle\" हटाना चाहते हैं?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ इससे आपके प्लेयर से $xpAmount एक्सपी हट जाएगी!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'रद्द करें';

  @override
  String get habitItemDeleteConfirmationDelete => 'हटाएं';

  @override
  String get habitsTabEmptyTitle => 'अभी तक कोई आदत नहीं!';

  @override
  String get habitsTabEmptySubtitle => 'अपनी पहली आदत जोड़ने के लिए + बटन दबाएं';

  @override
  String get taskFormTitle => 'कार्य का शीर्षक';

  @override
  String get taskFormTitleError => 'कृपया एक शीर्षक दर्ज करें';

  @override
  String get taskFormDescription => 'विवरण';

  @override
  String get taskFormExperience => 'अनुभव अंक';

  @override
  String get taskFormExperienceError => 'कृपया अनुभव दर्ज करें';

  @override
  String get taskFormNumberError => 'कृपया एक वैध संख्या दर्ज करें';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'नियत तारीख: $date';
  }

  @override
  String get taskFormSelectDate => 'तारीख चुनें';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'प्राथमिकता: $priority';
  }

  @override
  String get taskFormCategory => 'श्रेणी';

  @override
  String get taskFormUpdate => 'कार्य अपडेट करें';

  @override
  String get taskFormSave => 'कार्य सेव करें';

  @override
  String get taskCategoryWork => 'काम';

  @override
  String get taskCategoryPersonal => 'निजी';

  @override
  String get taskCategoryHealth => 'स्वास्थ्य';

  @override
  String get taskCategoryLearning => 'सीखना';

  @override
  String get taskCategoryGeneral => 'सामान्य';

  @override
  String get taskCategoryHome => 'घर';

  @override
  String get taskCategorySocial => 'सामाजिक';

  @override
  String get taskCategoryOther => 'अन्य';

  @override
  String get tasksTabEmptyTitle => 'अभी तक कोई कार्य नहीं!';

  @override
  String get tasksTabEmptySubtitle => 'अपना पहला कार्य जोड़ने के लिए + बटन दबाएं';

  @override
  String get tasksTabCompletedHeader => 'पूर्ण कार्य';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience एक्सपी';
  }

  @override
  String get tasksTabEditTooltip => 'कार्य संपादित करें';

  @override
  String get tasksTabDeleteTooltip => 'कार्य हटाएं';

  @override
  String get tasksTabDeleteConfirmationTitle => 'कार्य हटाएं';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'क्या आप वाकई \"$taskTitle\" हटाना चाहते हैं?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ इससे आपके प्लेयर से $xpAmount एक्सपी हट जाएगी!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'रद्द करें';

  @override
  String get tasksTabDeleteConfirmationDelete => 'हटाएं';

  @override
  String get tasksTabDueToday => 'आज';

  @override
  String get tasksTabDueTomorrow => 'कल';

  @override
  String get tasksTabDueYesterday => 'कल';

  @override
  String tasksTabDueDaysAgo(num days) {
    return '$days दिन पहले';
  }

  @override
  String tasksTabDueInDays(num days) {
    return '$days दिन में';
  }

  @override
  String get scheduleSelectorTitle => 'अनुसूची प्रकार';

  @override
  String get scheduleTypeDaily => 'दैनिक';

  @override
  String get scheduleTypeWeekly => 'साप्ताहिक';

  @override
  String get scheduleTypeMonthly => 'मासिक';

  @override
  String get scheduleTypeCustom => 'कस्टम अंतराल';

  @override
  String get scheduleWeeklyTitle => 'दिन चुनें:';

  @override
  String get scheduleMonthlyTitle => 'महीने के दिन चुनें:';

  @override
  String get scheduleCustomTitle => 'हर X दिनों में दोहराएं:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन',
      one: '1 दिन',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'कृपया अंतराल चुनें';

  @override
  String get weekdayMonday => 'सोम';

  @override
  String get weekdayTuesday => 'मंगल';

  @override
  String get weekdayWednesday => 'बुध';

  @override
  String get weekdayThursday => 'गुरु';

  @override
  String get weekdayFriday => 'शुक्र';

  @override
  String get weekdaySaturday => 'शनि';

  @override
  String get weekdaySunday => 'रवि';

  @override
  String get resetProgress => 'प्रगति रीसेट करें';

  @override
  String get resetConfirmationTitle => 'रीसेट';

  @override
  String get resetConfirmationMessage => 'क्या आप वाकई अपनी प्रगति रीसेट करना चाहते हैं? इससे सेटिंग्स, लक्ष्य, स्तर और अनुभव रीसेट हो जाएंगे और निर्माण तिथि अब सेट हो जाएगी। हालांकि, आपकी आदतें और कार्य प्रभावित नहीं होंगे। इस कार्रवाई को पूर्ववत नहीं किया जा सकता।';

  @override
  String get resetSuccess => 'प्रगति डेटा सफलतापूर्वक रीसेट कर दिया गया है!';
}
