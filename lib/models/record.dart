import 'package:uuid/uuid.dart';
import 'package:budgetr/global/formatter.dart';

const uuid = Uuid();

class RecordModel {
  RecordModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final String type;

  String get formattedDate {
    return formatter.format(date);
  }
}

class RecordBucket {
  RecordBucket({
    required this.category,
    required this.records,
  });

  RecordBucket.forCategory(List<RecordModel> allRecords, this.category)
      : records = allRecords
            .where(
              (record) => record.category == category,
            )
            .toList();

  final String category;
  final List<RecordModel> records;

  double get totalAmount {
    double sum = 0;
    for (final record in records) {
      sum += record.amount;
    }
    return sum;
  }
}
