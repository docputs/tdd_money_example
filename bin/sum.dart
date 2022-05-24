import 'expression.dart';
import 'money.dart';

class Sum implements Expression {
  final Money augend;
  final Money addend;

  Sum(this.augend, this.addend);

  @override
  Money reduce(String to) {
    int amount = augend.amount + addend.amount;
    return Money(amount, to);
  }
}
