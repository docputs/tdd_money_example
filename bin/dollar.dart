import 'money.dart';

class Dollar extends Money {
  Dollar(int amount, String currency) : super(amount, currency);

  @override
  Money times(int multiplier) {
    return Money.dollar(amount * multiplier);
  }
}
