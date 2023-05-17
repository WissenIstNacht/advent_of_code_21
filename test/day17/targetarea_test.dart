import 'package:test/test.dart';

import '../../bin/day17/helpers/targetArea.dart';

void main() {
  test("target area parsing", () {
    final targetArea = TargetArea.parse("x=20..30, y=-10..-5");
    final res = <int>[
      targetArea.xLo,
      targetArea.xHi,
      targetArea.yLo,
      targetArea.yHi
    ];
    expect(res, equals([20, 30, -10, -5]));
  });
  test("target area width and height", () {
    final targetArea = TargetArea.parse("x=20..30, y=-10..-5");
    final res = <int>[targetArea.width, targetArea.height];
    expect(res, equals([10, 5]));
  });
}
