import 'package:meta/meta.dart';

import 'dollar.dart';
import 'franc.dart';

class Money {
  @protected
  int get amount => _amount;
  final int _amount;

  String get currency => _currency;
  final String _currency;

  Money(this._amount, this._currency);

  factory Money.dollar(int amount) {
    return Dollar(amount, 'USD');
  }

  factory Money.franc(int amount) {
    return Franc(amount, 'CHF');
  }

  Money times(int multiplier) {
    return Money(amount * multiplier, currency);
  }

  bool equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && currency == money.currency;
  }
}
