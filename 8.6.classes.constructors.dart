import 'dart:math';

/*
I   - Regular constructors: implicit & explicit
II  - Named constructors
III - Factory constructors (más tarde. son funciones sin mas y pueden usarse para class clusters)
IV  - Constant constructors (para crear objetos que no pueden ser modificados. muy usado en flutter)
V   - Destructors? (no hay porque en JS no los hay)
*/

/* I
  If you don't define a constructor, dart creates one for you that allocates
  memmory and sets all iVars to null. This last part is not catastrophic.
*/

class Box<T> {
  T value; // Cannot be set to final, as it's not set. Always declare your constructors
}

class BetterBox<T> {
  final T value;
  // antres de terminar la init list, se llama a super por ti. Si tienes que hacerlo tú, hazlo ahí.
  BetterBox(T newValue) : value = newValue;
}

/*
II No puede haber más de un constructor a no ser que tengan nombres diferentes
dado que no hay sobrecarga de funciones (todo es Function).

Redirecting constructor: inicializador designado
*/

class Container {
  final content;
  Container(dynamic newValue) : content = newValue;
  Container.named(dynamic newValue, String name) : this({name: newValue});
}

/* IV CONST CONSTRUCTORS

Los obsjetos constantes se computan en tiempo de compilación, no se 
pueden alterar y son únicos en el sistema (lo mismo que asegura Core Data).

Ejemplos:
  * Números literales
  * Cadenas literales
  * Símbolos
  * Muchos de los Widgets de Flutter (la mayoría)

  El usuario puede crear los suyos. Las condiciones del objeto son:

  * El objeto ha de ser inmutable (todo final o const y nada de setters)
  
  Las condiciones del constructor son:
  * Sólo initlist (nada de cuerpo)
  * Las initlist sólo puede computar constantes

  En el ejemplo de arriba, Container podría ser const, pero 
  no así Container.named por el mapa que crea.

  Al hacer esta versión de Point const, tenemos un flyweight automático.
  Explicar lo que es el flyweight.
*/

class Point {
  // no hace falta especificarlo, si hereda de Object
  final double _x, _y; // invisible desde fuera de points

  const Point(double x, double y) // Para asignar, usa siempre la lista de init
      : _x = x,
        _y = y; // hay un {} implícto aquí

  const Point.origin()
      : _x = 0,
        _y = 0;

  // Método estático
  static double distance(Point p1, Point p2) {
    double dx = p1._x - p2._x;
    double dy = p1._y - p2._y;

    return sqrt(pow(dx, 2) + pow(dy, 2));
  }

  // Método normal con parámetro nombrado
  Point scale({double by = 1}) => Point(_x * by, _y * by);

  // Sobrecarga de operador
  Point operator +(Point p) => Point(_x + p._x, _y + p._y);
}
