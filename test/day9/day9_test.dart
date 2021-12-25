import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day9/p1.dart';
import '../../bin/day9/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(9);
  });
  test("test d9p1's solve method", () {
    solver = Day9Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("26"));
  });
  test("test d9p2's solve method", () {
    solver = Day9Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("61229"));
  });
}
