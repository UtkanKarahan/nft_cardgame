import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:plunder/src/app_lifecycle/app_lifecycle.dart';
import 'package:plunder/src/crashlytics/crashlytics.dart';
import 'package:provider/provider.dart';
import 'src/games_services/games_services.dart';
import 'src/main_menu/main_menu_screen.dart';
import 'src/settings/persistence/local_storage_settings_persistence.dart';
import 'src/settings/persistence/settings_persistence.dart';
import 'src/settings/settings.dart';
import 'src/settings/settings_screen.dart';
import 'src/style/palette.dart';
import 'src/style/snack_bar.dart';


Future<void> main() async {
  // Uncomment the following lines to enable Firebase Crashlytics.
  // See lib/src/crashlytics/README.md for details.

  FirebaseCrashlytics? crashlytics;
  // if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
  //   try {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform,
  //     );
  //     crashlytics = FirebaseCrashlytics.instance;
  //   } catch (e) {
  //     debugPrint("Firebase couldn't be initialized: $e");
  //   }
  // }

  await guardWithCrashlytics(
    guardedMain,
    crashlytics: crashlytics,
  );
}

/// Without logging and crash reporting, this would be `void main()`.
void guardedMain() {
  if (kReleaseMode) {
    // Don't log anything below warnings in production.
    Logger.root.level = Level.WARNING;
  }
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: '
        '${record.loggerName}: '
        '${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();

  _log.info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );




  GamesServicesController? gamesServicesController;
  // if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
  //   gamesServicesController = GamesServicesController()
  //     // Attempt to log the player in.
  //     ..initialize();
  // }



  runApp(
    MyApp(
      settingsPersistence: LocalStorageSettingsPersistence(),

      gamesServicesController: gamesServicesController,
    ),
  );
}

Logger _log = Logger('main.dart');

class MyApp extends StatelessWidget {
  static final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) =>
          const MainMenuScreen(key: Key('main menu')),
          routes: [

            GoRoute(
              path: 'settings',
              builder: (context, state) =>
              const SettingsScreen(key: Key('settings')),
            ),
          ]),
    ],
  );


  final SettingsPersistence settingsPersistence;

  final GamesServicesController? gamesServicesController;



  const MyApp({
  required this.settingsPersistence,
  required this.gamesServicesController,
  super.key,
});

@override
Widget build(BuildContext context) {
  return AppLifecycleObserver(
    child: MultiProvider(
      providers: [

        Provider<GamesServicesController?>.value(
            value: gamesServicesController),

        Provider<SettingsController>(
          lazy: false,
          create: (context) => SettingsController(
            persistence: settingsPersistence,
          )..loadStateFromPersistence(),
        ),

        Provider(
          create: (context) => Palette(),
        ),
      ],
      child: Builder(builder: (context) {
        final palette = context.watch<Palette>();

        return MaterialApp.router(
          title: 'Plunder NFT TCG',
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: palette.darkPen,
              background: palette.backgroundMain,
            ),
            textTheme: TextTheme(
              bodyText2: TextStyle(
                color: palette.ink,
              ),
            ),
          ),
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          scaffoldMessengerKey: scaffoldMessengerKey,
        );
      }),
    ),
  );
}
}
