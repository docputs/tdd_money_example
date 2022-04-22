import 'package:test/test.dart';

import '../bin/dollar.dart';

void main() {
  test('multiplication', () {
    Dollar five = Dollar(5);
    five.times(2);
    expect(five.amount, 10);
  });
}
