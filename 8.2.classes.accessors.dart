/*
It's impossible to access the iVar directly. Dart compiles a getter 
and setter with the same name and makes it look like a field access instead of
function call.

If you want to create your own setter, you need a kludge
*/

class ClassyPerson {
  String _name; // private, but still getter and setter!

  // Public Interface
  get name => "Mr. $_name";
  set name(String newValue) {
    // hazle algo raro
    _name = newValue;
  }
}
