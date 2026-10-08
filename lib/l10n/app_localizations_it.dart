// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get user_language => 'Italiano';

  @override
  String get languageFlagCode => 'it';

  @override
  String get filtersAndOrder => 'Filtri e ordine';

  @override
  String get orderBySum => 'Ordina per somma';

  @override
  String get lowToHigh => 'Basso ad alto';

  @override
  String get highToLow => 'Alto a basso';

  @override
  String get orderByDate => 'Ordina per data';

  @override
  String get recentFirst => 'Recente prima';

  @override
  String get oldFirst => 'Vecchio prima';

  @override
  String get orderByCategory => 'Ordina per categoria';

  @override
  String get orderByName => 'Ordina per nome';

  @override
  String get settings => 'Impostazioni';

  @override
  String get showData => 'Mostra dati';

  @override
  String get clearData => 'Cancella dati';

  @override
  String get language => 'Lingua';

  @override
  String get title => 'Titolo';

  @override
  String get sum => 'Somma';

  @override
  String get date => 'Data';

  @override
  String get category => 'Categoria';

  @override
  String get food => 'Cibo';

  @override
  String get groceries => 'Spesa';

  @override
  String get transportation => 'Trasporto';

  @override
  String get leisure => 'Tempo libero';

  @override
  String get studies => 'Studi';

  @override
  String get bills => 'Conti';

  @override
  String get others => 'Altri';

  @override
  String get selectDate => 'Seleziona data';

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get noExpensesAdded => 'Nessuna spesa aggiunta';

  @override
  String get theme => 'Tema';

  @override
  String get dark => 'Scuro';

  @override
  String get light => 'Chiaro';

  @override
  String get currency => 'Moneta';

  @override
  String get color => 'Colore';

  @override
  String get blue => 'Blu';

  @override
  String get green => 'Verde';

  @override
  String get pink => 'Rosa';

  @override
  String get gold => 'Oro';

  @override
  String get orange => 'Arancione';

  @override
  String get purple => 'Viola';

  @override
  String welcomeTo(String name) {
    return 'Benvenuti a $name';
  }

  @override
  String get appDescription =>
      'Un\'applicazione per tenere traccia delle spese.';

  @override
  String get titleIsEmpty => 'Il titolo è vuoto';

  @override
  String get sumIsEmpty => 'La somma è vuota';

  @override
  String get sumIsNotANumber => 'La somma non è un numero';

  @override
  String get sumIsNegative => 'La somma è negativa';

  @override
  String get error => 'Errore';

  @override
  String get expenseDeleted => 'Spesa eliminata';

  @override
  String get newExpense => 'Nuova spesa';

  @override
  String get editExpense => 'Modifica spesa';

  @override
  String get undo => 'Annulla';

  @override
  String get dateNotSelected => 'Nessuna data selezionata';
}
