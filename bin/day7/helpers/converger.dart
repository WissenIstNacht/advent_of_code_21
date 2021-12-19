class Converger {
  int fuel = 0;
  late List<int> positionCount;
  late int hi, lo;

  Converger.fromPositions(List<int> positions) {
    positions.sort();

    lo = 0;
    hi = positions.last;

    positionCount = List.filled(hi, 0);

    for (var position in positions) {
      positionCount[position]++;
    }
  }
}
