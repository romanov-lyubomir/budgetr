import 'package:flutter/material.dart';
import 'package:budgetr/l10n/app_localizations.dart';

final categories = <String, Map<String, dynamic>>{
  'food': {"icon": Icons.restaurant, "color": Colors.red.shade900},
  'leisure': {"icon": Icons.movie, "color": Colors.purple.shade900},
  'groceries': {"icon": Icons.shopping_cart, "color": Colors.green.shade900},
  'transportation': {"icon": Icons.train, "color": Colors.blue.shade900},
  'studies': {"icon": Icons.school, "color": Colors.purple.shade900},
  'bills': {"icon": Icons.receipt, "color": Colors.orange.shade900},
  'others': {
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
      'Unknown category (error)';
}

String typesLang(context, String type) {
  return {'expense': "Expense", 'income': "Income"}[type.toLowerCase()] ??
      'type';
}
