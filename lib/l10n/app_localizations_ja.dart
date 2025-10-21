// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'RPGタスク＆習慣';

  @override
  String get home => 'ホーム';

  @override
  String get settings => '設定';

  @override
  String get addHabit => '習慣を追加';

  @override
  String get addTask => 'タスクを追加';

  @override
  String get editHabit => '習慣を編集';

  @override
  String get editTask => 'タスクを編集';

  @override
  String get delete => '削除';

  @override
  String get edit => '編集';

  @override
  String get toNext => '次へ';

  @override
  String get habitTitle => '習慣タイトル';

  @override
  String get completeDayHint => '未完了の日を完了する';

  @override
  String get markCompletedHabitsHint => 'この日の完了した習慣にマーク:';

  @override
  String get skipDayButton => 'この日をスキップ';

  @override
  String get completeDayButton => '日を完了';

  @override
  String get habitDescription => '説明';

  @override
  String get experiencePoints => '経験値';

  @override
  String get minCompletionCount => '最低完了回数';

  @override
  String get scheduleType => 'スケジュールタイプ';

  @override
  String get daily => '毎日';

  @override
  String get weekly => '毎週';

  @override
  String get monthly => '毎月';

  @override
  String get custom => 'カスタム';

  @override
  String get selectDays => '日を選択';

  @override
  String get monday => '月曜日';

  @override
  String get tuesday => '火曜日';

  @override
  String get wednesday => '水曜日';

  @override
  String get thursday => '木曜日';

  @override
  String get friday => '金曜日';

  @override
  String get saturday => '土曜日';

  @override
  String get sunday => '日曜日';

  @override
  String get character => 'キャラクター';

  @override
  String get habits => '習慣';

  @override
  String get habitsDone => '完了した習慣';

  @override
  String get tasks => 'タスク';

  @override
  String get tasksDue => '期限タスク';

  @override
  String get tasksDone => '完了したタスク';

  @override
  String get level => 'レベル';

  @override
  String habitsNumberToday(Object habitsNumber) {
    return '今日 $habitsNumber 個';
  }

  @override
  String get todaysProgress => '今日の進捗';

  @override
  String get experience => '経験値';

  @override
  String get experienceShort => 'EXP';

  @override
  String get congratulations => 'おめでとう！';

  @override
  String levelReached(Object level) {
    return 'レベル $level に到達！';
  }

  @override
  String get continueButton => '続ける';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return '実績を$goalために使うことを忘れずに！';
  }

  @override
  String expCurveLabel(Object exponent, Object multiplier) {
    return '曲線指数: $exponent, 乗数: $multiplier';
  }

  @override
  String get goal => '目標';

  @override
  String get defaultGoal => '経験を蓄えてRPGキャラクターを作成しよう！';

  @override
  String get progress => '進捗';

  @override
  String get progressToLevel => 'レベルまでの進捗';

  @override
  String get completed => '完了';

  @override
  String get pending => '保留中';

  @override
  String get overdue => '期限経過';

  @override
  String get dueToday => '今日期限';

  @override
  String get dueSoon => '近日期限';

  @override
  String get karma => 'カルマ';

  @override
  String get karmaLevel => 'カルマレベル';

  @override
  String get karmaDescription => 'カルマレベルはあなたの一貫性を反映します。';

  @override
  String get resetProgress => '進捗をリセット';

  @override
  String get resetProgressTitle => '進捗をリセットしますか？';

  @override
  String get resetProgressDescription => 'この操作は永久的に以下をリセットします:';

  @override
  String get resetWarningExperience => 'すべてのキャラクター経験値とレベル';

  @override
  String get resetWarningHabits => 'すべての習慣の完了履歴';

  @override
  String get resetWarningKarma => 'すべての習慣のカルマレベル';

  @override
  String get resetTasksUnaffected => 'タスクは影響を受けません。';

  @override
  String get resetCannotUndone => 'この操作は元に戻せません！';

  @override
  String get resetCancel => 'キャンセル';

  @override
  String get resetConfirm => '進捗をリセット';

  @override
  String get resetSuccess => '進捗が正常にリセットされました！';

  @override
  String get progressSettings => '進捗設定';

  @override
  String get goalMotivation => '目標の動機';

  @override
  String get goalMotivationHint => '経験値を何のために蓄積していますか？';

  @override
  String get language => '言語';

  @override
  String get english => '英語';

  @override
  String get russian => 'ロシア語';

  @override
  String get german => 'ドイツ語';

  @override
  String get french => 'フランス語';

  @override
  String get spanish => 'スペイン語';

  @override
  String get portuguese => 'ポルトガル語';

  @override
  String get chinese => '中国語';

  @override
  String get japanese => '日本語';

  @override
  String get korean => '韓国語';

  @override
  String get hindi => 'ヒンディー語';

  @override
  String get arabic => 'アラビア語';

  @override
  String get hebrew => 'ヘブライ語';

  @override
  String get curveExponent => '曲線指数';

  @override
  String curveExponentDescription(Object exponent) {
    return '曲線指数: $exponent。1未満は初期レベルを簡単に、1以上は後期レベルを簡単にします';
  }

  @override
  String get experienceMultiplier => '経験値乗数';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return '経験値乗数: $multiplier。高い値ほどレベルアップが遅くなります';
  }

  @override
  String get levelProgressionPreview => 'レベル進行プレビュー:';

  @override
  String levelFormula(Object multiplier, Object exponent) {
    return '式: EXP = $multiplier × (レベル-1)^$exponent';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get habitFormTitle => '習慣タイトル';

  @override
  String get habitFormTitleError => 'タイトルを入力してください';

  @override
  String get habitFormDescription => '説明';

  @override
  String get habitFormExperience => '経験値';

  @override
  String get habitFormExperienceError => '経験値を入力してください';

  @override
  String get habitFormNumberError => '有効な数値を入力してください';

  @override
  String get habitFormMinCompletion => '最低完了数';

  @override
  String get habitFormMinCompletionError => '最低回数を入力してください';

  @override
  String get habitFormMinCountError => '少なくとも1以上';

  @override
  String get habitFormUpdate => '習慣を更新';

  @override
  String get habitFormSave => '習慣を保存';

  @override
  String get habitFormWeeklyError => '週次スケジュールでは少なくとも1日を選択してください';

  @override
  String get habitFormMonthlyError => '月次スケジュールでは少なくとも1日を選択してください';

  @override
  String get habitFormCustomError => 'カスタムスケジュールでは間隔を選択してください';

  @override
  String habitItemExperience(Object experience) {
    return '$experience XP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return '最低 $minCompletionCount';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '今日 $currentCount';
  }

  @override
  String get habitItemNotToday => '今日は対象外';

  @override
  String get habitItemEditTooltip => '習慣を編集';

  @override
  String get habitItemDeleteTooltip => '習慣を削除';

  @override
  String get habitItemScheduleDaily => '毎日';

  @override
  String get habitItemScheduleWeekly => '毎週';

  @override
  String get habitItemScheduleMonthly => '毎月';

  @override
  String get habitItemScheduleCustom => 'カスタム';

  @override
  String get habitItemDeleteConfirmationTitle => '習慣を削除';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return '「$habitTitle」を削除してもよろしいですか？';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ これによりキャラクターから$xpAmount XPが削除されます！';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'キャンセル';

  @override
  String get habitItemDeleteConfirmationDelete => '削除';

  @override
  String get habitsTabEmptyTitle => '習慣がまだありません！';

  @override
  String get habitsTabEmptySubtitle => '+ボタンをタップして最初の習慣を追加';

  @override
  String get taskFormTitle => 'タスクタイトル';

  @override
  String get taskFormTitleError => 'タイトルを入力してください';

  @override
  String get taskFormDescription => '説明';

  @override
  String get taskFormExperience => '経験値';

  @override
  String get taskFormExperienceError => '経験値を入力してください';

  @override
  String get taskFormNumberError => '有効な数値を入力してください';

  @override
  String taskFormDueDateLabel(Object date) {
    return '期限: $date';
  }

  @override
  String get taskFormSelectDate => '日付を選択';

  @override
  String taskFormPriorityLabel(Object priority) {
    return '優先度: $priority';
  }

  @override
  String get taskFormCategory => 'カテゴリ';

  @override
  String get taskFormUpdate => 'タスクを更新';

  @override
  String get taskFormSave => 'タスクを保存';

  @override
  String get taskCategoryWork => '仕事';

  @override
  String get taskCategoryPersonal => '個人';

  @override
  String get taskCategoryHealth => '健康';

  @override
  String get taskCategoryLearning => '学習';

  @override
  String get taskCategoryOther => 'その他';

  @override
  String get tasksTabEmptyTitle => 'タスクがまだありません！';

  @override
  String get tasksTabEmptySubtitle => '+ボタンをタップして最初のタスクを追加';

  @override
  String get tasksTabTotal => '合計';

  @override
  String get tasksTabPending => '保留中';

  @override
  String get tasksTabDone => '完了';

  @override
  String tasksTabPendingHeader(Object count) {
    return '保留中のタスク ($count)';
  }

  @override
  String tasksTabCompletedHeader(Object count) {
    return '完了したタスク ($count)';
  }

  @override
  String tasksTabExperience(Object experience) {
    return '$experience XP';
  }

  @override
  String get tasksTabEditTooltip => 'タスクを編集';

  @override
  String get tasksTabDeleteTooltip => 'タスクを削除';

  @override
  String get tasksTabDeleteConfirmationTitle => 'タスクを削除';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return '「$taskTitle」を削除してもよろしいですか？';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ これによりキャラクターから$xpAmount XPが削除されます！';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'キャンセル';

  @override
  String get tasksTabDeleteConfirmationDelete => '削除';

  @override
  String get tasksTabDueToday => '今日';

  @override
  String get tasksTabDueTomorrow => '明日';

  @override
  String get tasksTabDueYesterday => '昨日';

  @override
  String tasksTabDueDaysAgo(Object days) {
    return '$days日前';
  }

  @override
  String tasksTabDueInDays(Object days) {
    return 'あと$days日';
  }

  @override
  String get scheduleSelectorTitle => 'スケジュールタイプ';

  @override
  String get scheduleTypeDaily => '毎日';

  @override
  String get scheduleTypeWeekly => '毎週';

  @override
  String get scheduleTypeMonthly => '毎月';

  @override
  String get scheduleTypeCustom => 'カスタム間隔';

  @override
  String get scheduleWeeklyTitle => '日を選択:';

  @override
  String get scheduleMonthlyTitle => '月の日を選択:';

  @override
  String get scheduleCustomTitle => 'X日ごとに繰り返し:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => '間隔を選択してください';

  @override
  String get weekdayMonday => '月';

  @override
  String get weekdayTuesday => '火';

  @override
  String get weekdayWednesday => '水';

  @override
  String get weekdayThursday => '木';

  @override
  String get weekdayFriday => '金';

  @override
  String get weekdaySaturday => '土';

  @override
  String get weekdaySunday => '日';
}
