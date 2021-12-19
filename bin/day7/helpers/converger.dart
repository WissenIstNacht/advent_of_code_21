class Converger {
  int fuel = 0;
  late List<int> positionCount;
  int lo = 0;
  late int hi;

  Converger.fromPositions(List<int> positions) {
    positions.sort();

    // TODO improve  on by removing unused lower parts of array
    hi = positions.last;
    positionCount = List.filled(hi + 1, 0);

    for (var position in positions) {
      positionCount[position]++;
    }
  }

  bool hasConverged() => hi == lo;

  void converge() {
    if (positionCount[lo] >= positionCount[hi]) {
      positionCount[hi - 1] += positionCount[hi];
      fuel += positionCount[hi];
      hi--;
    } else {
      positionCount[lo + 1] += positionCount[lo];
      fuel += positionCount[lo];
      lo++;
    }
  }
}
