import 'money.dart';

class Dollar extends Money {
  Dollar(int amount) : super(amount);

  @override
  Money times(int multiplier) {
    return Dollar(amount * multiplier);
  }
}
