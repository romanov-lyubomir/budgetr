import 'package:budgetr/functions/hive_boxes.dart';
import 'package:budgetr/widgets/chart/chart.dart';
import 'package:budgetr/screens/record_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/models/expense.dart';
import 'package:budgetr/screens/record_list.dart';
import 'package:budgetr/screens/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.onChangeTheme,
    required this.onChangeColor,
    required this.onChangeCurrency,
  });

  final void Function(String) onChangeTheme;
  final void Function(String) onChangeColor;
  final void Function(String) onChangeCurrency;

  @override
  State<MainPage> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
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
        content: Text(
          AppLocalizations.of(context)?.expenseDeleted ?? 'Expense deleted',
        ),
        duration: const Duration(
          seconds: 2,
        ),
        action: SnackBarAction(
          label: AppLocalizations.of(context)?.undo ?? 'Undo',
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

  var selectedList = "Expenses";
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
      mainContent = RecordList(
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
        ],
        title: const Text(
          'Budgetr',
        ),
      ),
      body: width < 600
          ? Column(
              children: <Widget>[
                Chart(
                  expenses: _registeredExpenses,
                ),
                CupertinoSegmentedControl(
                  groupValue: selectedList,
                  children: const {
                    "Expenses": Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Expenses"),
                    ),
                    "Income": Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Income"),
                    ),
                    "All": Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("All"),
                    ),
                  },
                  onValueChanged: (String value) {
                    setState(() {
                      selectedList = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    {
                      "Expenses": 'Saved Expenses',
                      "Income": 'Saved Income',
                      "All": 'All saved records',
                    }[selectedList]!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => RecordNew(
                            onAddExpense: _addExpense,
                          ),
                        ),
                      );
                    },
                  ),
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
