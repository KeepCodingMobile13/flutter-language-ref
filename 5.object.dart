/*
Object defines a very samll protocol:
hashCode() -> int
runtimeType -> Type
moSuchMethod(...) -> dynamic
toString() -> String
operator == (dynamic) -> bool
*/

int inc(int x) {
  return x + 1;
}

void main() {
  print("The type of inc is.... ${inc.runtimeType}");
  print("The type of 42 is ${42.runtimeType} ");

  // lo de arriba devuleve (int) => int, lo cual es
  // una mentira piadosa. Me da la firma de la función,
  // pero su tipo es `Function`

  print("En realidad, inc es de tipo Function? ${inc is Function}");
}
