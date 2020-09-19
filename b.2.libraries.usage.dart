import 'b.1.libraries.create.dart' as stack;

main(List<String> args) {
  stack.Stack<String> episodes = stack.Stack.fromList(['IV', 'V', 'VI']);
  print(episodes);

  episodes.push("I");
  print(episodes.peekHead());
  episodes.pop();
  print(episodes.peekHead());
}
