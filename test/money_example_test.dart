import 'package:test/test.dart';

import '../bin/bank.dart';
import '../bin/expression.dart';
import '../bin/money.dart';

void main() {
  test('multiplication', () {
    Money five = Money.dollar(5);
    expect(five.times(2).equals(Money.dollar(10)), isTrue);
    expect(five.times(3).equals(Money.dollar(15)), isTrue);
  });

  test('equality', () {
    expect(Money.dollar(5).equals(Money.dollar(5)), isTrue);
    expect(Money.dollar(5).equals(Money.dollar(6)), isFalse);
    expect(Money.franc(5).equals(Money.dollar(5)), isFalse);
  });

  test('currency', () {
    expect(Money.dollar(1).currency, 'USD');
    expect(Money.franc(1).currency, 'CHF');
  });

  test('simple addition', () {
    Money five = Money.dollar(5);
    Expression sum = five.plus(five);
    Bank bank = Bank();
    Money reduced = bank.reduce(sum, 'USD');
    expect(reduced.equals(Money.dollar(10)), isTrue);
  });
}
