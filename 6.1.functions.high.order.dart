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
