import 'package:advent_of_code_21/solver.dart';
import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../bin/day14/p1.dart';
import '../../bin/day14/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(14);
  });
  test("test d14p1's solve method", () {
    solver = Day14Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("17"));
  });
  test("test d14p2's solve method", () {
    solver = Day14Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("2"));
  });
}
