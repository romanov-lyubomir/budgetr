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
              title: Text(
                AppLocalizations.of(context)?.orderBySum ?? 'Order by sum',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Arrow(direction: 'up'),
              title: Text(
                AppLocalizations.of(context)?.lowToHigh ?? 'Low to high',
              ),
              onTap: () {
                widget.registeredExpenses.sort(
                  (a, b) => a.amount.compareTo(b.amount),
                );
                widget.onChangeOrder(widget.registeredExpenses);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Arrow(direction: 'down'),
              title: Text(
                AppLocalizations.of(context)?.highToLow ?? 'High to low',
              ),
              onTap: () {
                widget.registeredExpenses.sort(
                  (a, b) => b.amount.compareTo(a.amount),
                );
                widget.onChangeOrder(widget.registeredExpenses);
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 5,
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)?.orderByDate ?? 'Order by date',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Arrow(direction: 'up'),
              title: Text(
                AppLocalizations.of(context)?.recentFirst ?? 'Recent first',
              ),
              onTap: () {
                widget.registeredExpenses.sort(
                  (a, b) => b.date.compareTo(a.date),
                );
                widget.onChangeOrder(widget.registeredExpenses);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Arrow(direction: 'down'),
              title: Text(
                AppLocalizations.of(context)?.oldFirst ?? 'Old first',
              ),
              onTap: () {
                widget.registeredExpenses.sort(
                  (a, b) => a.date.compareTo(b.date),
                );
                widget.onChangeOrder(widget.registeredExpenses);
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 5,
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)?.orderByCategory ??
                    'Order by category',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Arrow(direction: 'up'),
              title: const Text('A-Z'),
              onTap: () {
                widget.registeredExpenses.sort(
                  (a, b) => a.category.compareTo(b.category),
                );
                widget.onChangeOrder(widget.registeredExpenses);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Arrow(direction: 'down'),
              title: const Text('Z-A'),
              onTap: () {
                widget.registeredExpenses.sort(
                  (a, b) => b.category.compareTo(a.category),
                );
                widget.onChangeOrder(widget.registeredExpenses);
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 5,
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)?.orderByName ?? 'Order by name',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Arrow(direction: 'up'),
              title: const Text('A-Z'),
              onTap: () {
                widget.registeredExpenses.sort(
                  (a, b) => a.title.compareTo(b.title),
                );
                widget.onChangeOrder(widget.registeredExpenses);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Arrow(direction: 'down'),
              title: const Text('Z-A'),
              onTap: () {
                widget.registeredExpenses.sort(
                  (a, b) => a.amount.compareTo(b.amount),
                );
                widget.onChangeOrder(widget.registeredExpenses);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
