import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light ? 'light' : 'dark';
}

String getDescriptiveTheme(BuildContext context, String databaseTheme) {
  final autoTheme = Theme.of(context).brightness == Brightness.light
      ? AppLocalizations.of(context)?.light ?? 'Light'
      : AppLocalizations.of(context)?.dark ?? 'Dark';

  switch (databaseTheme) {
    case 'Auto':
      return 'Auto ($autoTheme)';
    case 'Light':
      return AppLocalizations.of(context)?.light ?? 'Light';
    case 'Dark':
      return AppLocalizations.of(context)?.dark ?? 'Dark';
    default:
      return '';
  }
}
