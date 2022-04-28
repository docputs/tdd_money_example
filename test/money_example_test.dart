import 'package:test/test.dart';

import '../bin/dollar.dart';
import '../bin/franc.dart';

void main() {
  test('multiplication', () {
    Dollar five = Dollar(5);
    expect(five.times(2).equals(Dollar(10)), isTrue);
    expect(five.times(3).equals(Dollar(15)), isTrue);
  });

  test('equality', () {
    expect(Dollar(5).equals(Dollar(5)), isTrue);
    expect(Dollar(5).equals(Dollar(6)), isFalse);
    expect(Franc(5).equals(Franc(5)), isTrue);
    expect(Franc(5).equals(Franc(6)), isFalse);
  });

  test('franc multiplication', () {
    Franc five = Franc(5);
    expect(five.times(2).equals(Franc(10)), isTrue);
    expect(five.times(3).equals(Franc(15)), isTrue);
  });
}
