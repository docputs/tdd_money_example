import 'expression.dart';
import 'money.dart';

class Bank {
  final Map<_Pair, int> _rates = {};

  Money reduce(Expression source, String to) {
    return source.reduce(this, to);
  }

  int rate(String from, String to) {
    if (from == to) return 1;
    int rate = _rates[_Pair(from, to)]!;
    return rate;
  }

  void addRate(String from, String to, int rate) {
    _rates[_Pair(from, to)] = rate;
  }
}

class _Pair {
  final String _from;
  final String _to;

  _Pair(this._from, this._to);

  @override
  bool operator ==(Object object) {
    _Pair pair = object as _Pair;
    return pair._from == _from && pair._to == _to;
  }

  @override
  int get hashCode => 0;
}
