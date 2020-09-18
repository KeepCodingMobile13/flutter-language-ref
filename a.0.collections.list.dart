/*

There are Lists, Sets and Maps. Much more in a specific package

All of them implement Iterable

¿Son seguras en multitarea? No, ni falta que les hace. Lo vemos luego.

*/

main(List<String> args) {
  print([1, 2, 3].runtimeType);

  // LISTS
  // lo normal es crealas con su literal, aunque hay constructores pa aburrirse
  var nums = [4, 5, 6, 7, 8, 9, 999, 9];

  // o también...
  var dojos = ["Cobra Kai", "Miyagi do"];
  print(dojos);

  // Iteración
  for (int elt in nums) {
    print(elt);
  }

  // Inmutables (siempre que puedas)
  final bestEpisodes = const ['IV', 'V', 'VI'];

  //bestEpisodes.add('I'); // JAMÁS!!!! Pero n da error de compilación => testa!

  // Accesores
  // first & last te dejan tratarla como una cola, pila o deque
  print(bestEpisodes.last);
  print(bestEpisodes[0]);

  // Hay un huevo de métodos, míralos en la docu

  /* LIST COMPREHENSIONS
   Uno de los objetivos de flutter es que el layout del código refleje la
   jerarquía de vistas. 

   Por eso se han añadido expresiones condicionales y de iteración.
  Sirve para todas las colecciones
  */
  // Lista de los cuadrados, si son pares, sino el número original
  var evenSquares = [
    for (var each in nums)
      if (each.isEven) each * each else each
  ];

  print(evenSquares);

  // Spread operator: syntactic suga para append. También de flutter
  var z = [0, ...evenSquares];
  print(z);

  /*
  Maybe skip
  FP: DETECCIÓN
  any, firstWhere, every
  */
  print(z.any((element) => element.isOdd));
  print(z.firstWhere((element) => element > 20 && element.isEven));
  print(z.every((element) => element is int));

  /*
  FP: Modificación
  map -> lazy, non-destructive
  forEach -> eager, side effects only
  */

  var w = z.map((e) => e * e);
  print(w);

  /*
FP: REDUCTION
reduce
*/
  // skip se salta el primero
  final zz = [0, 1, 2, 3, 4, 5, 6];
  print(zz);

  var reduced = z.skip(1).reduce((tally, elt) {
    print("tally is $tally");
    print("elt is $elt");
    print("----");
    return tally * elt;
  });

  print(reduced);
}
