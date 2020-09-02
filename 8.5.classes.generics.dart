abstract class Pair<Head, Tail> {
  Head get head;
  Tail get tail;
}

class Person extends Pair {
  String name;
  String surName;

  String get head => name;
  String get tail => surName;
}

// Se puede limitar el tipo genérico?
// Si, con extends
abstract class Cacheable {
  int foo();
}

class Bar extends Cacheable {
  int foo() => 42;
}

class ObjectCache<T extends Cacheable> {
  void add(T newValue) {
    print(newValue.foo());
  }

  void invalidate(T object) {}
}

main(List<String> args) {
  final cache = ObjectCache();

  // Error
  // cache.add("lucas");
  cache.add(Bar());
}
