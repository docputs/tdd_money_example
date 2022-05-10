import 'money.dart';

class Franc extends Money {
  @override
  final String currency;

  Franc(int amount, this.currency) : super(amount, currency);
}
