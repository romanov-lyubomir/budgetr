import 'package:flutter/material.dart';
import 'package:budgetr/l10n/app_localizations.dart';
import 'package:budgetr/global/hive_boxes.dart';
import 'package:budgetr/global/currencies.dart';

class SetCurrency extends StatefulWidget {
  const SetCurrency({super.key, required this.onChangeCurrency});

  final Function(String) onChangeCurrency;

  @override
  State<SetCurrency> createState() {
    return _SetCurrencyState();
  }
}

class _SetCurrencyState extends State<SetCurrency> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.attach_money),
      title: Text(AppLocalizations.of(context)?.currency ?? 'Currency'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '${appDataBox.get('currency')} (${allCurrencies[appDataBox.get('currency')]})',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (ctx) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ...allCurrencies.keys.map(
                      (supportedCurrency) => ListTile(
                        title: Text(supportedCurrency),
                        onTap: () {
                          widget.onChangeCurrency(supportedCurrency);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
