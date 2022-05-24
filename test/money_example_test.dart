import 'package:test/test.dart';

import '../bin/bank.dart';
import '../bin/expression.dart';
import '../bin/money.dart';
import '../bin/sum.dart';

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

  test('plus returns sum', () {
    Money five = Money.dollar(5);
    Expression result = five.plus(five);
    Sum sum = result as Sum;
    expect(five, sum.augend);
    expect(five, sum.addend);
  });

  test('reduce sum', () {
    Expression sum = Sum(Money.dollar(3), Money.dollar(4));
    Bank bank = Bank();
    Money result = bank.reduce(sum, 'USD');
    expect(result.equals(Money.dollar(7)), isTrue);
  });

  test('reduce money', () {
    Bank bank = Bank();
    Money result = bank.reduce(Money.dollar(1), 'USD');
    expect(result.equals(Money.dollar(1)), isTrue);
  });

  test('reduce money different currency', () {
    Bank bank = Bank();
    bank.addRate('CHF', 'USD', 2);
    Money result = bank.reduce(Money.franc(2), 'USD');
    expect(result.equals(Money.dollar(1)), isTrue);
  });

  test('identity rate', () {
    expect(Bank().rate('USD', 'USD'), 1);
  });
}
