import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:budgetr/widgets/expenses.dart';
import 'package:budgetr/l10n/l10n.dart';
import 'package:budgetr/functions/hive_boxes.dart';
import 'package:budgetr/functions/colors.dart';
import 'package:budgetr/screens/welcome_screen.dart';
import 'package:budgetr/extensions/put_if_null.dart';

Color seedColor = Colors.blue;
Color primary = Colors.blue.shade900;
Color onPrimary = Colors.white;
Color secondary = Colors.blue.shade700;
Color onSecondary = Colors.white;

void setColors(Map colors) {
  seedColor = colors['seedColor']!;
  primary = colors['primary']!;
  secondary = colors['secondary']!;
}

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('expensesBox');
  await Hive.openBox('appDataBox');

  appDataBox.putManyIfNull({
    'currency': 'EUR',
    'theme': 'Auto',
    'color': 'Blue',
    'first_use': true,
  });

  runApp(
    const MainMaterialApp(),
  );
}

class MainMaterialApp extends StatefulWidget {
  const MainMaterialApp({super.key});

  @override
  State<MainMaterialApp> createState() {
    return _MainMaterialAppState();
  }
}

class _MainMaterialAppState extends State<MainMaterialApp> {
  var themeMode = ThemeMode.system;

  void _onChangeTheme(String newTheme) {
    final themeModes = {
      'auto': ThemeMode.system,
      'light': ThemeMode.light,
      'dark': ThemeMode.dark,
    };
    setState(() {
      themeMode = themeModes[newTheme.toLowerCase()] ?? ThemeMode.system;
    });
  }

  void _onChangeColor(String? newColor) {
    if (newColor == null) return;
    newColor = newColor.toLowerCase();
    setState(() {
      appDataBox.put('color', newColor);
      setColors(
        supportedColors[newColor]!,
      );
    });
  }

  void _onChangeCurrency(String newCurrency) {
    setState(() {
      appDataBox.put('currency', newCurrency);
    });
  }

  @override
  Widget build(BuildContext context) {
    _onChangeTheme(appDataBox.get('theme') ?? 'auto');
    _onChangeColor(appDataBox.get('color') ?? 'blue');

    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: Colors.black,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: primary,
          foregroundColor: onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: onPrimary,
          ),
        ),
        textTheme: GoogleFonts.ubuntuTextTheme().copyWith(
          titleLarge: GoogleFonts.ubuntuTextTheme().titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xFF534341),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: seedColor,
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: Colors.white,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: primary,
          foregroundColor: onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: onPrimary,
          ),
        ),
        textTheme: GoogleFonts.ubuntuTextTheme().copyWith(
          titleLarge: GoogleFonts.ubuntuTextTheme().titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 182, 159, 156),
          ),
        ),
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
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
          : Expenses(
              onChangeColor: _onChangeColor,
              onChangeTheme: _onChangeTheme,
              onChangeCurrency: _onChangeCurrency,
            ),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
