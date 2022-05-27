import 'bank.dart';
import 'expression.dart';
import 'money.dart';

class Sum implements Expression {
  final Expression augend;
  final Expression addend;

  Sum(this.augend, this.addend);

  @override
  Money reduce(Bank bank, String to) {
    int amount =
        augend.reduce(bank, to).amount + addend.reduce(bank, to).amount;
    return Money(amount, to);
  }

  @override
  Expression plus(Expression addend) {
    // TODO: implement plus
    throw UnimplementedError();
  }
}
