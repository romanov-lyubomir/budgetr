// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get user_language => 'Deutsch';

  @override
  String get languageFlagCode => 'de';

  @override
  String get filtersAndOrder => 'Filter und Reihenfolge';

  @override
  String get orderBySum => 'Nach Summe ordnen';

  @override
  String get lowToHigh => 'Niedrig bis hoch';

  @override
  String get highToLow => 'Hoch bis niedrig';

  @override
  String get orderByDate => 'Nach Datum sortieren';

  @override
  String get recentFirst => 'Neueste zuerst';

  @override
  String get oldFirst => 'Älteste zuerst';

  @override
  String get orderByCategory => 'Nach Kategorie sortieren';

  @override
  String get orderByName => 'Nach Name sortieren';

  @override
  String get settings => 'Einstellungen';

  @override
  String get showData => 'Daten anzeigen';

  @override
  String get clearData => 'Daten löschen';

  @override
  String get language => 'Sprache';

  @override
  String get title => 'Titel';

  @override
  String get sum => 'Summe';

  @override
  String get date => 'Datum';

  @override
  String get category => 'Kategorie';

  @override
  String get food => 'Essen';

  @override
  String get groceries => 'Lebensmittel';

  @override
  String get transportation => 'Transport';

  @override
  String get leisure => 'Freizeit';

  @override
  String get studies => 'Studien';

  @override
  String get bills => 'Rechnungen';

  @override
  String get others => 'Andere';

  @override
  String get selectDate => 'Datum auswählen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get noExpensesAdded => 'Keine Ausgaben hinzugefügt';

  @override
  String get theme => 'Thema';

  @override
  String get dark => 'Dunkel';

  @override
  String get light => 'Hell';

  @override
  String get currency => 'Währung';

  @override
  String get color => 'Farbe';

  @override
  String get blue => 'Blau';

  @override
  String get green => 'Grün';

  @override
  String get pink => 'Rosa';

  @override
  String get gold => 'Gold';

  @override
  String get orange => 'Orange';

  @override
  String get purple => 'Lila';

  @override
  String welcomeTo(String name) {
    return 'Willkommen bei $name';
  }

  @override
  String get appDescription =>
      'Eine Applikation, die Ihnen hilft, Ihre Ausgaben zu verwalten';

  @override
  String get titleIsEmpty => 'Der Titel ist leer';

  @override
  String get sumIsEmpty => 'Die Summe ist leer';

  @override
  String get sumIsNotANumber => 'Die Summe ist keine Zahl';

  @override
  String get sumIsNegative => 'Die Summe ist negativ';

  @override
  String get error => 'Fehler';

  @override
  String get expenseDeleted => 'Ausgabe gelöscht';

  @override
  String get newExpense => 'Neue Ausgabe';

  @override
  String get editExpense => 'Ausgabe bearbeiten';

  @override
  String get undo => 'Rückgängig machen';

  @override
  String get dateNotSelected => 'Kein Datum ausgewählt';
}
