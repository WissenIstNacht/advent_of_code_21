import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day7/p1.dart';
import '../../bin/day7/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(7);
  });
  test("test d7p1's solve method", () {
    solver = Day7Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("37"));
  });
  // test("test d7p2's solve method", () {
  //   solver = Day7Part2();
  //   final res = solver.solve(sampleInput);
  //   expect(res, equals("2"));
  // });
}
