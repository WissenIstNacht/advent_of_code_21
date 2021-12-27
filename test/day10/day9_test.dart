import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day10/p1.dart';
import '../../bin/day10/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(10);
  });
  test("test d10p1's solve method", () {
    solver = Day10Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("26397"));
  });
  // test("test d10p2's solve method", () {
  //   solver = Day10Part2();
  //   final res = solver.solve(sampleInput);
  //   expect(res, equals("1134"));
  // });
}
