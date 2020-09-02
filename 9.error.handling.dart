/*

Ver explicación en pag 190

Nunca se sabe quién lanza excepciones ni de qué tipo:
Leete la documentación y haz tests

*/

class Ewok {}

class OutOfEwoksError extends Error {}

class TooManyEworksError extends Error {}

bringMoreEwoks() {
  throw OutOfEwoksError();
}

breedMoreEwoks() {}

void main() {
  /*
  bringMoreEwoks();
  print("done");
  */

  try {
    bringMoreEwoks();
  } on TooManyEworksError {
    print("Must kill some ewoks first");
  } on Exception catch (e) {
    print("Some pretty bad shit happened: $e");
  } on Error catch (err) {
    print(
        "Something bad happened, but not too serious: $err\n ${err.stackTrace}");
    breedMoreEwoks();
  } catch (e) {
    // cualquier cosa que no sea excepcion o error: nunca lances algo que no lo sea
    print("Something weird happened $e");
  } finally {
    print("all done");
  }
}
