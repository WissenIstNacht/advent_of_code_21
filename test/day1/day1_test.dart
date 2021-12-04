import 'package:test/test.dart';
import 'package:advent_of_code_21/solver.dart';

import '../../bin/day1/d1p1.dart';

void main() {
  late Solver solver;
  setUp(() {
    solver = Day1Part1();
  });

  test('test description', () {
    // test
    expect(2 * 2 * 2, equals(8));
  });
  //further tests
}
