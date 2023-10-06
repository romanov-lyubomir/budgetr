import 'package:budgetr/functions/currencies.dart';
import 'package:budgetr/functions/hive_boxes.dart';
import 'package:budgetr/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/functions/currency_format.dart';
import 'package:budgetr/functions/categories.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem(this.expense, {required this.onEditExpense, super.key});

  final ExpenseModel expense;
  final void Function(
          ExpenseModel expenseToBeEdited, ExpenseModel newExpenseData)
      onEditExpense;

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  @override
  Widget build(BuildContext context) {
    var currency = allCurrencies[appDataBox.get(
      'currency',
      defaultValue: 'EUR',
    )];
    return GestureDetector(
      onTap: () {
        widget.onEditExpense(
          widget.expense,
          ExpenseModel(
            title: widget.expense.title,
            amount: widget.expense.amount,
            category: widget.expense.category,
            date: widget.expense.date,
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
                        style: Theme.of(context).textTheme.titleLarge,
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
