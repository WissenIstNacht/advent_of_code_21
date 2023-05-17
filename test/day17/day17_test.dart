import 'package:advent_of_code_21/solver.dart';
import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../bin/day17/p1.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(17);
  });
  test("test d17p1's solve method", () {
    solver = Day17Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("45"));
  });
}
