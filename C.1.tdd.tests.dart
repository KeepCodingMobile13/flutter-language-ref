import 'dart:developer';

import 'package:test/test.dart';
import 'C.0.tdd.sut.dart';

// Run them with:
// pub run test C.1.tdd.tests.dart
// Todos los matchers están en el paquete matchers: https://pub.dev/documentation/matcher/latest/matcher/matcher-library.html
main() {
  group("creation", () {
    test("Create a Counter", () {
      expect(Counter(), isNotNull);

      expect(Counter.startAt(42), isNotNull);
    });
  });

  group("initial state", () {
    test("set the initial state", () {
      expect(Counter().current, 0);
      expect(Counter.startAt(0).current, 0);
      expect(Counter.startAt(42).current, 42);
      expect(Counter.startAt(-6).current, -6);
    });
  });

  group("state mutation", () {
    Counter c;

    setUp(() {
      c = Counter();
    });

    test("state mutates correctly", () {
      c.down();
      expect(c.current, -1);
      c.up();
      expect(c.current, 0);
    });
  });

  group("Object interface", () {
    Counter c1;
    Counter c2;

    setUp(() {
      c1 = Counter();
      c2 = Counter.startAt(0);
    });

    test("test equality", () {
      expect(c1, c1);
      expect(c1, c2);
    });

    test("test inequality", () {
      c2.up();

      expect(c1 == c2, isFalse);
      expect(c1 == "lucas Grijander", isFalse);
    });

    test("Equal objects must have equal hashCode", () {
      expect(c1.hashCode, c2.hashCode);
      expect(c2.hashCode, c2.hashCode);
    });
  });
}
