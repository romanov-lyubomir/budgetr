import 'dart:io';

import 'package:budgetr/global/formatter.dart';
import 'package:budgetr/global/hive_boxes.dart';
import 'package:budgetr/models/record.dart';
import 'package:budgetr/global/categories.dart';
import 'package:budgetr/global/currencies.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:budgetr/l10n/app_localizations.dart';
import 'package:budgetr/widgets/record/new/record_new_custom_text_field.dart';
import 'package:budgetr/widgets/record/new/record_new_custom_list_tile.dart';
import 'package:budgetr/global/show_custom_bottom_sheet.dart';

class RecordNew extends StatefulWidget {
  const RecordNew({super.key, required this.onAddRecord});

  final void Function(RecordModel) onAddRecord;

  @override
  State<RecordNew> createState() {
    return _RecordNewState();
  }
}

class _RecordNewState extends State<RecordNew> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

  String _selectedCategory = categories.keys.toList()[2];
  Icon _selectedCategoryIcon = Icon(categories.values.toList()[2]['icon']);

  String _selectedType = 'Expense';
  Icon recordTypeIcon = const Icon(Icons.money_off_rounded);

  String selectedCurrency = appDataBox.get('currency', defaultValue: 'EUR');

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submit() {
    final enteredAmount = _amountController.text.trim();
    final parsedEnteredAmount = double.tryParse(enteredAmount);
    final title = _titleController.text.trim();
    final date = _selectedDate;
    final category = _selectedCategory;
    try {
      if (title.isEmpty) {
        throw AppLocalizations.of(context)?.titleIsEmpty ?? 'Title is empty';
      }
      if (enteredAmount.isEmpty) {
        throw AppLocalizations.of(context)?.sumIsEmpty ?? 'Sum is empty';
      }
      if (parsedEnteredAmount == null) {
        throw AppLocalizations.of(context)?.sumIsNotANumber ??
            'Sum is not a number';
      }
      if (parsedEnteredAmount < 0) {
        throw AppLocalizations.of(context)?.sumIsNegative ?? 'Sum is negative';
      }
      if (date == null) {
        throw AppLocalizations.of(context)?.dateNotSelected ??
            'Date is not selected';
      }
      widget.onAddRecord(
        RecordModel(
          title: title,
          amount: parsedEnteredAmount,
          date: date,
          category: category,
          type: _selectedType,
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
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(AppLocalizations.of(context)?.error ?? 'Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Record',
          // ! Translate
        ),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    controller: _titleController,
                    labelText: AppLocalizations.of(context)?.title ?? 'Title',
                  ),
                  CustomTextField(
                    controller: _amountController,
                    labelText: AppLocalizations.of(context)?.sum ?? 'Sum',
                    suffixText: allCurrencies[selectedCurrency],
                  ),
                  CustomListTile(
                    leading: recordTypeIcon,
                    title: "Type",
                    trailing: supportedCategoriesLang(
                      context,
                      _selectedCategory,
                    ),
                    onTap: () {
                      // showModalBottomSheet(
                      //   isScrollControlled: true,
                      //   useSafeArea: true,
                      //   context: context,
                      //   builder: (ctx) => SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.5,
                      //     width: double.infinity,
                      //     child: SingleChildScrollView(
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(20.0),
                      //         child: Column(
                      //           children: [
                      //             const SizedBox(height: 20),
                      //             ListTile(
                      //               leading: const Icon(
                      //                 Icons.money_off_rounded,
                      //               ),
                      //               title: const Text(
                      //                 'Expense',
                      //               ),
                      //               onTap: () {
                      //                 setState(() {
                      //                   recordTypeIcon =
                      //                       const Icon(Icons.money_off_rounded);
                      //                   _selectedType = 'Expense';
                      //                 });
                      //                 Navigator.of(context).pop();
                      //               },
                      //             ),
                      //             ListTile(
                      //               leading: const Icon(
                      //                 Icons.attach_money_rounded,
                      //               ),
                      //               title: const Text(
                      //                 "Income",
                      //               ),
                      //               onTap: () {
                      //                 setState(() {
                      //                   recordTypeIcon = const Icon(
                      //                       Icons.attach_money_rounded);
                      //                   _selectedType = 'Income';
                      //                 });
                      //                 Navigator.of(context).pop();
                      //               },
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // );
                      showCustomBottomSheet(
                        context: context,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.money_off_rounded,
                                    ),
                                    title: const Text('Expense'),
                                    onTap: () {
                                      setState(() {
                                        recordTypeIcon = const Icon(
                                          Icons.money_off_rounded,
                                        );
                                        _selectedType = 'Expense';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.attach_money_rounded,
                                    ),
                                    title: const Text("Income"),
                                    onTap: () {
                                      setState(() {
                                        recordTypeIcon = const Icon(
                                          Icons.attach_money_rounded,
                                        );
                                        _selectedType = 'Income';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                      );
                    },
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
                          supportedCategoriesLang(context, _selectedCategory),
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
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
                                        categories[supportedCategory]!['icon'],
                                      ),
                                      title: Text(
                                        supportedCategoriesLang(
                                          context,
                                          supportedCategory,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedCategory = supportedCategory;
                                          _selectedCategoryIcon = Icon(
                                            categories[supportedCategory]!['icon'],
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
                            : formatter.format(_selectedDate ?? DateTime.now()),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle!
                                  .color,
                            ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final now = DateTime.now();
                          final firstDate = DateTime(
                            now.year - 1,
                            now.month,
                            now.day,
                          );
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
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _submit();
                        },
                        child: Text(
                          AppLocalizations.of(context)?.save ?? 'Save',
                        ),
                      ),
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

// class RecordNewSum extends StatelessWidget {
//   const RecordNewSum({
//     super.key,
//     required TextEditingController amountController,
//     required this.selectedCurrency,
//   }) : _amountController = amountController;

//   final TextEditingController _amountController;
//   final String selectedCurrency;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _amountController,
//       decoration: InputDecoration(
//         suffix: Text(' ${allCurrencies[selectedCurrency]}'),
//         labelText: AppLocalizations.of(context)?.sum ?? 'Sum',
//       ),
//       style: TextStyle(
//         color: Theme.of(context).inputDecorationTheme.labelStyle!.color,
//       ),
//       maxLength: 50,
//       keyboardType: TextInputType.number,
//     );
//   }
// }

// class RecordNewTitle extends StatelessWidget {
//   const RecordNewTitle({
//     super.key,
//     required TextEditingController titleController,
//   }) : _titleController = titleController;

//   final TextEditingController _titleController;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _titleController,
//       decoration: InputDecoration(
//         labelText: AppLocalizations.of(context)?.title ?? 'Title',
//       ),
//       style: TextStyle(
//         color: Theme.of(context).inputDecorationTheme.labelStyle!.color,
//       ),
//       maxLength: 50,
//     );
//   }
// }
