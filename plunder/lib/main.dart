import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:plunder/src/app_lifecycle/app_lifecycle.dart';
import 'package:plunder/src/auction/auction_screen.dart';
import 'package:plunder/src/contract_functions/contract_functions.dart';
import 'package:plunder/src/crashlytics/crashlytics.dart';
import 'package:plunder/src/firestore/firestore.dart';
import 'package:plunder/src/inventory/inventory_screen.dart';
import 'package:plunder/src/login/login_screen.dart';
import 'package:plunder/src/metamask/metamask.dart';
import 'package:plunder/src/shop/shop_screen.dart';
import 'package:provider/provider.dart';
import 'src/games_services/games_services.dart';
import 'src/main_menu/main_menu_screen.dart';
import 'src/settings/persistence/local_storage_settings_persistence.dart';
import 'src/settings/persistence/settings_persistence.dart';
import 'src/settings/settings.dart';
import 'src/settings/settings_screen.dart';
import 'src/style/palette.dart';
import 'src/style/snack_bar.dart';




void main() async {
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
Future<void> guardedMain() async {
  if (kReleaseMode) {
    // Don't log anything below warnings in production.
    Logger.root.level = Level.WARNING;
  }
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: '
        '${record.loggerName}: '
        '${record.message}');
  });

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

  WidgetsFlutterBinding.ensureInitialized();

  //await Firebase.initializeApp();

  runApp(
    MyApp(
      settingsPersistence: LocalStorageSettingsPersistence(),
      gamesServicesController: gamesServicesController,
    ),
  );





}

Logger _log = Logger('main.dart');

class MyApp extends StatelessWidget {

  static final _routerGame = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
        const LoginScreen(key: Key('login')),
      ),

      GoRoute(
          path: '/guild',
          builder: (context, state) =>
          const MainMenuScreen(key: Key('main menu')),
      ),
      GoRoute(
        path: '/shop',
        builder: (context, state) =>
        const ShopScreen(key: Key('shop')),
      ),
      GoRoute(
        path: '/inventory',
        builder: (context, state) =>
        const InventoryScreen(key: Key('inventory')),
      ),
      GoRoute(
        path: '/auction',
        builder: (context, state) =>
        const AuctionScreen(key: Key('auction')),
      ),
        GoRoute(
          path: '/settings',
          builder: (context, state) =>
          const SettingsScreen(key: Key('settings')),
        ),



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


    return ChangeNotifierProvider(
        create: (context) => MetaMaskProvider()..init(),
        builder: (context, child) {
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
                Provider<FirestoreService>(
                  create: (_) => FirestoreService(FirebaseFirestore.instance),
                ),
                Provider(
                  create: (context) => Palette(),
                ),
              ],
              child: Builder(builder: (context) {
                final palette = context.watch<Palette>();

                return Consumer<MetaMaskProvider>(
                    builder: (context, provider, child) {
                  late final String text;

                  if (provider.isConnected && provider.isInOperatingChain) {
                    text = "Connected";
                  } else if (provider.isConnected &&
                      !provider.isInOperatingChain) {
                    text =
                        "Wrong Chain!! Please connect to ${MetaMaskProvider.operatingChain}.";
                  } else if (provider.isEnabled) {
                    return MaterialApp.router(
                      title: 'Plunder NFT TCG',
                      theme: ThemeData.from(
                        colorScheme: ColorScheme.fromSeed(
                          seedColor: palette.darkPen,
                          background: palette.background,
                        ),
                        textTheme: TextTheme(
                          bodyText2: TextStyle(
                            color: palette.ink,
                          ),
                        ),
                      ),
                      routeInformationParser: _routerGame.routeInformationParser,
                      routerDelegate: _routerGame.routerDelegate,
                      scaffoldMessengerKey: scaffoldMessengerKey,
                    );
                  } else {
                    text = "Please use a Web3 supported browser.";
                  }

                  return text != "Connected" ?MaterialApp(
                      title: 'Plunder NFT TCG',
                      theme: ThemeData.from(
                        colorScheme: ColorScheme.fromSeed(
                          seedColor: palette.darkPen,
                          background: palette.background,
                        ),
                        textTheme: TextTheme(
                          bodyText2: TextStyle(
                            color: palette.ink,
                          ),
                        ),
                      ),
                      home: Builder(builder: (BuildContext context) {
                      return Scaffold(body: Center(child: Text(text, style: const TextStyle(fontSize: 100),)));
                      } )) :
                   MaterialApp.router(
                    title: 'Plunder NFT TCG',
                    theme: ThemeData.from(
                      colorScheme: ColorScheme.fromSeed(
                        seedColor: palette.darkPen,
                        background: palette.background,
                      ),
                      textTheme: TextTheme(
                        bodyText2: TextStyle(
                          color: palette.ink,
                        ),
                      ),
                    ),
                    routeInformationParser: _routerGame.routeInformationParser,
                    routerDelegate: _routerGame.routerDelegate,
                    scaffoldMessengerKey: scaffoldMessengerKey,
                  );



                });
              }),
            ),
          );
        });
  }
}
