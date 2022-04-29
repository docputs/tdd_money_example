import 'money.dart';

class Franc extends Money {
  Franc(int amount, String currency) : super(amount, currency);

  @override
  Money times(int multiplier) {
    return Money.franc(amount * multiplier);
  }
}
