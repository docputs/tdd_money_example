import 'money.dart';

class Franc extends Money {
  Franc(int amount) : super(amount);

  @override
  Money times(int multiplier) {
    return Franc(amount * multiplier);
  }
}
