/*
Dynamic language, moving to stricter typing.
All dynamic stuff will be optional via the `dynamic` keyword
*/

// Function definition
// If you do not specify the return value, it will be assumed to be dynamic.
// Always specify your types, or else.
int successor(int aNumber) {
  print("The successor of $aNumber is ${++aNumber}");
  return aNumber; // it was already increased, sucker!
}

// The entry point: starts a runloop. More on that later
void main() {
  var number = 41; // declare, init and type infer
  // a better way might be...
  int n = number;
  print(successor(n));

  // Variables can be dynamic, only if specified. Don't
  dynamic box = 'Fernando';
  box = 42.42;
  print(box);
}
