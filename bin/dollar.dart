class Dollar {
  final int _amount;

  const Dollar(this._amount);

  Dollar times(int multiplier) {
    return Dollar(_amount * multiplier);
  }

  bool equals(Object object) {
    Dollar dollar = object as Dollar;
    return _amount == dollar._amount;
  }
}
