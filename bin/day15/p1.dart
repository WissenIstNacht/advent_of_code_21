import 'dart:collection';

import 'package:advent_of_code_21/solver.dart';

import 'helpers/risk_map.dart';

class Day15Part1 extends Solver {
  Day15Part1() : super(15);

  @override
  String solve(List<String> input) {
    final riskMap = RiskMap.parse(input);
    final res = dijktra(riskMap);
    return res.toString();
  }

  static int dijktra(RiskMap map) {
    map.getCell(0, 0).distance = 0;

    var queue = Queue<VertexCell>();
    map.forEach((c) => queue.add(c as VertexCell));
    while (queue.isNotEmpty) {
      var lowestDistance = queue.take(1).first;
      for (var cell in queue) {
        if (cell.distance < lowestDistance.distance) {
          lowestDistance = cell;
        }
      }

      queue.remove(lowestDistance);

      var neighbors = map.getNeighbours(lowestDistance.x, lowestDistance.y);
      var remainingNeighbors = neighbors.where((n) => queue.contains(n));
      remainingNeighbors.forEach((n) {
        var alternative = lowestDistance.distance + n.content;
        if (alternative < n.distance) {
          n.distance = alternative;
          n.previous = lowestDistance;
        }
      });
    }
    var res = map.getCell(map.width - 1, map.height - 1).distance;
    return res;
  }
}
