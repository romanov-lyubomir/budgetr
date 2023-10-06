import 'dart:io';

import 'package:budgetr/functions/currencies.dart';
import 'package:budgetr/functions/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/models/expense.dart';
import 'package:budgetr/functions/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:budgetr/functions/categories.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditExpense extends StatefulWidget {
  const EditExpense({
    Key? key,
    required this.onEditExpense,
    required this.expenseToBeEdited,
  }) : super(key: key);

  final void Function(
    ExpenseModel expenseToBeEdited,
    ExpenseModel newExpenseData,
  ) onEditExpense;
  final ExpenseModel expenseToBeEdited;

  @override
  State<EditExpense> createState() => _EditExpenseState();
}

class _EditExpenseState extends State<EditExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  late String _selectedCategory;
  late DateTime _selectedDate;
  late Icon _selectedCategoryIcon;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.expenseToBeEdited.title;
    _selectedDate = widget.expenseToBeEdited.date;
    _selectedCategory = widget.expenseToBeEdited.category;
    _amountController.text = widget.expenseToBeEdited.amount.toString();
    _selectedCategoryIcon = Icon(
      categories[widget.expenseToBeEdited.category]!['icon'],
    );
  }

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
        title: const Text('Edit expense'),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                    maxLength: 50,
                  ),
                  TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      suffix: Text(
                        allCurrencies[appDataBox.get(
                          'currency',
                          defaultValue: 'EUR',
                        )]!,
                      ),
                      labelText: 'Sum',
                    ),
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _selectedCategoryIcon,
                    title: Text(
                      AppLocalizations.of(context)?.category ?? 'Category',
                      style: TextStyle(
                        color: Theme.of(context)
                            .inputDecorationTheme
                            .labelStyle!
                            .color,
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
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .labelStyle!
                                        .color,
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
                                            categories[supportedCategory]![
                                                'icon'],
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
                                                  categories[
                                                          supportedCategory]![
                                                      'icon']);
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
                        formatter.format(_selectedDate),
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
                            if (pickedDate == null) return;
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
                        child: const Text('Cancel'),
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
                            widget.onEditExpense(
                              ExpenseModel(
                                title: widget.expenseToBeEdited.title,
                                amount: widget.expenseToBeEdited.amount,
                                date: widget.expenseToBeEdited.date,
                                category: widget.expenseToBeEdited.category,
                              ),
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
                                      child: const Text("OK"),
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
                                      child: const Text("OK"),
                                    )
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Save'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
