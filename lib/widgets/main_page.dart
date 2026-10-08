import 'package:budgetr/global/hive_boxes.dart';
import 'package:budgetr/widgets/chart/chart.dart';
import 'package:budgetr/widgets/record/new/record_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/models/record.dart';
import 'package:budgetr/widgets/record/record_list.dart';
import 'package:budgetr/widgets/settings/settings.dart';
import 'package:budgetr/l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.onChangeTheme,
    required this.onChangeColor,
    required this.onChangeCurrency,
    required this.onChangeLanguage,
  });

  final void Function(String) onChangeTheme;
  final void Function(String) onChangeColor;
  final void Function(String) onChangeCurrency;
  final void Function(String) onChangeLanguage;

  @override
  State<MainPage> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  List<RecordModel> _registeredRecords = [];

  void _addRecord(RecordModel record) {
    setState(() {
      recordsBox.add([
        record.title,
        record.amount,
        record.date,
        record.category,
        record.type,
      ]);
    });
  }

  void _deleteRecord(RecordModel record) {
    final index = _registeredRecords.indexOf(record);
    setState(() {
      recordsBox.deleteAt(index);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Record deleted'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: AppLocalizations.of(context)?.undo ?? 'Undo',
          onPressed: () {
            setState(() {
              recordsBox.add([
                record.title,
                record.amount,
                record.date,
                record.category,
                record.type,
              ]);
            });
          },
        ),
      ),
    );
  }

  void _editRecord(RecordModel recordToBeEdited, RecordModel newRecordData) {
    final index = _registeredRecords.indexWhere(
      (record) =>
          record.title == recordToBeEdited.title &&
          record.amount == recordToBeEdited.amount &&
          record.date == recordToBeEdited.date &&
          record.category == recordToBeEdited.category &&
          record.type == recordToBeEdited.type,
    );
    setState(() {
      recordsBox.putAt(index, [
        newRecordData.title,
        newRecordData.amount,
        newRecordData.date,
        newRecordData.category,
        newRecordData.type,
      ]);
    });
  }

  var selectedList = "Expenses";
  @override
  Widget build(BuildContext context) {
    _registeredRecords = recordsBox.values
        .toList()
        .map(
          (e) => RecordModel(
            title: e[0],
            amount: e[1],
            date: e[2],
            category: e[3],
            type: e[4],
          ),
        )
        .toList();
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        'No records added',
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );

    if (_registeredRecords.isNotEmpty) {
      mainContent = RecordList(
        records: _registeredRecords,
        onRemoveRecords: _deleteRecord,
        onEditRecord: _editRecord,
        selectedType: selectedList == "Expenses"
            ? "Expense"
            : selectedList == "Income"
            ? "Income"
            : "All",
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => SettingsScreen(
                    onChangeTheme: widget.onChangeTheme,
                    onChangeColor: widget.onChangeColor,
                    onChangeCurrency: widget.onChangeCurrency,
                    onChangeLanguage: widget.onChangeLanguage,
                  ),
                ),
              );
            },
          ),
        ],
        title: const Text('Budgetr'),
      ),
      body: width < 600
          ? Column(
              children: <Widget>[
                Chart(records: _registeredRecords),
                CupertinoSegmentedControl(
                  groupValue: selectedList,
                  children: const {
                    "Expenses": SegmentedControlOption(text: "Expenses"),
                    "Income": SegmentedControlOption(text: "Income"),
                    "All": SegmentedControlOption(text: "All"),
                  },
                  onValueChanged: (String value) {
                    setState(() {
                      selectedList = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    {
                      "Expenses": 'Saved Expenses',
                      "Income": 'Saved Income',
                      "All": 'All saved records',
                    }[selectedList]!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => RecordNew(onAddRecord: _addRecord),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: <Widget>[
                Expanded(child: Chart(records: _registeredRecords)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}

class SegmentedControlOption extends StatelessWidget {
  const SegmentedControlOption({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
