// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get user_language => 'English';

  @override
  String get languageFlagCode => 'us';

  @override
  String get filtersAndOrder => 'Filters and order';

  @override
  String get orderBySum => 'Order by sum';

  @override
  String get lowToHigh => 'Low to high';

  @override
  String get highToLow => 'High to low';

  @override
  String get orderByDate => 'Order by date';

  @override
  String get recentFirst => 'Recent first';

  @override
  String get oldFirst => 'Old first';

  @override
  String get orderByCategory => 'Order by category';

  @override
  String get orderByName => 'Order by name';

  @override
  String get settings => 'Settings';

  @override
  String get showData => 'Show data';

  @override
  String get clearData => 'Clear data';

  @override
  String get language => 'Language';

  @override
  String get title => 'Title';

  @override
  String get sum => 'Sum';

  @override
  String get date => 'Date';

  @override
  String get category => 'Category';

  @override
  String get food => 'Food';

  @override
  String get groceries => 'Groceries';

  @override
  String get transportation => 'Transportation';

  @override
  String get leisure => 'Leisure';

  @override
  String get studies => 'Studies';

  @override
  String get bills => 'Bills';

  @override
  String get others => 'Others';

  @override
  String get selectDate => 'Select date';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get noExpensesAdded => 'No expenses added';

  @override
  String get theme => 'Theme';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get currency => 'Currency';

  @override
  String get color => 'Color';

  @override
  String get blue => 'Blue';

  @override
  String get green => 'Green';

  @override
  String get pink => 'Pink';

  @override
  String get gold => 'Gold';

  @override
  String get orange => 'Orange';

  @override
  String get purple => 'Purple';

  @override
  String welcomeTo(String name) {
    return 'Welcome to $name';
  }

  @override
  String get appDescription => 'An app to manage your expenses';

  @override
  String get titleIsEmpty => 'Title is empty';

  @override
  String get sumIsEmpty => 'Sum is empty';

  @override
  String get sumIsNotANumber => 'Sum is not a number';

  @override
  String get sumIsNegative => 'Sum is negative';

  @override
  String get error => 'Error';

  @override
  String get expenseDeleted => 'Expense deleted';

  @override
  String get newExpense => 'New expense';

  @override
  String get editExpense => 'Edit expense';

  @override
  String get undo => 'Undo';

  @override
  String get dateNotSelected => 'Date is not selected';
}
