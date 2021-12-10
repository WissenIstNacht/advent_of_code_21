import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day3/p1.dart';
import '../../bin/day3/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(3);
  });
  test("test d3p1's solve method", () {
    solver = Day3Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("198"));
  });
  test("test d3p2's solve method", () {
    solver = Day3Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("230"));
  });
}
