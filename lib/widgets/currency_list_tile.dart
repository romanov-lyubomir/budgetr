import 'package:flutter/material.dart';

class CurrencyListTile extends StatelessWidget {
  const CurrencyListTile({
    super.key,
    required this.onChangeCurrency,
    required this.currency,
  });

  final void Function(String newCurrency) onChangeCurrency;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(currency),
      onTap: () {
        onChangeCurrency(currency);
      },
    );
  }
}
