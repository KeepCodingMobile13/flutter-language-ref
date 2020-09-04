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

// Named params can have an extra comma at the end,
// and it won't be a syntax error, even though it's unnecessary.
// This will be important in Flutter code

main(List<String> args) {
  final add42 = adder(42);
  print(adder);
  print(add42);
  print("The answer is ${add42(0)}");

  subtract(
    42,
    42,
    ifZero: () {
      print("we got zero. Ain't that shit?");
    }, // La coma no causa error, pero hace que se formatee "raro"
  );
}
