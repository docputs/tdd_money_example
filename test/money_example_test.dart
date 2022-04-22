import 'package:test/test.dart';

import '../bin/dollar.dart';

void main() {
  test('multiplication', () {
    Dollar five = Dollar(5);
    expect(five.times(2).equals(Dollar(10)), isTrue);
    expect(five.times(3).equals(Dollar(15)), isTrue);
  });

  test('equality', () {
    expect(Dollar(5).equals(Dollar(5)), isTrue);
    expect(Dollar(5).equals(Dollar(6)), isFalse);
  });
}
