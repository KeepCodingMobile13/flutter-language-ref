///
/// No se pued ejamás acceder directamente a las iVars. Dart sempre genera un
/// getter y un setter,tanto si quieres como sino.
///
///

class ClassyPerson {
  late String _name; // private, but still getter and setter!

  ClassyPerson(this._name);

  // Public Interface
  String get name => "Mr. $_name";
  set name(String newValue) {
    // hazle algo raro
    _name = newValue;
  }
}
