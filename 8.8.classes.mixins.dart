typedef ModelCallback<Model> = void Function(Model);

class Publisher {
  Set<ModelCallback> _subscribers = {};

  int get subscriberCount => _subscribers.length;

  void subscribe(ModelCallback callback) {
    _subscribers.add(callback);
  }

  void cancelSubscription(ModelCallback callback) {
    if (_subscribers.contains(callback)) {
      _subscribers.remove(callback);
    }
  }

  void cancellAllSubscriptions() {
    _subscribers.clear();
  }

  void notify() {
    for (ModelCallback subscriber in _subscribers) {
      subscriber(this);
    }
  }

  @override
  String toString() {
    return "<$runtimeType: $subscriberCount>";
  }
}

class Person with Publisher {
  String _name;
  String _lastName;

  String get name => _name;
  String get lastName => _lastName;

  void set name(String newVal) {
    _name = newVal;
    notify();
  }

  void set lastName(String newVal) {
    _lastName = newVal;
    notify();
  }

  Person({String name, String lastName})
      : _name = name,
        _lastName = lastName;

  String get fullName {
    return "$_name $_lastName".trim();
  }

  @override
  String toString() {
    return "<$runtimeType: $fullName>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is Person && this.fullName == other.fullName;
    }
  }

  @override
  int get hashCode {
    return fullName.hashCode;
  }
}

void main() {
  Person vader = Person(name: "Anakin", lastName: "Skywalker");

  void logger(dynamic sender) => print("$sender just changed!");

  vader.subscribe(logger);
  vader.name = "Manolo";
  vader.lastName = "Escobar";

  vader.cancellAllSubscriptions();
  vader.name = "Anakin";
  // se ejecuta el toString de Person y se ignora el de Publisher
  print(vader);
}
