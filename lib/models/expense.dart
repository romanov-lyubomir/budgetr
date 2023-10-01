import 'package:uuid/uuid.dart';
import 'package:budgetr/functions/formatter.dart';

const uuid = Uuid();

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<ExpenseModel> allExpenses, this.category)
      : expenses = allExpenses
            .where(
              (expense) => expense.category == category,
            )
            .toList();

  final String category;
  final List<ExpenseModel> expenses;

  double get totalAmount {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
