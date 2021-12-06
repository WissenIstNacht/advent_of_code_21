import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day2/p1.dart';
import '../../bin/day2/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(2);
  });
  test("test d2p1's solve method", () {
    solver = Day2Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("150"));
  });
  test("test d2p2's solve method", () {
    solver = Day2Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("900"));
  });
}
