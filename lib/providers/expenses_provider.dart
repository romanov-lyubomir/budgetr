import 'package:budgetr/models/expense_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesNotifier extends StateNotifier<List<ExpenseModel>> {
  ExpensesNotifier() : super(const []);

  void addExpense(String title) {
    final newExpense = ExpenseModel(title: title);
    state = [...state, newExpense];
  }
}

final userExpensesProvider =
    StateNotifierProvider<ExpensesNotifier, List<ExpenseModel>>(
  (ref) => ExpensesNotifier(),
);
