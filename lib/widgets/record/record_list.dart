import 'package:budgetr/models/record.dart';
import 'package:budgetr/widgets/record/record_item.dart';
import 'package:flutter/material.dart';

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
    required this.records,
    required this.onRemoveRecords,
    required this.onEditRecord,
    required this.selectedType,
  });

  final List<RecordModel> records;
  final void Function(RecordModel record) onRemoveRecords;
  final void Function(RecordModel recordToBeEdited, RecordModel newRecordData)
      onEditRecord;
  final String selectedType;

  @override
  Widget build(BuildContext context) {
    // var filteredRecords = records.where((record) {
    //   return record.type == selectedType;
    // }).toList();
    var filteredRecords = [];
    if (selectedType == 'All') {
      filteredRecords = records;
    } else {
      filteredRecords = records.where((record) {
        return record.type == selectedType;
      }).toList();
    }
    return ListView.builder(
      itemCount: filteredRecords.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(filteredRecords[index]),
        onDismissed: (direction) {
          onRemoveRecords(filteredRecords[index]);
        },
        child: RecordItem(
          filteredRecords[index],
          onEditRecord: onEditRecord,
        ),
      ),
    );
  }
}
