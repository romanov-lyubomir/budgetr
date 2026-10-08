import 'package:budgetr/widgets/settings/set_color.dart';
import 'package:budgetr/widgets/settings/set_currency.dart';
import 'package:budgetr/widgets/settings/set_lang.dart';
import 'package:budgetr/widgets/settings/set_theme.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.onChangeTheme,
    required this.onChangeColor,
    required this.onChangeCurrency,
    required this.onChangeLanguage,
  });
  final void Function(String) onChangeTheme;
  final void Function(String) onChangeColor;
  final void Function(String) onChangeCurrency;
  final void Function(String) onChangeLanguage;

  @override
  State<SettingsScreen> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.settings ?? 'Settings'),
      ),
      body: ListView(
        children: <Widget>[
          SetTheme(onChangeTheme: widget.onChangeTheme),
          SetCurrency(onChangeCurrency: widget.onChangeCurrency),
          SetColor(onChangeColor: widget.onChangeColor),
          SetLang(onChangeLanguage: widget.onChangeLanguage),
        ],
      ),
    );
  }
}
