// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get user_language => 'Български';

  @override
  String get languageFlagCode => 'bg';

  @override
  String get filtersAndOrder => 'Филтри и подредба';

  @override
  String get orderBySum => 'Подреди по сума';

  @override
  String get lowToHigh => 'Ниска към висока';

  @override
  String get highToLow => 'Висока към ниска';

  @override
  String get orderByDate => 'Подреди по дата';

  @override
  String get recentFirst => 'От стари към нови';

  @override
  String get oldFirst => 'От нови към стари';

  @override
  String get orderByCategory => 'Подреди по категория';

  @override
  String get orderByName => 'Подреди по име';

  @override
  String get settings => 'Настройки';

  @override
  String get showData => 'Покажи данните';

  @override
  String get clearData => 'Изчисти данните';

  @override
  String get language => 'Език';

  @override
  String get title => 'Заглавие';

  @override
  String get sum => 'Сума';

  @override
  String get date => 'Дата';

  @override
  String get category => 'Категория';

  @override
  String get food => 'Храна';

  @override
  String get groceries => 'Покупки';

  @override
  String get transportation => 'Транспорт';

  @override
  String get leisure => 'Свободно време';

  @override
  String get studies => 'Учене';

  @override
  String get bills => 'Сметки';

  @override
  String get others => 'Други';

  @override
  String get selectDate => 'Избор на дата';

  @override
  String get cancel => 'Отказ';

  @override
  String get save => 'Запази';

  @override
  String get noExpensesAdded => 'Няма добавени разходи';

  @override
  String get theme => 'Тема';

  @override
  String get dark => 'Тъмна';

  @override
  String get light => 'Светла';

  @override
  String get currency => 'Валута';

  @override
  String get color => 'Цвят';

  @override
  String get blue => 'Синьо';

  @override
  String get green => 'Зелено';

  @override
  String get pink => 'Розово';

  @override
  String get gold => 'Златно';

  @override
  String get orange => 'Оранжево';

  @override
  String get purple => 'Лилаво';

  @override
  String welcomeTo(String name) {
    return 'Добре дошли в $name';
  }

  @override
  String get appDescription => 'Приложение за управление на Вашите разходи';

  @override
  String get titleIsEmpty => 'Полето за заглавието е празно';

  @override
  String get sumIsEmpty => 'Полето за сумата е празно';

  @override
  String get sumIsNotANumber => 'Сумата не е число';

  @override
  String get sumIsNegative => 'Сумата е отрицателна';

  @override
  String get error => 'Грешка';

  @override
  String get expenseDeleted => 'Разходът е изтрит';

  @override
  String get newExpense => 'Нов разход';

  @override
  String get editExpense => 'Редактиране на разход';

  @override
  String get undo => 'Отмяна';

  @override
  String get dateNotSelected => 'Hе е избрана дата';
}
