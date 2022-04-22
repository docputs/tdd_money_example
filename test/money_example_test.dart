import 'package:test/test.dart';

import '../bin/dollar.dart';

void main() {
  test('multiplication', () {
    Dollar five = Dollar(5);
    Dollar product = five.times(2);
    expect(product.amount, 10);
    product = five.times(3);
    expect(product.amount, 15);
  });
}
