/*

La única forma de comunicar un error, es lanzando "algo".

Aunque puedes lanzar cualquier cosa, NO lo hagas.

Lanza Errors cuando la cosa no tiene arreglo.
Lanza Exceptions cuando crees que si lo tiene.

En general, sólo Dart y librerias del sdk deberían lanzar
Errors, tu código debe de lanzar Exceptions


1. Crea una clase que implementa Exception
2. Lánzala

Nunca se sabe quién lanza excepciones ni de qué tipo:
Leete la documentación y haz tests

*/

class Ewok {}

class OutOfEwoksException implements Exception {}

class TooManyEworksException implements Exception {}

bringMoreEwoks() {
  throw OutOfEwoksException();
}

breedMoreEwoks() {}

void main() {
  /*
  bringMoreEwoks();
  print("done");
  */

  try {
    bringMoreEwoks();
  } on TooManyEworksException {
    print("Must kill some ewoks first");
  } on Exception catch (e) {
    print("Something bad happended: $e");
  } on Error catch (err) {
    print("Some serious shit happened: $err\n ${err.stackTrace}");
    breedMoreEwoks();
  } catch (e) {
    // cualquier cosa que no sea excepcion o error: nunca lances algo que no lo sea
    print("Something weird happened $e");
  } finally {
    print("all done");
  }
}
