// const is at compile time
// final is at runtime

const answer = 42;
void main() {
  const name = "fernando";
  print(name);

  // Values can be constant too
  final bestEpisodes = const ['IV', 'V', 'VI'];
  print(bestEpisodes);
}

String greet(String name) {
  const greeting = "Hello";

  return "$greeting $name";
}

/*

I   - Make all variables final or const by default
II  - Make all collection values const by default
II  - Test your shit! 
*/
