import 'package:advent_of_code_21/solver.dart';
import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../bin/day16/p1.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(15);
  });
  test("test d16p1's solve method", () {
    solver = Day16Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("42"));
  });
}
