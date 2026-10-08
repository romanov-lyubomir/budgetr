import 'package:budgetr/global/get_theme.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/l10n/app_localizations.dart';
import 'package:budgetr/global/hive_boxes.dart';

class SetTheme extends StatefulWidget {
  const SetTheme({super.key, required this.onChangeTheme});

  final Function(String) onChangeTheme;
  @override
  State<SetTheme> createState() {
    return _SetThemeState();
  }
}

class _SetThemeState extends State<SetTheme> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        appDataBox.get('theme') == 'dark' ? Icons.dark_mode : Icons.light_mode,
      ),
      title: Text(AppLocalizations.of(context)?.theme ?? 'Theme'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            getDescriptiveTheme(context, appDataBox.get('theme')),
            style: const TextStyle(fontSize: 12),
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
                      leading: const Icon(Icons.auto_awesome),
                      title: const Text('Auto'),
                      onTap: () {
                        appDataBox.put('theme', 'auto');
                        widget.onChangeTheme('auto');
                        setState(() {
                          appDataBox.put('theme', 'auto');
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.dark_mode),
                      title: Text(AppLocalizations.of(context)?.dark ?? 'Dark'),
                      onTap: () {
                        appDataBox.put('theme', 'dark');
                        widget.onChangeTheme('dark');
                        setState(() {
                          appDataBox.put('theme', 'dark');
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
                        appDataBox.put('theme', 'light');
                        widget.onChangeTheme('light');
                        setState(() {
                          appDataBox.put('theme', 'light');
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
    );
  }
}
