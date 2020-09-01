/*
SKIP IT as it not necesdsary and introduces classes too soon!

Function is an abstract class that provides a common type to all functions.
*/

/* Callable objects

Function application is just calling a special method `call()`
*/

int f(int n) => n * 2;

/*
Callable objects

Any class that implements a call method, is implecitely implementing
the Function protocol: a callable object
*/

class Character {
  String _name;
  Character(String name) : this._name = name {}

  call() => "Yo, $_name!!"; // Callable!
}

main(List<String> args) {
  // Function application
  print(f(89));
  print(f.call(89)); // same, same

  final jesse = Character("Jesse Pinkman");
  print(jesse());
}
