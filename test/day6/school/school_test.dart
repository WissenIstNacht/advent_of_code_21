import 'package:test/test.dart';
import 'package:collection/collection.dart';

import '../../../bin/day6/helpers/school.dart';

void main() {
  test('Constructs correctly', () {
    final s = School.fromInts([1, 2, 3, 4, 5, 6]);
    s.fishes.forEachIndexed((i, f) {
      expect(f.daysToReproduce, equals(i + 1));
    });
  });
  test('Evolves correctly', () {
    final s = School.fromInts([1, 2, 3, 4, 5, 6]);
    final c = s.countPopulation();
    s.evolve();
    expect(s.age, equals(1));
    expect(s.countPopulation(), equals(c));
    expect(s.printPopulationAges(), equals([0, 1, 2, 3, 4, 5]));
    s.evolve();
    expect(s.age, equals(2));
    expect(s.countPopulation(), equals(c + 1));
    expect(s.printPopulationAges(), equals([6, 0, 1, 2, 3, 4, 8]));
  });
}
