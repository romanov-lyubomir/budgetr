import 'package:flutter/material.dart';

import 'package:budgetr/widgets/chart/chart_bar.dart';
import 'package:budgetr/models/expense.dart';
import 'package:budgetr/functions/categories.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  List<ExpenseBucket> get buckets {
    List<ExpenseBucket> expenseBuckets = [];
    for (String category in categories.keys.toList()) {
      expenseBuckets.add(ExpenseBucket.forCategory(expenses, category));
    }
    return expenseBuckets;
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalAmount > maxTotalExpense) {
        maxTotalExpense = bucket.totalAmount;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(.2),
            blurRadius: 20,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary.withOpacity(.8),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final bucket in buckets) // alternative to map()
                    ChartBar(
                      fill: bucket.totalAmount == 0
                          ? 0
                          : bucket.totalAmount / maxTotalExpense,
                    )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: buckets
                  .map(
                    (bucket) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          categories[bucket.category]!['icon'],
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
