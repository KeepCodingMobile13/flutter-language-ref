// Simple yet bad example
class Point extends Object {
  var x, y; // son dinámicas y podría meter cualquier cosa

  Point(a, b) {
    // Mucho rollo y NO llama a super de forma explícita: mucho malo
    this.x = a;
    this.y = b;
  }
}
/*
PEGAS:

I   - Dinámico, sin control de tipos
II  - No es constante
III - No sobrescribe igualdad, comparación ni representación en cadena
IV  - Quien llama a super es Dart ates de empezar la construcción
V   - Todo es público: lo que no empieza con _ es visible fuera de la librería
*/
