library points; // nombra la librería: si no tiene un main, es una librería, sino, es un script

import 'dart:math'; // explicar cómo se importan cosas

class Point {
  // no hace falta especificarlo, si hereda de Object
  double _x, _y; // invisible desde fuera de points

  Point(double x, double y) // Para asignar, usa siempre la lista de init
      : _x = x,
        _y = y; // hay un {} implícto aquí

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

void main() {
  // no puede ser const porque el constructor no lo es. más sobre eso luego
  final origin = Point(0.0, 0.0);
  print("The origin is: $origin");

  var p = Point(3.4, 5);
  print(p.scale(by: 32));
}
