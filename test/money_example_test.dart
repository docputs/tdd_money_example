import 'package:test/test.dart';

import '../bin/bank.dart';
import '../bin/expression.dart';
import '../bin/money.dart';
import '../bin/sum.dart';

void main() {
  test('multiplication', () {
    Money five = Money.dollar(5);
    expect(five.times(2), Money.dollar(10));
    expect(five.times(3), Money.dollar(15));
  });

  test('equality', () {
    expect(Money.dollar(5), Money.dollar(5));
    expect(Money.dollar(5), isNot(Money.dollar(6)));
    expect(Money.franc(5), isNot(Money.dollar(5)));
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
    expect(reduced, Money.dollar(10));
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
    expect(result, Money.dollar(7));
  });

  test('reduce money', () {
    Bank bank = Bank();
    Money result = bank.reduce(Money.dollar(1), 'USD');
    expect(result, Money.dollar(1));
  });

  test('reduce money different currency', () {
    Bank bank = Bank();
    bank.addRate('CHF', 'USD', 2);
    Money result = bank.reduce(Money.franc(2), 'USD');
    expect(result, Money.dollar(1));
  });

  test('identity rate', () {
    expect(Bank().rate('USD', 'USD'), 1);
  });

  test('mixed addition', () {
    Expression fiveBucks = Money.dollar(5);
    Expression tenFrancs = Money.franc(10);
    Bank bank = Bank();
    bank.addRate('CHF', 'USD', 2);
    Money result = bank.reduce(fiveBucks.plus(tenFrancs), 'USD');
    expect(result, Money.dollar(10));
  });

  test('sum plus money', () {
    Expression fiveBucks = Money.dollar(5);
    Expression tenFrancs = Money.franc(10);
    Bank bank = Bank();
    bank.addRate('CHF', 'USD', 2);
    Expression sum = Sum(fiveBucks, tenFrancs).plus(fiveBucks);
    Money result = bank.reduce(sum, 'USD');
    expect(result, Money.dollar(15));
  });

  test('sum times', () {
    Expression fiveBucks = Money.dollar(5);
    Expression tenFrancs = Money.franc(10);
    Bank bank = Bank();
    bank.addRate('CHF', 'USD', 2);
    Expression sum = Sum(fiveBucks, tenFrancs).times(2);
    Money result = bank.reduce(sum, 'USD');
    expect(result, Money.dollar(20));
  });
}
