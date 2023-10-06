import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light ? 'light' : 'dark';
}

String getDescriptiveTheme(BuildContext context, String databaseTheme) {
  final autoTheme = Theme.of(context).brightness == Brightness.light
      ? AppLocalizations.of(context)?.light ?? 'Light'
      : AppLocalizations.of(context)?.dark ?? 'Dark';

  return {
        'Auto': 'Auto ($autoTheme)',
        'Light': AppLocalizations.of(context)?.light ?? 'Light',
        'Dark': AppLocalizations.of(context)?.dark ?? 'Dark',
      }[databaseTheme] ??
      'Unknown theme';
}
