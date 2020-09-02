/*
I   - Regular constructors: implicit & explicit
II  - Named constructors
III - Factory constructors (más tarde. son funciones sin mas y pueden usarse para class clusters)
IV  - Constant constructors (para crear objetos que no pueden ser modificados. más tasrde)
V   - Destructors? (no hay porque en JS no los hay)
*/

/* I
  If you don't define a constructor, dart creates one for you that allocates
  memmory and sets all iVars to null. This last part is not catastrophic.
*/

class Box<T> {
  T value; // Cannot be set to final, as it's not set. Always declare your constructors
}

class BetterBox<T> {
  final T value;
  // antres de terminar la init list, se llama a super por ti. Si tienes que hacerlo tú, hazlo ahí.
  BetterBox(T newValue) : value = newValue;
}

/*
II No puede haber más de un constructor a no ser que tengan nombres diferentes
dado que no hay sobrecarga de funciones (todo es Function).

Redirecting constructor: inicializador designado
*/

class Container {
  final content;
  Container(dynamic newValue) : content = newValue;
  Container.named(dynamic newValue, String name) : this({name: newValue});
}
