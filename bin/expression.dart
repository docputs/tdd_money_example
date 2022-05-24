import 'money.dart';

abstract class Expression {
  Money reduce(String to);
}
