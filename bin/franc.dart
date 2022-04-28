import 'money.dart';

class Franc extends Money {
  Franc(int amount) : super(amount);

  Franc times(int multiplier) {
    return Franc(amount * multiplier);
  }
}
