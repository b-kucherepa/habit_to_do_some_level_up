import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:habit_to_do_some_level_up/language_manager.dart';
import 'l10n/app_localizations.dart';
import 'models/player.dart';
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

  print('Hive path: ${appDocumentDir.path}');

  Hive.registerAdapter(PlayerAdapter());
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<Player>('players');
  await Hive.openBox<Habit>('habits');
  await Hive.openBox<Task>('tasks');
  await Hive.openBox('preferences');

  final hiveService = HiveService();
  hiveService.getPlayer();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(Duration(milliseconds: 100));

    final languageManager = LanguageManager();
    await languageManager.init();

    _languageManager = languageManager;
  }

  late LanguageManager _languageManager;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: _languageManager),
            Provider(create: (_) => HiveService()),
            Provider(create: (_) => LevelUpService()),
            ProxyProvider2<HiveService, LevelUpService, ExperienceService>(
              update: (_, hiveService, levelUpService, __) =>
                  ExperienceService(hiveService, levelUpService),
            ),
          ],
          child: MyAppContent(navigatorKey: widget.navigatorKey),
        );
      },
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

    levelUpService.setNavigatorKey(navigatorKey);

    return MaterialApp(
      title: 'Habit To Do Some Level Up',
      navigatorKey: navigatorKey,
      locale: languageManager.locale,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Styles.basicTextColor,
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
