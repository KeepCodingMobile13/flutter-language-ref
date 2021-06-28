/// Extensión sobre int que añade
/// una clasura de iteración
///
extension Iteration on int {
  void doTimes(void Function() fn) {
    for (int i = 0; i < this; i++) {
      fn();
    }
  }
}

/// Extensión sobre una enum para añadir valores
/// propios a cada caso
///

enum Affiliation {
  rebelAlliance,
  galacticEmpire,
  JabbaCriminalEmpire,
  GalacticRepublic,
  Unaffiliated,
  Unknown
}

extension HumanFriendlyNames on Affiliation {
  static const _desc = {
    Affiliation.GalacticRepublic: 'Galactic Republic',
    Affiliation.JabbaCriminalEmpire: "Jabba's Criminal Empire",
    Affiliation.galacticEmpire: 'Galactic Empire',
    Affiliation.rebelAlliance: 'Rebel Alliance',
    Affiliation.Unknown: 'Unknown',
    Affiliation.Unaffiliated: 'Unaffiliated'
  };
  String get humanFriendly => _desc[this]!;
}

/// Extensión sobre T? que permite llevar a cabo
/// ciertas operaciones sobre el recpeto, siempre y
/// cuando NO sea null
///
extension Nullable<T> on T? {
  T? map(void Function(T it) f) {
    f(this!);
    return this;
  }
}

void main(List<String> args) {
  5.doTimes(() {
    print('hello world');
  });

  final String? maybeYes = 'something';
  final String? soitanlyNot = null;

  maybeYes?.map((it) => print(it.length));
  soitanlyNot?.map((it) => print('on null ${it.length}'));

  print(Affiliation.JabbaCriminalEmpire.humanFriendly);
}
