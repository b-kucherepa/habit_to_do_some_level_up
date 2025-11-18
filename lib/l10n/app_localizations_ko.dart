// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '습관으로 레벨업!';

  @override
  String get home => '홈';

  @override
  String get settings => '설정';

  @override
  String get addHabit => '습관 추가';

  @override
  String get addTask => '할일 추가';

  @override
  String get editHabit => '습관 수정';

  @override
  String get editTask => '할일 수정';

  @override
  String get toNext => '다음으로';

  @override
  String get completeDayHint => '놓친 날 완료하기';

  @override
  String get markCompletedHabitsHint => '이날 완료한 습관 표시:';

  @override
  String get skipDayButton => '이날 건너뛰기';

  @override
  String get completeDayButton => '날짜 완료';

  @override
  String get scheduleType => '반복 유형';

  @override
  String get habits => '습관';

  @override
  String get habitsDone => '완료한 습관';

  @override
  String get tasks => '할일';

  @override
  String get tasksDue => '마감할일';

  @override
  String get tasksDone => '완료한 할일';

  @override
  String get level => '레벨';

  @override
  String get todaysProgress => '오늘의 진행도';

  @override
  String get experienceShort => '경험치';

  @override
  String get congratulations => '축하합니다!';

  @override
  String levelReached(Object level) {
    return '레벨 $level 달성!';
  }

  @override
  String get continueButton => '계속하기';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return '달성한 내용을 활용하는 것을 잊지 마세요... $goal!';
  }

  @override
  String get goal => '목표';

  @override
  String get defaultGoal => '인생을 레벨업하세요!';

  @override
  String playerProgressToLevel(Object level) {
    return '레벨 $level까지 진행도';
  }

  @override
  String get overdue => '기한 초과';

  @override
  String get goalMotivation => '목표 동기부여';

  @override
  String get goalMotivationHint => '경험치를 모아서 무엇을 이루고 싶나요?';

  @override
  String get language => '언어';

  @override
  String get english => '영어';

  @override
  String get russian => '러시아어';

  @override
  String get german => '독일어';

  @override
  String get french => '프랑스어';

  @override
  String get spanish => '스페인어';

  @override
  String get portuguese => '포르투갈어';

  @override
  String get polish => '폴란드어';

  @override
  String get italian => '이탈리아어';

  @override
  String get dutch => '네덜란드어';

  @override
  String get swedish => '스웨덴어';

  @override
  String get norwegian => '노르웨이어';

  @override
  String get finnish => '핀란드어';

  @override
  String get armenian => '아르메니아어';

  @override
  String get turkish => '터키어';

  @override
  String get chinese => '중국어';

  @override
  String get japanese => '일본어';

  @override
  String get korean => '한국어';

  @override
  String get hindi => '힌디어';

  @override
  String get arabic => '아랍어';

  @override
  String get hebrew => '히브리어';

  @override
  String get curveExponent => '곡선 지수';

  @override
  String curveExponentDescription(Object exponent) {
    return '곡선 지수: $exponent. 1보다 작으면 초기 레벨이 쉬워지고, 1보다 크면 후기 레벨이 쉬워집니다';
  }

  @override
  String get experienceMultiplier => '경험치 배수';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return '경험치 배수: $multiplier. 값이 높을수록 레벨업이 느려집니다';
  }

  @override
  String get levelProgressionPreview => '레벨 진행 미리보기:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return '공식: 경험치 = $multiplier × (레벨-1)^$exponent';
  }

  @override
  String get cancel => '취소';

  @override
  String get save => '저장';

  @override
  String get habitFormTitle => '습관 제목';

  @override
  String get habitFormTitleError => '제목을 입력해주세요';

  @override
  String get habitFormDescription => '설명';

  @override
  String get habitFormExperience => '경험치 포인트';

  @override
  String get habitFormExperienceError => '경험치를 입력해주세요';

  @override
  String get habitFormNumberError => '유효한 숫자를 입력해주세요';

  @override
  String get habitFormMinCompletion => '최소 완료 횟수';

  @override
  String get habitFormMinCompletionError => '최소 횟수를 입력해주세요';

  @override
  String get habitFormMinCountError => '최소 1 이상';

  @override
  String get habitFormUpdate => '습관 수정';

  @override
  String get habitFormSave => '습관 저장';

  @override
  String get habitFormWeeklyError => '주간 반복일 경우 최소 하나 이상의 요일을 선택해주세요';

  @override
  String get habitFormMonthlyError => '월간 반복일 경우 최소 하나 이상의 날짜를 선택해주세요';

  @override
  String get habitFormCustomError => '사용자 지정 반복일 경우 간격을 선택해주세요';

  @override
  String habitItemExperience(Object experience) {
    return '경험치 $experience';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return '최소 $minCompletionCount회';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '연속 $karma회';
  }

  @override
  String get habitItemEditTooltip => '습관 수정';

  @override
  String get habitItemDeleteTooltip => '습관 삭제';

  @override
  String get habitItemScheduleDaily => '매일';

  @override
  String get habitItemScheduleWeekly => '매주';

  @override
  String get habitItemScheduleMonthly => '매월';

  @override
  String get habitItemScheduleCustom => '사용자 지정';

  @override
  String get habitItemDeleteConfirmationTitle => '습관 삭제';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return '\"$habitTitle\"을(를) 정말 삭제하시겠습니까?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ 이 작업으로 플레이어의 경험치 $xpAmount가 제거됩니다!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => '취소';

  @override
  String get habitItemDeleteConfirmationDelete => '삭제';

  @override
  String get habitsTabEmptyTitle => '아직 습관이 없습니다!';

  @override
  String get habitsTabEmptySubtitle => '+ 버튼을 눌러 첫 번째 습관을 추가하세요';

  @override
  String get habitsTabOnOtherDaysHeader => 'On other days';

  @override
  String get taskFormTitle => '할일 제목';

  @override
  String get taskFormTitleError => '제목을 입력해주세요';

  @override
  String get taskFormDescription => '설명';

  @override
  String get taskFormExperience => '경험치 포인트';

  @override
  String get taskFormExperienceError => '경험치를 입력해주세요';

  @override
  String get taskFormNumberError => '유효한 숫자를 입력해주세요';

  @override
  String taskFormDueDateLabel(Object date) {
    return '마감일: $date';
  }

  @override
  String get taskFormSelectDate => '날짜 선택';

  @override
  String taskFormPriorityLabel(Object priority) {
    return '우선순위: $priority';
  }

  @override
  String get taskFormCategory => '분류';

  @override
  String get taskFormUpdate => '할일 수정';

  @override
  String get taskFormSave => '할일 저장';

  @override
  String get taskCategoryWork => '업무';

  @override
  String get taskCategoryPersonal => '개인';

  @override
  String get taskCategoryHealth => '건강';

  @override
  String get taskCategoryLearning => '학습';

  @override
  String get taskCategoryHome => '가정';

  @override
  String get taskCategorySocial => '사회';

  @override
  String get taskCategoryOther => '기타';

  @override
  String get tasksTabEmptyTitle => '아직 할일이 없습니다!';

  @override
  String get tasksTabEmptySubtitle => '+ 버튼을 눌러 첫 번째 할일을 추가하세요';

  @override
  String get tasksTabCompletedHeader => '완료된 할일';

  @override
  String tasksTabExperience(Object experience) {
    return '경험치 $experience';
  }

  @override
  String get tasksTabEditTooltip => '할일 수정';

  @override
  String get tasksTabDeleteTooltip => '할일 삭제';

  @override
  String get tasksTabDeleteConfirmationTitle => '할일 삭제';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return '\"$taskTitle\"을(를) 정말 삭제하시겠습니까?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ 이 작업으로 플레이어의 경험치 $xpAmount가 제거됩니다!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => '취소';

  @override
  String get tasksTabDeleteConfirmationDelete => '삭제';

  @override
  String get tasksTabDueToday => '오늘';

  @override
  String get tasksTabDueTomorrow => '내일';

  @override
  String get tasksTabDueYesterday => '어제';

  @override
  String tasksTabDueDaysAgo(num days) {
    return '$days일 전';
  }

  @override
  String tasksTabDueInDays(num days) {
    return '$days일 후';
  }

  @override
  String get scheduleSelectorTitle => '반복 유형';

  @override
  String get scheduleTypeDaily => '매일';

  @override
  String get scheduleTypeWeekly => '매주';

  @override
  String get scheduleTypeMonthly => '매월';

  @override
  String get scheduleTypeCustom => '사용자 지정 간격';

  @override
  String get scheduleWeeklyTitle => '요일 선택:';

  @override
  String get scheduleMonthlyTitle => '날짜 선택:';

  @override
  String get scheduleCustomTitle => 'X일마다 반복:';

  @override
  String scheduleCustomInterval(num days) {
    return '$days일마다';
  }

  @override
  String get scheduleCustomError => '간격을 선택해주세요';

  @override
  String get weekdayMonday => '월';

  @override
  String get weekdayTuesday => '화';

  @override
  String get weekdayWednesday => '수';

  @override
  String get weekdayThursday => '목';

  @override
  String get weekdayFriday => '금';

  @override
  String get weekdaySaturday => '토';

  @override
  String get weekdaySunday => '일';

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
  String get resetProgress => '진행률 초기화';

  @override
  String get resetConfirmationTitle => '초기화';

  @override
  String get resetConfirmationMessage => '진행률을 정말 초기화하시겠습니까? 이 작업으로 설정, 목표, 레벨, 경험치가 초기화되고 생성 날짜가 현재로 설정됩니다. 단, 습관과 할일은 영향을 받지 않습니다. 이 작업은 취소할 수 없습니다.';

  @override
  String get resetSuccess => '진행 데이터가 성공적으로 초기화되었습니다!';
}
