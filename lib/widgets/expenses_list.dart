import 'package:budgetr/models/expense.dart';
import 'package:budgetr/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
    required this.onEditExpense,
  });

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onRemoveExpense;
  final void Function(
          ExpenseModel expenseToBeEdited, ExpenseModel newExpenseData)
      onEditExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
          onEditExpense: onEditExpense,
        ),
      ),
    );
  }
}
