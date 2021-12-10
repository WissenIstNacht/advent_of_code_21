import 'package:advent_of_code_21/solver.dart';

import 'utils.dart';

class Day3Part2 extends Solver {
  Day3Part2() : super(3);

  @override
  String solve(List<String> input) {
    final o2 = filterThrough(0, input, findMsb);
    final co2 = filterThrough(0, input, findLsb);

    List<int> sToBits(String s) {
      var bits = <int>[];
      for (var i = 0; i < s.length; i++) {
        bits.add(int.parse(s.substring(i, i + 1)));
      }
      return bits;
    }

    final no2 = bitsToInt(sToBits(o2.first));
    final nco2 = bitsToInt(sToBits(co2.first));

    return (no2 * nco2).toString();
  }

  String findMsb(Iterable<String> data, int col) {
    var counter = 0;
    for (var s in data) {
      if (s.substring(col, col + 1) == "1") {
        counter += 1;
      }
    }
    var ratio = counter / data.length;
    var msb = ratio == 0.5 ? 1 : ratio.round();
    return msb.toString();
  }

  String findLsb(Iterable<String> data, int col) {
    var counter = 0;
    for (var s in data) {
      if (s.substring(col, col + 1) == "1") {
        counter += 1;
      }
    }
    var ratio = counter / data.length;
    var lsb = ratio == 0.5 ? 0 : ratio.round() ^ 1;
    return lsb.toString();
  }

  Iterable<String> filterThrough(int index, Iterable<String> data,
      String Function(Iterable<String>, int) criteria) {
    if (data.length <= 1) return data;
    final b = criteria(data, index);
    final newData = data.where((s) => s.substring(index, index + 1) == b);
    return filterThrough(index + 1, newData, criteria);
  }
}
