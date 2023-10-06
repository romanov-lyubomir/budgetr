import 'package:budgetr/functions/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:budgetr/widgets/currency_list_tile.dart';
import 'package:budgetr/functions/get_theme.dart';
import 'package:budgetr/functions/currencies.dart';
import 'package:budgetr/functions/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.onClearExpenses,
    required this.onChangeTheme,
    required this.onChangeColor,
    required this.onChangeCurrency,
  });

  final void Function() onClearExpenses;
  final void Function(String) onChangeTheme;
  final void Function(String) onChangeColor;
  final void Function(String) onChangeCurrency;

  @override
  State<SettingsScreen> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  String data = '';
  String currency = appDataBox.get('currency');
  String theme = appDataBox.get('theme');
  String color = appDataBox.get('color');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.settings ?? 'Settings',
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(theme == 'Dark' ? Icons.dark_mode : Icons.light_mode),
            title: Text(
              AppLocalizations.of(context)?.theme ?? 'Theme',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  getDescriptiveTheme(
                    context,
                    appDataBox.get('theme'),
                  ),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (ctx) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          ListTile(
                            leading: const Icon(Icons.dark_mode),
                            title: Text(
                              AppLocalizations.of(context)?.dark ?? 'Dark',
                            ),
                            onTap: () {
                              appDataBox.put('theme', 'Dark');
                              widget.onChangeTheme('Dark');
                              setState(() {
                                theme = 'Dark';
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.light_mode),
                            title: Text(
                              AppLocalizations.of(context)?.light ?? 'Light',
                            ),
                            onTap: () {
                              appDataBox.put('theme', 'Light');
                              widget.onChangeTheme('Light');
                              setState(() {
                                theme = 'Light';
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.auto_awesome),
                            title: const Text('Auto'),
                            onTap: () {
                              appDataBox.put('theme', 'Auto');
                              widget.onChangeTheme('Auto');
                              setState(() {
                                theme = 'Auto';
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: Text(
              AppLocalizations.of(context)?.currency ?? 'Currency',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '$currency (${allCurrencies[currency]})',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (ctx) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          ...allCurrencies.keys.map(
                            (supportedCurrency) => CurrencyListTile(
                              onChangeCurrency: (String newCurrency) {
                                appDataBox.put('currency', newCurrency);
                                widget.onChangeCurrency(newCurrency);
                                setState(() {
                                  currency = newCurrency;
                                });
                              },
                              currency: supportedCurrency,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: Text(
              AppLocalizations.of(context)?.color ?? 'Color',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  supportedColorsLang(context, color),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (ctx) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          ...supportedColors.keys.map(
                            (supportedColor) => ListTile(
                              leading: CircleAvatar(
                                backgroundColor: supportedColors[supportedColor]
                                        ?['secondary'] ??
                                    Colors.blue,
                              ),
                              title: Text(
                                supportedColorsLang(context, supportedColor),
                              ),
                              onTap: () {
                                appDataBox.put('color', supportedColor);
                                setState(() {
                                  color = supportedColor;
                                });
                                widget.onChangeColor(supportedColor);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(
              AppLocalizations.of(context)?.language ?? 'Language',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)?.user_language ??
                      'Unknown language',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/flags/${AppLocalizations.of(context)!.languageFlagCode}.png',
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
