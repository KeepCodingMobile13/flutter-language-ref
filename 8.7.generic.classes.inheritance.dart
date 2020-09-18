// Skip for now

void main() {
  final b = Box(42);
  final answer = Box(40 + 2);
  // if you do not provide a type for box, it will default to dynamic
  final bb = Box(Box);

  print(b);
  print(bb);

  print(b == bb);
  print(b == answer);

  final jaarl = NamedBox("Chimbambas", Box(42));
  final n = NamedBox("Lucas Grijander", b);
  print(jaarl);
  print(n);

  final keyed = KeyedBox(42, "Forty two");
  print(keyed);
  final k2 = KeyedBox(b, keyed);
  print(k2);
  print(k2 == keyed);
}

class Box<Value> extends Object {
  final Value _val;

  Box(Value newValue) : _val = newValue;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else if (other is! Box<Value>) {
      return false;
    } else {
      return _val == (other as Box)._val;
    }
  }

  @override
  String toString() {
    return "#${this.runtimeType}: {value: $_val}";
  }
}

// Clase que añade un miembro (toma ya) específico a una clase genérica
// Vamos bien pero debería de hacer mi mixin de los proxies de comparación
// e igualdad
class NamedBox<Value> extends Box {
  final String _name;

  NamedBox(String name, Value value)
      : _name = name,
        super(value);

  @override
  String toString() {
    return "${super.toString()} {name: $_name}";
  }

  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else if (other is! NamedBox<Value>) {
      return false;
    } else {
      return (_val == (other as NamedBox)._val) &&
          (_name == (other as NamedBox)._name);
    }
  }
}

/*
  Clase genérica que extiende a otra
*/
class KeyedBox<Key, Value> extends Box {
  final Key _key;

  KeyedBox(Key key, Value val)
      : _key = key,
        super(val);

  @override
  String toString() {
    return "${super.toString()} {key: $_key}";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else if (other is! KeyedBox<Key, Value>) {
      return false;
    } else {
      return (_val == (other as KeyedBox)._val) &&
          (_key == (other as KeyedBox)._key);
    }
  }
}
