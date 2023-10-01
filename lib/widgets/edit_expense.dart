import 'dart:io';

import 'package:flutter/material.dart';
import 'package:budgetr/models/expense.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:budgetr/functions/categories.dart';

final formatter = DateFormat.yMd();

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
  DateTime? _selectedDate;
  String _selectedCategory = "Leisure";

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.expenseToBeEdited.title;
    _selectedDate = widget.expenseToBeEdited.date;
    _selectedCategory = widget.expenseToBeEdited.category;
    _amountController.text = widget.expenseToBeEdited.amount.toString();
  }

  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                    maxLength: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          decoration: const InputDecoration(
                            suffix: Text(' €'),
                            labelText: 'Sum',
                          ),
                          maxLength: 50,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? 'Selected Date'
                                  : formatter.format(_selectedDate!),
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
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: categories.keys.toList().map(
                          (category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            if (value == null) {
                              return;
                            }
                            _selectedCategory = value;
                          });
                        },
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
                          // Dirty variables
                          final enteredAmount = _amountController.text.trim();

                          // Clean variables
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
          ),
        );
      },
    );
  }
}
