import 'package:budgetr/global/currencies.dart';
import 'package:budgetr/global/hive_boxes.dart';
import 'package:budgetr/models/record.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/global/currency_format.dart';
import 'package:budgetr/global/categories.dart';
import 'package:budgetr/widgets/record/record_edit.dart';

class RecordItem extends StatefulWidget {
  const RecordItem(this.record, {required this.onEditRecord, super.key});

  final RecordModel record;
  final void Function(RecordModel expenseToBeEdited, RecordModel newExpenseData)
      onEditRecord;

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
              recordToBeEdited: widget.record,
              onEditRecord: widget.onEditRecord,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: categories[widget.record.category]!['color']
                      .withOpacity(0.4) ??
                  Colors.grey.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Card(
          color: categories[widget.record.category]!['color'],
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
                        widget.record.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            currencyFormat(
                              widget.record.amount,
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
                                categories[widget.record.category]!['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                widget.record.formattedDate,
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
