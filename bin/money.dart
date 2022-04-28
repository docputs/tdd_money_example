import 'package:meta/meta.dart';

class Money {
  @protected
  int get amount => _amount;
  final int _amount;

  Money(this._amount);

  bool equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && runtimeType == money.runtimeType;
  }
}
