/*
NOT like Swift's typeAlias: only works for functions.
Will change
*/

typedef Predicate<T, V> = bool Function(T a, V b);

bool check(int m, int n, Predicate<int, int> test) {
  return test(m, n);
}

main(List<String> args) {
  print("is 3 less than 4?\n ${check(3, 4, (a, b) => a > b)}");
}
