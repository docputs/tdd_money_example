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

  @override
  Expression plus(Expression addend) {
    return Sum(this, addend);
  }

  @override
  Money reduce(Bank bank, String to) {
    int rate = bank.rate(currency, to);
    return Money(_amount ~/ rate, to);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Money &&
        other._amount == _amount &&
        other._currency == _currency;
  }

  @override
  int get hashCode => _amount.hashCode ^ _currency.hashCode;
}
