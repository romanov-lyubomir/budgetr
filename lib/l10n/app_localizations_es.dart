// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get user_language => 'Español';

  @override
  String get languageFlagCode => 'es';

  @override
  String get filtersAndOrder => 'Filtros y orden';

  @override
  String get orderBySum => 'Ordenar por suma';

  @override
  String get lowToHigh => 'De menor a mayor';

  @override
  String get highToLow => 'De mayor a menor';

  @override
  String get orderByDate => 'Ordenar por fecha';

  @override
  String get recentFirst => 'Más recientes primero';

  @override
  String get oldFirst => 'Más viejos primero';

  @override
  String get orderByCategory => 'Ordenar por categoría';

  @override
  String get orderByName => 'Ordenar por nombre';

  @override
  String get settings => 'Configuración';

  @override
  String get showData => 'Mostrar datos';

  @override
  String get clearData => 'Borrar datos';

  @override
  String get language => 'Idioma';

  @override
  String get title => 'Título';

  @override
  String get sum => 'Suma';

  @override
  String get date => 'Fecha';

  @override
  String get category => 'Categoría';

  @override
  String get food => 'Comida';

  @override
  String get groceries => 'Comestibles';

  @override
  String get transportation => 'Transporte';

  @override
  String get leisure => 'Ocio';

  @override
  String get studies => 'Estudios';

  @override
  String get bills => 'Facturas';

  @override
  String get others => 'Otros';

  @override
  String get selectDate => 'Seleccionar fecha';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get noExpensesAdded => 'Sin gastos añadidos';

  @override
  String get theme => 'Modo';

  @override
  String get dark => 'Oscuro';

  @override
  String get light => 'Claro';

  @override
  String get currency => 'Moneda';

  @override
  String get color => 'Color';

  @override
  String get blue => 'Azul';

  @override
  String get green => 'Verde';

  @override
  String get pink => 'Rosa';

  @override
  String get gold => 'Oro';

  @override
  String get orange => 'Naranja';

  @override
  String get purple => 'Morado';

  @override
  String welcomeTo(String name) {
    return 'Bienvenidos a $name';
  }

  @override
  String get appDescription => 'Una aplicación para gestionar sus gastos.';

  @override
  String get titleIsEmpty => 'El título está vacío';

  @override
  String get sumIsEmpty => 'La suma está vacía';

  @override
  String get sumIsNotANumber => 'La suma no es un número';

  @override
  String get sumIsNegative => 'La suma es negativa';

  @override
  String get error => 'Error';

  @override
  String get expenseDeleted => 'Gasto eliminado';

  @override
  String get newExpense => 'Nuevo gasto';

  @override
  String get editExpense => 'Editar gasto';

  @override
  String get undo => 'Deshacer';

  @override
  String get dateNotSelected => 'Ninguna fecha seleccionada';
}
