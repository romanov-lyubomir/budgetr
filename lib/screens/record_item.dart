import 'package:budgetr/functions/currencies.dart';
import 'package:budgetr/functions/hive_boxes.dart';
import 'package:budgetr/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/functions/currency_format.dart';
import 'package:budgetr/functions/categories.dart';
import 'package:budgetr/screens/record_edit.dart';

class RecordItem extends StatefulWidget {
  const RecordItem(this.expense, {required this.onEditExpense, super.key});

  final ExpenseModel expense;
  final void Function(
          ExpenseModel expenseToBeEdited, ExpenseModel newExpenseData)
      onEditExpense;

  @override
  State<RecordItem> createState() => _RecordItemState();
}

class _RecordItemState extends State<RecordItem> {
  @override
  Widget build(BuildContext context) {
    var currency = allCurrencies[appDataBox.get(
      'currency',
      defaultValue: 'EUR',
    )];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecordEdit(
              expenseToBeEdited: widget.expense,
              onEditExpense: widget.onEditExpense,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: categories[widget.expense.category]!['color']
                      .withOpacity(0.4) ??
                  Colors.grey.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Card(
          color: categories[widget.expense.category]!['color'],
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.expense.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            currencyFormat(
                              widget.expense.amount,
                              currency!,
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                categories[widget.expense.category]!['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                widget.expense.formattedDate,
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
