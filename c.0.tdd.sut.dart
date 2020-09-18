class Counter {
  int _current = 0;

  Counter();
  Counter.startAt(int seed) : _current = seed;

  // Accessors
  int get current => _current;

  // Mutators
  int up() {
    return ++_current;
  }

  int down() {
    return --_current;
  }

  // Object Interface
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) {
      return true;
    } else if (other is! Counter) {
      return false;
    } else {
      return _current == other.current;
    }
  }

  @override
  int get hashCode => _current.hashCode;

  @override
  String toString() {
    return "<${this.runtimeType}: $_current}>";
  }
}
