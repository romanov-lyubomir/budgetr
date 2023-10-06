import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final categories = <String, Map<String, dynamic>>{
  'Food': {
    "icon": Icons.restaurant,
    "color": Colors.red.shade900,
  },
  'Leisure': {
    "icon": Icons.movie,
    "color": Colors.purple.shade900,
  },
  'Groceries': {
    "icon": Icons.shopping_cart,
    "color": Colors.green.shade900,
  },
  'Transportation': {
    "icon": Icons.train,
    "color": Colors.blue.shade900,
  },
  'Studies': {
    "icon": Icons.school,
    "color": Colors.purple.shade900,
  },
  'Bills': {
    "icon": Icons.receipt,
    "color": Colors.orange.shade900,
  },
  'Others': {
    "icon": Icons.miscellaneous_services,
    "color": Colors.grey.shade900,
  },
};

String supportedCategoriesLang(context, String category) {
  var lang = AppLocalizations.of(context)!;
  return {
        'food': lang.food,
        'leisure': lang.leisure,
        'transportation': lang.transportation,
        'groceries': lang.groceries,
        'studies': lang.studies,
        'bills': lang.bills,
        'others': lang.others,
      }[category.toLowerCase()] ??
      'category';
}
