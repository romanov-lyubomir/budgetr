import 'package:budgetr/providers/expenses_provider.dart';
import 'package:budgetr/screens/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/widgets/expenses_list_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userExpenses = ref.watch(userExpensesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Budgetr',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddExpenseScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ExpensesList(
        expenses: userExpenses,
      ),
    );
  }
}
