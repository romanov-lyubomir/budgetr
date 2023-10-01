import 'dart:io';

import 'package:budgetr/functions/get_theme.dart';
import 'package:budgetr/functions/formatter.dart';
import 'package:budgetr/functions/hive_boxes.dart';
import 'package:budgetr/models/expense.dart';
import 'package:budgetr/functions/categories.dart';
import 'package:budgetr/functions/currencies.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(ExpenseModel) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  String _selectedCategory = categories.keys.toList()[2];
  Icon _selectedCategoryIcon = Icon(categories[categories.keys.toList()[2]]);
  var selectedCurrency = appDataBox.get('currency', defaultValue: 'EUR');

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Expense'),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context)?.title ?? 'Title',
                      ),
                      style: TextStyle(
                        color: getTheme(context) != 'dark'
                            ? const Color(0xFF534341)
                            : const Color.fromARGB(255, 182, 159, 156),
                      ),
                      maxLength: 50,
                    ),
                    TextField(
                      controller: _amountController,
                      style: TextStyle(
                        color: getTheme(context) != 'dark'
                            ? const Color(0xFF534341)
                            : const Color.fromARGB(255, 182, 159, 156),
                      ),
                      decoration: InputDecoration(
                        suffix: Text(' ${allCurrencies[selectedCurrency]}'),
                        labelText: AppLocalizations.of(context)?.sum ?? 'Sum',
                      ),
                      maxLength: 50,
                      keyboardType: TextInputType.number,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: _selectedCategoryIcon,
                      title: Text(
                        AppLocalizations.of(context)?.category ?? 'Category',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: getTheme(context) != 'dark'
                                  ? const Color(0xFF534341)
                                  : const Color.fromARGB(255, 182, 159, 156),
                            ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            supportedCategoriesLang(
                              context,
                              _selectedCategory,
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: getTheme(context) != 'dark'
                                      ? const Color(0xFF534341)
                                      : const Color.fromARGB(
                                          255, 182, 159, 156),
                                ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          useSafeArea: true,
                          context: context,
                          builder: (ctx) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: double.infinity,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    ...categories.keys.toList().map(
                                          (supportedCategory) => ListTile(
                                            leading: Icon(
                                              categories[supportedCategory],
                                            ),
                                            title: Text(
                                              supportedCategoriesLang(
                                                context,
                                                supportedCategory,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _selectedCategory =
                                                    supportedCategory;
                                                _selectedCategoryIcon = Icon(
                                                  categories[supportedCategory],
                                                );
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          _selectedDate == null
                              ? AppLocalizations.of(context)?.date ?? 'Date'
                              : formatter
                                  .format(_selectedDate ?? DateTime.now()),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: getTheme(context) != 'dark'
                                    ? const Color(0xFF534341)
                                    : const Color.fromARGB(255, 182, 159, 156),
                              ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final firstDate =
                                DateTime(now.year - 1, now.month, now.day);
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: firstDate,
                              lastDate: now,
                            );
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)?.cancel ?? 'Cancel',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final enteredAmount = _amountController.text.trim();
                            final title = _titleController.text.trim();
                            final parsedEnteredAmount = double.tryParse(
                              _amountController.text.trim(),
                            );
                            final date = _selectedDate;
                            final category = _selectedCategory;
                            try {
                              if (title.isEmpty) throw 'Title is empty';
                              if (enteredAmount.isEmpty) throw 'Sum is empty';
                              if (parsedEnteredAmount == null) {
                                throw 'Amount is not a number';
                              }
                              if (parsedEnteredAmount < 0) {
                                throw 'Amount is negative';
                              }
                              if (date == null) throw 'Date is not selected';
                              widget.onAddExpense(
                                ExpenseModel(
                                  title: title,
                                  amount: parsedEnteredAmount,
                                  date: date,
                                  category: category,
                                ),
                              );
                              Navigator.pop(context);
                            } catch (e) {
                              if (Platform.isIOS || Platform.isMacOS) {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (ctx) => CupertinoAlertDialog(
                                    title: const Text('Error'),
                                    content: Text(e.toString()),
                                    actions: [
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Error'),
                                    content: Text(e.toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      )
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context)?.save ?? 'Save',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}