import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day5/p1.dart';
import '../../bin/day5/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(5);
  });
  test("test d5p1's solve method", () {
    solver = Day5Part1();
    final res = solver.solve(sampleInput);
    print(res);
    expect(res, equals("5"));
  });
  test("test d5p2's solve method", () {
    solver = Day5Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("12"));
  });
}
