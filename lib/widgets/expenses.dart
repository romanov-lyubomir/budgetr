import 'package:budgetr/functions/hive_boxes.dart';
import 'package:budgetr/widgets/chart/chart.dart';
import 'package:budgetr/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/models/expense.dart';
import 'package:budgetr/widgets/expenses_list.dart';
import 'package:budgetr/screens/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:budgetr/widgets/drawer.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
    required this.onChangeTheme,
    required this.onChangeColor,
    required this.onChangeCurrency,
  });

  final void Function(String) onChangeTheme;
  final void Function(String) onChangeColor;
  final void Function(String) onChangeCurrency;

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  _changeOrder(newExpenses) {
    setState(() {
      _registeredExpenses = newExpenses;
    });
  }

  List<ExpenseModel> _registeredExpenses = [];

  void _addExpense(ExpenseModel expense) {
    setState(() {
      expensesBox.add([
        expense.title,
        expense.amount,
        expense.date,
        expense.category,
      ]);
    });
  }

  void _deleteExpense(ExpenseModel expense) {
    final index = _registeredExpenses.indexOf(expense);
    setState(() {
      expensesBox.deleteAt(index);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Expense deleted',
        ),
        duration: const Duration(
          seconds: 2,
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expensesBox.add(
                [
                  expense.title,
                  expense.amount,
                  expense.date,
                  expense.category,
                ],
              );
            });
          },
        ),
      ),
    );
  }

  void _editExpense(
      ExpenseModel expenseToBeEdited, ExpenseModel newExpenseData) {
    final index = _registeredExpenses.indexWhere(
      (expense) =>
          expense.title == expenseToBeEdited.title &&
          expense.amount == expenseToBeEdited.amount &&
          expense.date == expenseToBeEdited.date &&
          expense.category == expenseToBeEdited.category,
    );
    setState(() {
      expensesBox.putAt(
        index,
        [
          newExpenseData.title,
          newExpenseData.amount,
          newExpenseData.date,
          newExpenseData.category,
        ],
      );
    });
  }

  void _clearExpenses() {
    expensesBox.clear();
    setState(() {
      _registeredExpenses = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    _registeredExpenses = expensesBox.values
        .toList()
        .map(
          (e) => ExpenseModel(
            title: e[0],
            amount: e[1],
            date: e[2],
            category: e[3],
          ),
        )
        .toList();
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        AppLocalizations.of(context)?.noExpensesAdded ?? 'No expenses added',
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _deleteExpense,
        onEditExpense: _editExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => SettingsScreen(
                    onClearExpenses: _clearExpenses,
                    onChangeTheme: widget.onChangeTheme,
                    onChangeColor: widget.onChangeColor,
                    onChangeCurrency: widget.onChangeCurrency,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => NewExpense(
                    onAddExpense: _addExpense,
                  ),
                ),
              );
            },
          ),
        ],
        title: const Text(
          'Budgetr',
        ),
      ),
      drawer: MainDrawer(
        registeredExpenses: _registeredExpenses,
        onChangeOrder: _changeOrder,
      ),
      body: width < 600
          ? Column(
              children: <Widget>[
                Chart(
                  expenses: _registeredExpenses,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: <Widget>[
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
