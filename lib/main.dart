import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_rpg_app/language_manager.dart';
import 'l10n/app_localizations.dart';
import 'models/character.dart';
import 'models/habit.dart';
import 'models/task.dart';
import 'screens/day_completion_wrapper.dart';
import 'services/hive_service.dart';
import 'services/level_up_service.dart';
import 'services/experience_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<Character>('characters');
  await Hive.openBox<Habit>('habits');
  await Hive.openBox<Task>('tasks');
  await Hive.openBox('preferences');

  final hiveService = HiveService();
  hiveService.getFirstCharacter(); // Это создаст персонажа если его нет

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageManager()),
        Provider(create: (_) => HiveService()),
        Provider(create: (_) => LevelUpService()),
        ProxyProvider2<HiveService, LevelUpService, ExperienceService>(
          update: (_, hiveService, levelUpService, __) =>
              ExperienceService(hiveService, levelUpService),
        ),
      ],
      child: MyAppContent(navigatorKey: navigatorKey),
    );
  }
}

class MyAppContent extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyAppContent({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    final languageManager = context.watch<LanguageManager>();
    final levelUpService = context.read<LevelUpService>();

    // Передаем navigatorKey в LevelUpService
    levelUpService.setNavigatorKey(navigatorKey);

    return MaterialApp(
      title: 'RPG Todo & Habits',
      navigatorKey: navigatorKey, // Ключ для навигатора
      locale: languageManager.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('ru', ''),
        Locale('de', ''),
        Locale('fr', ''),
        Locale('es', ''),
        Locale('pt', ''),
        Locale('zh', ''),
        Locale('ja', ''),
        Locale('ko', ''),
        Locale('hi', ''),
        Locale('ar', ''),
        Locale('he', ''),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: DayCompletionWrapper(),
    );
  }
}
