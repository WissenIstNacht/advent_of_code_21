import 'package:advent_of_code_21/utils.dart';
import 'package:test/test.dart';

import '../../bin/day16/p1.dart';

void main() {
  test("d16 p1 solve method 1", () {
    final solver = Day16Part1();
    final res = solver.solve(["8A004A801A8002F478"]);
    expect(res, equals("16"));
  });
  test("d16 p1 solve method 2", () {
    final solver = Day16Part1();
    final res = solver.solve(["620080001611562C8802118E34"]);
    expect(res, equals("12"));
  });
  test("d16 p1 solve method 3", () {
    final solver = Day16Part1();
    final res = solver.solve(["C0015000016115A2E0802F182340"]);
    expect(res, equals("23"));
  });
  test("d16 p1 solve method 4", () {
    final solver = Day16Part1();
    final res = solver.solve(["A0016C880162017C3686B18A3D4780"]);
    expect(res, equals("31"));
  });
}
