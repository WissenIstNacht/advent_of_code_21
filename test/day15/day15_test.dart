import 'package:advent_of_code_21/solver.dart';
import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../bin/day15/p1.dart';
import '../../bin/day15/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(15);
  });
  test("test d15p1's solve method", () {
    solver = Day15Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("40"));
  });
  test("test d15p2's solve method", () {
    solver = Day15Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals(""));
  });
}
