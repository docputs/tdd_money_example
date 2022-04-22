class Franc {
  final int _amount;

  const Franc(this._amount);

  Franc times(int multiplier) {
    return Franc(_amount * multiplier);
  }

  bool equals(Object object) {
    Franc franc = object as Franc;
    return _amount == franc._amount;
  }
}
