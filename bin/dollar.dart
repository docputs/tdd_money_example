import 'money.dart';

class Dollar extends Money {
  @override
  final String currency;

  Dollar(int amount, this.currency) : super(amount, currency);
}
