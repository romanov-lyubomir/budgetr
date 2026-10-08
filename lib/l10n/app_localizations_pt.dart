// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get user_language => 'Português';

  @override
  String get languageFlagCode => 'br';

  @override
  String get filtersAndOrder => 'Filtros e ordem';

  @override
  String get orderBySum => 'Ordenar por soma';

  @override
  String get lowToHigh => 'Baixo para alto';

  @override
  String get highToLow => 'Alto para baixo';

  @override
  String get orderByDate => 'Ordenar por data';

  @override
  String get recentFirst => 'Recente primeiro';

  @override
  String get oldFirst => 'Antigo primeiro';

  @override
  String get orderByCategory => 'Ordenar por categoria';

  @override
  String get orderByName => 'Ordenar por nome';

  @override
  String get settings => 'Configurações';

  @override
  String get showData => 'Mostrar dados';

  @override
  String get clearData => 'Limpar dados';

  @override
  String get language => 'Idioma';

  @override
  String get title => 'Título';

  @override
  String get sum => 'Soma';

  @override
  String get date => 'Data';

  @override
  String get category => 'Categoria';

  @override
  String get food => 'Comida';

  @override
  String get groceries => 'Mantenimentos';

  @override
  String get transportation => 'Transporte';

  @override
  String get leisure => 'Lazer';

  @override
  String get studies => 'Estudos';

  @override
  String get bills => 'Contas';

  @override
  String get others => 'Outros';

  @override
  String get selectDate => 'Selecione a data';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get noExpensesAdded => 'Nenhuma despesa adicionada';

  @override
  String get theme => 'Tema';

  @override
  String get dark => 'Escuro';

  @override
  String get light => 'Claro';

  @override
  String get currency => 'Moeda';

  @override
  String get color => 'Cor';

  @override
  String get blue => 'Azul';

  @override
  String get green => 'Verde';

  @override
  String get pink => 'Rosa';

  @override
  String get gold => 'Ouro';

  @override
  String get orange => 'Laranja';

  @override
  String get purple => 'Roxo';

  @override
  String welcomeTo(String name) {
    return 'Bem-vindos ao $name';
  }

  @override
  String get appDescription => 'Uma aplicação para gerenciar suas despesas.';

  @override
  String get titleIsEmpty => 'O título está vazio';

  @override
  String get sumIsEmpty => 'A soma está vazia';

  @override
  String get sumIsNotANumber => 'A soma não é um número';

  @override
  String get sumIsNegative => 'A soma é negativa';

  @override
  String get error => 'Erro';

  @override
  String get expenseDeleted => 'Despesa excluída';

  @override
  String get newExpense => 'Nova despesa';

  @override
  String get editExpense => 'Editar despesa';

  @override
  String get undo => 'Desfazer';

  @override
  String get dateNotSelected => 'Nenhuma data selecionada';
}
