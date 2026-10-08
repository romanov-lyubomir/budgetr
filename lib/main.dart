import 'package:budgetr/global/theme_modes.dart' as global_theme_modes;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:budgetr/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:budgetr/widgets/main_page.dart';
import 'package:budgetr/l10n/l10n.dart';
import 'package:budgetr/global/hive_boxes.dart';
import 'package:budgetr/global/colors.dart';
import 'package:budgetr/widgets/welcome/welcome_screen.dart';
import 'package:budgetr/extensions/put_if_null.dart';
// ignore: unused_import
import 'package:budgetr/global/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('recordsBox');
  await Hive.openBox('appDataBox');

  appDataBox.putManyIfNull({
    'currency': 'EUR',
    'theme': 'auto',
    'locale': 'auto',
    'color': 'blue',
    'first_use': true,
  });

  runApp(const MainMaterialApp());
}

class MainMaterialApp extends StatefulWidget {
  const MainMaterialApp({super.key});

  @override
  State<MainMaterialApp> createState() {
    return _MainMaterialAppState();
  }
}

class _MainMaterialAppState extends State<MainMaterialApp> {
  Map colorData = <String, Color>{
    'seedColor': Colors.blue,
    'primary': Colors.blue.shade900,
    'onPrimary': Colors.white,
    'secondary': Colors.blue.shade700,
  };

  var themeMode = ThemeMode.system;

  void _onChangeTheme(String newTheme) {
    setState(() {
      themeMode =
          global_theme_modes.themeModes[newTheme.toLowerCase()] ??
          ThemeMode.system;
    });
  }

  void _onChangeColor(String newColor) {
    var colors = supportedColors[newColor.toLowerCase()]!;
    colorData["seedColor"] = colors['seedColor']!;
    colorData["primary"] = colors['primary']!;
    colorData["secondary"] = colors['secondary']!;
    setState(() {
      appDataBox.put('color', newColor);
    });
  }

  void _onChangeLanguage(String newLanguage) {
    setState(() {
      appDataBox.put('locale', newLanguage);
    });
  }

  void _onChangeCurrency(String newCurrency) {
    setState(() {
      appDataBox.put('currency', newCurrency);
    });
  }

  @override
  Widget build(BuildContext context) {
    _onChangeColor(appDataBox.get('color') ?? 'blue');

    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorData["seedColor"],
          primary: colorData["primary"],
          onPrimary: colorData["onPrimary"],
          secondary: colorData["secondary"],
          onSecondary: Colors.black,
          tertiary: Colors.white,
          onTertiary: Colors.black,
        ),
        cardTheme: const CardThemeData(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorData["primary"],
          foregroundColor: colorData["onPrimary"],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorData["primary"],
            foregroundColor: colorData["onPrimary"],
          ),
        ),
        textTheme: GoogleFonts.ubuntuTextTheme(),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 83, 67, 65)),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: colorData["seedColor"],
          primary: colorData["primary"],
          onPrimary: colorData["onPrimary"],
          secondary: colorData["secondary"],
          onSecondary: Colors.white,
          tertiary: Colors.grey.shade900,
          onTertiary: Colors.white,
        ),
        cardTheme: const CardThemeData(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorData["primary"],
          foregroundColor: colorData["onPrimary"],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorData["primary"],
            foregroundColor: colorData["onPrimary"],
          ),
        ),
        textTheme: GoogleFonts.ubuntuTextTheme(),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 182, 159, 156)),
        ),
      ),
      supportedLocales: L10n.all,
      locale: appDataBox.get('locale') != 'auto'
          ? Locale(appDataBox.get('locale'))
          : null,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: appDataBox.get('first_use')
          ? WelcomeScreen(
              getStarted: () {
                setState(() {
                  appDataBox.put('first_use', false);
                });
              },
            )
          : MainPage(
              onChangeColor: _onChangeColor,
              onChangeTheme: _onChangeTheme,
              onChangeCurrency: _onChangeCurrency,
              onChangeLanguage: _onChangeLanguage,
            ),
      themeMode:
          global_theme_modes.themeModes[appDataBox
              .get('theme')
              .toLowerCase()] ??
          ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
