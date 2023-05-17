import 'dart:core';

class TargetArea {
  late int xLo, xHi;
  late int yLo, yHi;

  TargetArea(this.xLo, this.xHi, this.yLo, this.yHi);

  TargetArea.parse(String limits) {
    final dims = limits.split(",").map((s) {
      final trimmedDimension = s.trim();
      final removeAssignmnet = trimmedDimension.substring(2);
      return removeAssignmnet.split("..").map((n) => int.parse(n));
    });
    xLo = dims.first.first;
    xHi = dims.first.last;
    yLo = dims.last.first;
    yHi = dims.last.last;
  }

  int get width {
    return xHi - xLo;
  }

  int get height {
    return yHi - yLo;
  }

  int get farthestY {
    if (yHi.abs() > yLo.abs()) {
      return yHi;
    } else {
      return yLo;
    }
  }
}
