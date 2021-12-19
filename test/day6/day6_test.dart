import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day6/p1.dart';
import '../../bin/day6/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(6);
  });
  test("test d6p1's solve method", () {
    solver = Day6Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("5934"));
  });
  test("test d6p2's solve method", () {
    solver = Day6Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("26984457539"));
  });
}
