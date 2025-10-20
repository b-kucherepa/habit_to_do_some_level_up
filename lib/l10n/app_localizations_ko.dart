// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'RPG 할일 & 습관';

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
  String get save => '저장';

  @override
  String get cancel => '취소';

  @override
  String get delete => '삭제';

  @override
  String get edit => '수정';

  @override
  String get toNext => '다음으로';

  @override
  String get habitTitle => '습관 제목';

  @override
  String get completeDayHint => '놓친 날 완료하기';

  @override
  String get markCompletedHabitsHint => '이 날짜에 완료한 습관 표시:';

  @override
  String get skipDayButton => '이 날 건너뛰기';

  @override
  String get completeDayButton => '날짜 완료';

  @override
  String get habitDescription => '설명';

  @override
  String get experiencePoints => '경험치';

  @override
  String get minCompletionCount => '최소 완료 횟수';

  @override
  String get scheduleType => '일정 유형';

  @override
  String get daily => '매일';

  @override
  String get weekly => '매주';

  @override
  String get monthly => '매월';

  @override
  String get custom => '사용자 지정';

  @override
  String get selectDays => '요일 선택';

  @override
  String get monday => '월요일';

  @override
  String get tuesday => '화요일';

  @override
  String get wednesday => '수요일';

  @override
  String get thursday => '목요일';

  @override
  String get friday => '금요일';

  @override
  String get saturday => '토요일';

  @override
  String get sunday => '일요일';

  @override
  String get character => '캐릭터';

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
  String habitsNumberToday(Object habitsNumber) {
    return '오늘 $habitsNumber개';
  }

  @override
  String get todaysProgress => '오늘의 진행상황';

  @override
  String get experience => '경험치';

  @override
  String get experienceShort => 'EXP';

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
    return '달성한 내용을 $goal하는 데 사용하는 것을 잊지 마세요!';
  }

  @override
  String expCurveLabel(Object exponent, Object multiplier) {
    return '곡선 지수: $exponent, 배수: $multiplier';
  }

  @override
  String get goal => '목표';

  @override
  String get defaultGoal => 'RPG 캐릭터를 만들기 위해 경험치를 축적하세요!';

  @override
  String get progress => '진행률';

  @override
  String get progressToLevel => '레벨 달성 진행률';

  @override
  String get completed => '완료됨';

  @override
  String get pending => '대기중';

  @override
  String get overdue => '기한 초과';

  @override
  String get dueToday => '오늘 마감';

  @override
  String get dueSoon => '곧 마감';

  @override
  String get karma => '카르마';

  @override
  String get karmaLevel => '카르마 레벨';

  @override
  String get karmaDescription => '카르마 레벨은 꾸준함을 반영합니다.';

  @override
  String get resetProgress => '진행률 초기화';

  @override
  String get resetProgressTitle => '진행률을 초기화하시겠습니까?';

  @override
  String get resetProgressDescription => '이 작업은 다음을 영구적으로 초기화합니다:';

  @override
  String get resetWarningExperience => '모든 캐릭터 경험치와 레벨';

  @override
  String get resetWarningHabits => '모든 습관의 완료 기록';

  @override
  String get resetWarningKarma => '모든 습관의 카르마 레벨';

  @override
  String get resetTasksUnaffected => '할일은 영향을 받지 않습니다.';

  @override
  String get resetCannotUndone => '이 작업은 취소할 수 없습니다!';

  @override
  String get resetCancel => '취소';

  @override
  String get resetConfirm => '진행률 초기화';

  @override
  String get resetSuccess => '진행률이 성공적으로 초기화되었습니다!';

  @override
  String get progressSettings => '진행 설정';

  @override
  String get goalMotivation => '목표 동기부여';

  @override
  String get goalMotivationHint => '무엇을 위해 경험치를 축적하나요?';

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
    return '곡선 지수: $exponent. 1보다 작은 값은 초기 레벨을 쉽게, 1보다 큰 값은 후기 레벨을 쉽게 만듭니다';
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
  String levelFormula(Object multiplier, Object exponent) {
    return '공식: EXP = $multiplier × (레벨-1)^$exponent';
  }

  @override
  String get habitFormTitle => '습관 제목';

  @override
  String get habitFormTitleError => '제목을 입력해주세요';

  @override
  String get habitFormDescription => '설명';

  @override
  String get habitFormExperience => '경험치';

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
  String get habitFormUpdate => '습관 업데이트';

  @override
  String get habitFormSave => '습관 저장';

  @override
  String get habitFormWeeklyError => '주간 일정에 대해 최소 한 개의 요일을 선택해주세요';

  @override
  String get habitFormMonthlyError => '월간 일정에 대해 최소 한 개의 날짜를 선택해주세요';

  @override
  String get habitFormCustomError => '사용자 지정 일정에 대한 간격을 선택해주세요';

  @override
  String habitItemExperience(Object experience) {
    return '$experience XP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return '최소 $minCompletionCount회';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '오늘 $currentCount회';
  }

  @override
  String get habitItemNotToday => '오늘 해당 안됨';

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
    return '⚠️ 이 작업은 $xpAmount XP를 캐릭터에서 제거합니다!';
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
  String get taskFormTitle => '할일 제목';

  @override
  String get taskFormTitleError => '제목을 입력해주세요';

  @override
  String get taskFormDescription => '설명';

  @override
  String get taskFormExperience => '경험치';

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
  String get taskFormUpdate => '할일 업데이트';

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
  String get taskCategoryOther => '기타';

  @override
  String get tasksTabEmptyTitle => '아직 할일이 없습니다!';

  @override
  String get tasksTabEmptySubtitle => '+ 버튼을 눌러 첫 번째 할일을 추가하세요';

  @override
  String get tasksTabTotal => '전체';

  @override
  String get tasksTabPending => '대기중';

  @override
  String get tasksTabDone => '완료됨';

  @override
  String tasksTabPendingHeader(Object count) {
    return '대기중인 할일 ($count)';
  }

  @override
  String tasksTabCompletedHeader(Object count) {
    return '완료된 할일 ($count)';
  }

  @override
  String tasksTabExperience(Object experience) {
    return '$experience XP';
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
    return '⚠️ 이 작업은 $xpAmount XP를 캐릭터에서 제거합니다!';
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
  String tasksTabDueDaysAgo(Object days) {
    return '$days일 전';
  }

  @override
  String tasksTabDueInDays(Object days) {
    return '$days일 후';
  }

  @override
  String get scheduleSelectorTitle => '일정 유형';

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
  String get scheduleMonthlyTitle => '월간 날짜 선택:';

  @override
  String get scheduleCustomTitle => 'X일마다 반복:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '1일',
    );
    return '$_temp0';
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
}
