String currencyFormat(double amount, String currencySymbol) {
  switch (currencySymbol) {
    case 'Ft':
    case 'din':
    case 'Kč':
    case '¥':
      return '${amount.floor()} $currencySymbol';
    case '\$':
      return '\$ ${amount.toStringAsFixed(2)}';
    default:
      return '${amount.toStringAsFixed(2)} $currencySymbol';
  }
}
