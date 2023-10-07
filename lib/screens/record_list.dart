import 'package:budgetr/models/expense.dart';
import 'package:budgetr/screens/record_item.dart';
import 'package:flutter/material.dart';

class RecordList extends StatelessWidget {
  const RecordList({
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
        child: RecordItem(
          expenses[index],
          onEditExpense: onEditExpense,
        ),
      ),
    );
  }
}
