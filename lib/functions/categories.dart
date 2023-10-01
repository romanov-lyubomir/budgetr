import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final categories = {
  'Food': Icons.restaurant,
  'Transportation': Icons.train,
  'Studies': Icons.school,
  'Bills': Icons.receipt,
  'Others': Icons.miscellaneous_services,
};

String supportedCategoriesLang(context, String category) {
  var lang = AppLocalizations.of(context)!;
  return {
        'food': lang.food,
        'transportation': lang.transportation,
        'studies': lang.studies,
        'bills': lang.bills,
        'others': lang.others,
      }[category.toLowerCase()] ??
      'category';
}
