class Stack<Element> {
  List<Element> _contents = [];

  int get height => _contents.length;

  int push(Element newValue) {
    _contents.insert(0, newValue);
    return height;
  }

  Element pop() {
    var first = _contents.first;
    _contents.removeAt(0);
    return first;
  }
}

// Es una colección también, con lo cual no tiene mucho sentido,
// dado que no va a poder sincronizar _ships con _contents
// Es más cuando la funcionalidad del mixin es transversal
class RebelAllianceFleet with Stack<String> {
  List<String> _ships;

  int get size => _ships.length;

  RebelAllianceFleet(List<String> ships) : _ships = ships;

  void deploy() {
    print("deploying");
  }

  void reGroup() {
    print("regrouping...");
  }
}

void main() {
  var f = RebelAllianceFleet(
      ["Calamari Cruiser", "Hammerhead Corvette", "Nebulon-B Frigate"]);

  f.push("CR90 Corvette");
  f.push("CR90 Corvette");

  f.deploy();

  print("The curent size of the fleet is ${f.height} or is it ${f.size}?");
}
