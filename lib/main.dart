import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/model/user/jwt.dart';
import 'package:new88_vaynow/model/user/order_address_hive.dart';
import 'package:new88_vaynow/model/user/social_network.dart';
import 'package:new88_vaynow/model/user/user.dart';
import 'package:new88_vaynow/model/user/user_info.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/services/supa_base/supa_base_service.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:new88_vaynow/view/splash_screen/splash_screen.dart';
import 'package:new88_vaynow/view_model/app_mode_bloc/app_mode_bloc.dart';
import 'package:new88_vaynow/view_model/auth_bloc/authen_bloc.dart';
import 'package:new88_vaynow/view_model/home_bloc/home_bloc.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

void main() async {
  setUpInjector();
  await dotenv.load(fileName: ".env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserInfoAdapter());
  Hive.registerAdapter(SocialNetworkAdapter());
  Hive.registerAdapter(JwtAdapter());
  Hive.registerAdapter(OrderAddressHiveAdapter());
  SupaBaseService.instance;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  // final FirebaseAnalytics analytics;
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final FirebaseAnalytics analytics;
  const MyHomePage({super.key
      // required this.analytics,
      });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        BlocProvider<AppModeBloc>(
          create: (context) => AppModeBloc(),
        ),
      ],
      child: BlocProvider(
        create: (context) => UserBloc()
          ..add(LoadLanguage())
          ..add(GetRandomColor())
          ..add(GetCurrentUserInfo()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            // ignore: deprecated_member_use
            var systemLocale = window.locale;
            var systemLanguage = systemLocale.languageCode;
            var locale = context.watch<UserBloc>().state.loadedLanguage ?? systemLanguage;
            ThemeMode themeMode = ThemeMode.system;
            themeMode = context.watch<UserBloc>().state.theme! ? ThemeMode.light : ThemeMode.dark;

            return MaterialApp(
              title: 'Vay New88',
              debugShowMaterialGrid: false,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
              locale: Locale(locale),
              localeListResolutionCallback: (deviceLocales, supportedLocales) {
                if (state.loadedLanguage != null) {
                  return Locale(locale);
                }
                return systemLocale;
              },
              navigatorKey: locator.get<NavigatorGlobalContextHelper>().navigatorKey,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('vi', ''),
                Locale('de', ''),
              ],
              theme: ThemeData(
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              themeMode: themeMode,
            );
          },
        ),
      ),
    );
  }
}
