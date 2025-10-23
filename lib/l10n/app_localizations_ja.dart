// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '習慣でレベルアップ！';

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
  String get toNext => '次へ';

  @override
  String get completeDayHint => '未完了の日を完了する';

  @override
  String get markCompletedHabitsHint => 'この日の完了した習慣にマークを付ける：';

  @override
  String get skipDayButton => 'この日をスキップ';

  @override
  String get completeDayButton => '日を完了';

  @override
  String get scheduleType => 'スケジュールタイプ';

  @override
  String get habits => '習慣';

  @override
  String get habitsDone => '完了した習慣';

  @override
  String habitsNumberToday(Object habitsNumber) {
    return '今日 $habitsNumber 個';
  }

  @override
  String get tasks => 'タスク';

  @override
  String get tasksDue => '期限付きタスク';

  @override
  String get tasksDone => '完了したタスク';

  @override
  String get level => 'レベル';

  @override
  String get todaysProgress => '今日の進捗';

  @override
  String get experienceShort => 'EXP';

  @override
  String get congratulations => 'おめでとうございます！';

  @override
  String levelReached(Object level) {
    return 'レベル $level に到達！';
  }

  @override
  String get continueButton => '続ける';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return '実績を活用することを忘れずに… $goal！';
  }

  @override
  String get goal => '目標';

  @override
  String get defaultGoal => '人生をレベルアップ！';

  @override
  String get progress => '進捗';

  @override
  String get progressToLevel => 'レベルへの進捗';

  @override
  String get completed => '完了';

  @override
  String get overdue => '期限経過';

  @override
  String get karma => 'カルマ';

  @override
  String get karmaLevel => 'カルマレベル';

  @override
  String get karmaDescription => '習慣カルマレベルはあなたの一貫性を反映します。';

  @override
  String get resetProgress => '進捗をリセット';

  @override
  String get resetProgressTitle => '進捗をリセットしますか？';

  @override
  String get resetProgressDescription => 'このアクションは以下を永久的にリセットします：';

  @override
  String get resetWarningExperience => '全てのプレイヤー経験値とレベル';

  @override
  String get resetWarningHabits => '全ての習慣の完了履歴';

  @override
  String get resetWarningKarma => '全ての習慣のカルマレベル';

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
  String get progressSettings => '設定';

  @override
  String get goalMotivation => '目標の動機';

  @override
  String get goalMotivationHint => '何のために経験値を貯めていますか？';

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
  String get curveExponent => 'カーブ指数';

  @override
  String curveExponentDescription(Object exponent) {
    return 'カーブ指数: $exponent。1未満の値は初期レベルを容易にし、1より大きい値は後半のレベルを容易にします';
  }

  @override
  String get experienceMultiplier => '経験値倍率';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return '経験値倍率: $multiplier。高い値ほどレベルアップが遅くなります';
  }

  @override
  String get levelProgressionPreview => 'レベル進行プレビュー：';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return '計算式: EXP = $multiplier × (レベル-1)^$exponent';
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
  String get habitFormMinCompletionError => '最低数を入力してください';

  @override
  String get habitFormMinCountError => '少なくとも1';

  @override
  String get habitFormUpdate => '習慣を更新';

  @override
  String get habitFormSave => '習慣を保存';

  @override
  String get habitFormWeeklyError => '週次スケジュールのために少なくとも1日を選択してください';

  @override
  String get habitFormMonthlyError => '月次スケジュールのために少なくとも1日を選択してください';

  @override
  String get habitFormCustomError => 'カスタムスケジュールの間隔を選択してください';

  @override
  String habitItemExperience(Object experience) {
    return '$experience EXP';
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
    return '⚠️ これにより $xpAmount EXPがプレイヤーから削除されます！';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'キャンセル';

  @override
  String get habitItemDeleteConfirmationDelete => '削除';

  @override
  String get habitsTabEmptyTitle => '習慣がまだありません！';

  @override
  String get habitsTabEmptySubtitle => '+ボタンをタップして最初の習慣を追加しましょう';

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
  String get taskCategoryGeneral => '一般';

  @override
  String get taskCategoryHove => '家事';

  @override
  String get taskCategorySocial => '社交';

  @override
  String get taskCategoryOther => 'その他';

  @override
  String get tasksTabEmptyTitle => 'タスクがまだありません！';

  @override
  String get tasksTabEmptySubtitle => '+ボタンをタップして最初のタスクを追加しましょう';

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
    return '$experience EXP';
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
    return '⚠️ これにより $xpAmount EXPがプレイヤーから削除されます！';
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
  String tasksTabDueDaysAgo(num days) {
    return '$days 日前';
  }

  @override
  String tasksTabDueInDays(num days) {
    return 'あと $days 日';
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
  String get scheduleWeeklyTitle => '曜日を選択：';

  @override
  String get scheduleMonthlyTitle => '月の日付を選択：';

  @override
  String get scheduleCustomTitle => 'X日ごとに繰り返す：';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
      one: '1日',
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
