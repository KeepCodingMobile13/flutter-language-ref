class Stack<Element> {
  List<Element> _stack = [];

  Stack();
  Stack.fromList(List<Element> aList) : _stack = aList;
  Stack.fromSet(Set<Element> aSet) : _stack = List.from(aSet);

  // Accessors
  bool get isEmpty => this.length == 0;
  int get length => _stack.length;

  Element peekHead() => _stack.first;
  Element peekTail() => _stack.last;

  // Mutators
  Element pop() {
    var head = _stack.first;
    _stack.removeAt(0);
    return head;
  }

  int push(Element newValue) {
    _stack.insert(0, newValue);
    return this.length;
  }

  // Ejercicio: implementar toString, hashCode y ==
  String toString() {
    return "<${this.runtimeType}: Head = ${this.peekHead()} Size = ${this.length}>";
  }
}
