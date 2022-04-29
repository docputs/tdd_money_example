import 'package:test/test.dart';

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
    expect(Money.franc(5).equals(Money.franc(5)), isTrue);
    expect(Money.franc(5).equals(Money.franc(6)), isFalse);
    expect(Money.franc(5).equals(Money.dollar(5)), isFalse);
  });

  test('franc multiplication', () {
    Money five = Money.franc(5);
    expect(five.times(2).equals(Money.franc(10)), isTrue);
    expect(five.times(3).equals(Money.franc(15)), isTrue);
  });

  test('currency', () {
    expect(Money.dollar(1).currency, 'USD');
    expect(Money.franc(1).currency, 'CHF');
  });
}
