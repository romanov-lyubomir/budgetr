import 'package:budgetr/functions/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:budgetr/functions/get_theme.dart';
import 'package:budgetr/models/expense.dart';

class Arrow extends StatelessWidget {
  const Arrow({super.key, required this.direction});

  final String direction;

  @override
  Widget build(BuildContext context) {
    return Icon(
      direction == 'up'
          ? Icons.arrow_upward_rounded
          : Icons.arrow_downward_rounded,
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }
}

class MainDrawer extends StatefulWidget {
  const MainDrawer(
      {super.key,
      required this.registeredExpenses,
      required this.onChangeOrder});

  final List<ExpenseModel> registeredExpenses;
  final void Function(List<ExpenseModel>) onChangeOrder;

  @override
  State<MainDrawer> createState() {
    return _MainDrawerState();
  }
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    var sorting = <String>['Date', 'Amount', 'Category'];
    var selected = "Date";
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.filter_alt_rounded,
                    size: 48,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)?.filtersAndOrder ??
                          'Filters and order',
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.sort_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              title: Text(
                'Order by',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              trailing: DropdownButton<String>(
                value: selected,
                icon: const Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.white,
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selected = newValue!;
                  });
                },
                items: sorting.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
              ),
              // Q: Why does the text not change when I select a new value?
              // A: Because the value is not updated. You need to use a stateful widget.
            ),
          ],
        ),
      ),
    );
  }
}
