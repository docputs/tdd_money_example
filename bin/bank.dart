import 'expression.dart';
import 'money.dart';

class Bank {
  Money reduce(Expression source, String to) {
    return source.reduce(to);
  }
}
