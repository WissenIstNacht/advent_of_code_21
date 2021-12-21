import 'package:advent_of_code_21/utils.dart';
import 'package:advent_of_code_21/solver.dart';
import 'package:test/test.dart';

import '../../bin/day8/p1.dart';
// import '../../bin/day8/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(8);
  });
  test("test d8p1's solve method", () {
    solver = Day8Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("26"));
  });
  // test("test d8p2's solve method", () {
  //   solver = Day8Part2();
  //   final res = solver.solve(sampleInput);
  //   expect(res, equals("168"));
  // });
}
