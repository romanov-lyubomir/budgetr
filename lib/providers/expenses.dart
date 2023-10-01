import 'package:budgetr/models/expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesNotifier extends StateNotifier<List<ExpenseModel>> {
  ExpensesNotifier() : super(const []);

  void addExpense(ExpenseModel expense) {
    state = [...state, expense];
  }
}

final expensesProvider =
    StateNotifierProvider<ExpensesNotifier, List<ExpenseModel>>(
  (ref) => ExpensesNotifier(),
);
