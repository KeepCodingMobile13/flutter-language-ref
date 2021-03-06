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
