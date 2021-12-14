import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day4/p1.dart';
import '../../bin/day4/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(4);
  });
  test("test d4p1's solve method", () {
    solver = Day4Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("4512"));
  });
  test("test d4p2's solve method", () {
    solver = Day4Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("1924"));
  });
}
