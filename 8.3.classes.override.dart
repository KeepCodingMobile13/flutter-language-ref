import 'dart:math';

class Point {
  double _x, _y;
  Point(double x, double y)
      : _x = x,
        _y = y;

  static double distance(Point p1, Point p2) {
    double dx = p1._x - p2._x;
    double dy = p1._y - p2._y;

    return sqrt(pow(dx, 2) + pow(dy, 2));
  }

  Point scale({double by = 1}) => Point(_x * by, _y * by);

  Point operator +(Point p) => Point(_x + p._x, _y + p._y);

  // Object Interface
  @override
  String toString() {
    return "<${this.runtimeType}: ($_x, $_y)>";
  }

  @override // explicar override
  bool operator ==(dynamic other) {
    if (!(other is Point)) {
      return false;
    } else if (identical(other, this)) {
      // Explicar identical y que tiene que estar entre ()
      return true;
    } else {
      return (_y == other._y) && (_x == other._x);
    }
  }

  // Si sobrescribes ==, hay que sobrescribir hash
  // Dos objetos iguales han de tener el mismo hash
  // se puede hacer un xor de los hashes de las iVars,
  // crear un proxy de hash o usar el paquete quiver que tiene
  // buenas funciones de hash
  @override
  int get hashCode {
    return _y.hashCode ^ _x.hashCode;
  }
}
