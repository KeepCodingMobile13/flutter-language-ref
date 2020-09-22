import 'dart:math';

// Ni constructores ni nada estático se hereda.

class Point {
  final double _x, _y;
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

  // estilo recomendado en https://dart-lang.github.io/linter/lints/unrelated_type_equality_checks.html
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is Point && (_x == other._x) && (_y == other._y);
    }
  }

  // Si sobrescribes ==, hay que sobrescribir hash
  // Dos objetos iguales han de tener el mismo hash
  // se puede hacer un xor de los hashes de las iVars,
  // crear un proxy de hash o usar el paquete quiver que tiene
  // buenas funciones de hash.
  // El Hash no debe de cambiar nunca
  @override
  int get hashCode {
    // Como los campos son cts, no pasa nada:
    // el hash no cambiará y no volverá majara a
    // las colecciones
    return _y.hashCode ^ _x.hashCode;
  }
}

void main() {
  final p1 = Point(0, 0);
  final p2 = Point(8, 3);

  print(p1 + p2.scale(by: 4));
  print(p1 == p1.scale(by: 100));
}
