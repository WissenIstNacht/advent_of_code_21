import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day11/p1.dart';
import '../../bin/day11/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(11);
  });
  test("test d11p1's solve method", () {
    solver = Day11Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("1656"));
  });
  test("test d11p2's solve method", () {
    solver = Day11Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("195"));
  });
}
