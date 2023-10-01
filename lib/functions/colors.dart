import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final supportedColors = {
  'blue': {
    'seedColor': Colors.blue,
    'primary': Colors.blue.shade900,
    'secondary': Colors.blue.shade700,
  },
  'green': {
    'seedColor': Colors.green,
    'primary': Colors.green.shade900,
    'secondary': Colors.green.shade700,
  },
  'pink': {
    'seedColor': Colors.pink,
    'primary': Colors.pink.shade900,
    'secondary': Colors.pink.shade700,
  },
  'gold': {
    'seedColor': Colors.yellow,
    'primary': Colors.yellow.shade900,
    'secondary': Colors.yellow.shade700,
  },
  'orange': {
    'seedColor': Colors.orange,
    'primary': Colors.orange.shade900,
    'secondary': Colors.orange.shade700,
  },
  'purple': {
    'seedColor': Colors.purple,
    'primary': Colors.purple.shade900,
    'secondary': Colors.purple.shade700,
  },
};

String supportedColorsLang(context, String color) {
  var lang = AppLocalizations.of(context)!;
  return {
        'blue': lang.blue,
        'green': lang.green,
        'pink': lang.pink,
        'gold': lang.gold,
        'orange': lang.orange,
        'purple': lang.purple,
      }[color.toLowerCase()] ??
      'color';
}
