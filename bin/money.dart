import 'package:meta/meta.dart';

import 'dollar.dart';
import 'franc.dart';

abstract class Money {
  @protected
  int get amount => _amount;
  final int _amount;

  Money(this._amount);

  factory Money.dollar(int amount) {
    return Dollar(amount);
  }

  factory Money.franc(int amount) {
    return Franc(amount);
  }

  Money times(int multiplier);

  bool equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && runtimeType == money.runtimeType;
  }
}
