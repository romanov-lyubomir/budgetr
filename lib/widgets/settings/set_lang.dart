import 'package:budgetr/global/languages_and_flags.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/l10n/app_localizations.dart';
import 'package:budgetr/global/hive_boxes.dart';

class SetLang extends StatefulWidget {
  const SetLang({super.key, required this.onChangeLanguage});

  final Function(String) onChangeLanguage;

  @override
  State<SetLang> createState() {
    return _SetLangState();
  }
}

class _SetLangState extends State<SetLang> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(AppLocalizations.of(context)?.language ?? 'Language'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            appDataBox.get("locale") != 'auto'
                ? AppLocalizations.of(context)?.user_language ??
                      "Unknown language"
                : "Auto (${AppLocalizations.of(context)?.user_language ?? "Unknown language"})",
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/flags/${AppLocalizations.of(context)!.languageFlagCode}.png',
            height: 25,
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
                      leading: const SizedBox(
                        width: 37,
                        height: 25,
                        child: Center(
                          child: Icon(Icons.auto_awesome, size: 25),
                        ),
                      ),
                      title: const Text('Auto'),
                      onTap: () {
                        setState(() {
                          appDataBox.put('locale', 'auto');
                        });
                        widget.onChangeLanguage('auto');
                        Navigator.of(context).pop();
                      },
                    ),
                    ...AppLocalizations.supportedLocales.map((supportedLocale) {
                      var langCode = supportedLocale.languageCode;
                      var langName = langFlag.firstWhere(
                        (element) => element[0] == langCode,
                      )[1];
                      var langNativeName = langFlag.firstWhere(
                        (element) => element[0] == langCode,
                      )[2];
                      var langEnglishName = langFlag.firstWhere(
                        (element) => element[0] == langCode,
                      )[3];
                      return ListTile(
                        leading: Image.asset(
                          'assets/flags/$langName.png',
                          height: 25,
                        ),
                        title: Text(langNativeName),
                        subtitle: Text(langEnglishName),
                        onTap: () {
                          setState(() {
                            appDataBox.put('locale', langCode);
                          });
                          widget.onChangeLanguage(langCode);
                          Navigator.of(context).pop();
                        },
                      );
                    }),
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
