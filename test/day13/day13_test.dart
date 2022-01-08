import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day13/p1.dart';
import '../../bin/day13/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(13);
  });
  test("test d13p1's solve method", () {
    solver = Day13Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("17"));
  });
  test("test d13p2's solve method", () {
    solver = Day13Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("195"));
  });
}
