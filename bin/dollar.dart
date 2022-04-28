import 'money.dart';

class Dollar extends Money {
  Dollar(int amount) : super(amount);

  Dollar times(int multiplier) {
    return Dollar(amount * multiplier);
  }
}
