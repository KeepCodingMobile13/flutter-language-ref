/*
   
*/

/*
  No interfaces or protocols per se: just abstract classes instead.
  Use is to check conformance to a protocol
*/

abstract class Pair {
  // can't be instanciated
  // No implmentation
  get head;
  get tail;
}

class Jedi implements Pair {
  String name;
  String lastName;

  Jedi(name, lastName)
      : this.name = name,
        this.lastName = lastName;

  // Pair
  get head => name;
  get tail => lastName;
}

/*
  Issues: Pair is dynamic. Let's make it generic!
*/

void main(List<String> args) {
  final luke = Jedi("Luke", "Skywalker");
  final yoda = Jedi("Minch", "Yoda");

  print(yoda.tail);
  print(luke is Pair);
}
