import 'bank.dart';
import 'expression.dart';
import 'sum.dart';

class Money implements Expression {
  int get amount => _amount;
  final int _amount;

  String get currency => _currency;
  final String _currency;

  Money(this._amount, this._currency);

  factory Money.dollar(int amount) {
    return Money(amount, 'USD');
  }

  factory Money.franc(int amount) {
    return Money(amount, 'CHF');
  }

  @override
  Expression times(int multiplier) {
    return Money(amount * multiplier, currency);
  }

  bool equals(Object object) {
    Money money = object as Money;
    return amount == money.amount && currency == money.currency;
  }

  @override
  Expression plus(Expression addend) {
    return Sum(this, addend);
  }

  @override
  Money reduce(Bank bank, String to) {
    int rate = bank.rate(currency, to);
    return Money(_amount ~/ rate, to);
  }
}
