import 'package:advent_of_code_21/solver.dart';
import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../bin/day15/p1.dart';
import '../../bin/day15/p2.dart';

void main() {
  late Solver solver;
  late List<String> sampleInput;
  setUp(() {
    sampleInput = readSampleInput(15);
  });
  test("test d15p1's solve method", () {
    solver = Day15Part1();
    final res = solver.solve(sampleInput);
    expect(res, equals("40"));
  });
  test("test line variation creation dimension", () {
    solver = Day15Part2();
    final lineVars = (solver as Day15Part2).createLineVariations(sampleInput);
    expect(lineVars.length, equals(sampleInput.length));
  });
  test("test line variation creation first element", () {
    solver = Day15Part2();
    final lineVars = (solver as Day15Part2).createLineVariations(sampleInput);
    final res = lineVars.first.first;
    expect(res, equals("1163751742"));
  });
  test("test line creation variation las element", () {
    solver = Day15Part2();
    final lineVars = (solver as Day15Part2).createLineVariations(sampleInput);
    final res = lineVars.last.last;
    expect(res, equals("1299833479"));
  });
  test("test extended input creation's dimension", () {
    Day15Part2 solver = Day15Part2();
    final lineVars = solver.createLineVariations(sampleInput);
    final extInput = solver.createExtendedInput(lineVars);

    expect(extInput.length, equals(5 * sampleInput.length));
  });
  test("test extended input creation's first line", () {
    Day15Part2 solver = Day15Part2();
    final lineVars = solver.createLineVariations(sampleInput);
    final extInput = solver.createExtendedInput(lineVars);

    final res = extInput.first;
    expect(res, equals("11637517422274862853338597396444961841755517295286"));
  });
  test("test extended input creation's last line", () {
    Day15Part2 solver = Day15Part2();
    final lineVars = solver.createLineVariations(sampleInput);
    final extInput = solver.createExtendedInput(lineVars);

    // print(extInput);
    final res = extInput.last;
    expect(res, equals("67554889357866599146897761125791887223681299833479"));
  });
  test("test d15p2's solve method", () {
    solver = Day15Part2();
    final res = solver.solve(sampleInput);
    expect(res, equals("315"));
  });
}
