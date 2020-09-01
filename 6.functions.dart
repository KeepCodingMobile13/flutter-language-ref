/*

All functions are:

* First-class objects
* Subclases of Function
* Lexical closures
* returns something, raises an exceptionor is void

*/

void main() {
  print("successor of 42: ${succ(42)}");

  // Anonymous
  print(f("lucas"));

  // Optional Params
  print(extend("according"));
  print(extend("test", "ation"));

  // Los params no son final, pero no hagas eso....
  print(badFunction(0));

  // High order function
  final add42 = adder(42);
  print(add42(8));

  var rc = subtract(42, 42, ifZero: () {
    print("We got zero: ain't that shit?");
  });
  print(rc);

  rc = subtract(32, 32);
  print(rc);

  // Function overloading: a no, no
  // This will cause a runtime error
  //subtract(32, 30 + 2, ifZero: (int n) => n / 9);
}

// 2 syntaxes: full, and shorthand (arrow)
int inc(int n) {
  return ++n;
}

succ(int k) => ++k;

// identity function
id(x) => x;

// Const function
zero() => 0;

// Anonymous functions
final f = (x) => x;

// Optional parameters
// Come last and are in between [].
// The default value can only be a const (pain in the butt
// when dealing with completion closures)
String extend(aString, [suffix = 'ly']) => aString + suffix;

// Params are not final, but please don't. Everything is passed by ref
int badFunction(int n) {
  n = 42; // Eres un gilipollas
  return n + 1;
}

// High order functions: fully supported
adder(int n) {
  int addHelper(int k) => k + n;
  return addHelper;
}

// A function cannot be the default value of an optional
// param (a completion closure) as it wouldn't be a const!

// Named params: come last between {} as name:value pairs.
// Flutter only uses named params for everything!!!

noop() {} // can pass the body as the value, as it must be determined at compile time

subtract(int a, int b, {ifZero: noop}) {
  final int res = a - b;
  if (res == 0) {
    ifZero();
  }

  return res;
}

// Function overloading
// Not possible, as the type is always the same: Function.
int k(int n) => n + 1;
// String k(int n) => "$n";

// In the previous example, if passing a "completion closure" with the wrong
// type, it would cause a runtime error.
// TEST YOUR SHIT!
// USE DOUBLE-DISPATCH!!
