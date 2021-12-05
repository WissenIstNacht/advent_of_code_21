import 'dart:io';

import 'package:test/test.dart';
import 'package:advent_of_code_21/solver.dart';

import '../../bin/day1/d1p1.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    solver = Day1Part1();
    sampleInput = File("test/day1/inputs/sample.txt").readAsLinesSync();
  });
  test("test d1p1's solve method", () {
    final res = solver.solve(sampleInput);
    expect(res, equals("7"));
  });
}
