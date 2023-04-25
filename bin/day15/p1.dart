import 'package:advent_of_code_21/solver.dart';
import 'package:collection/collection.dart';

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
    var source = map.getCell(0, 0);
    source.distance = 0;
    var target = map.getCell(map.width - 1, map.height - 1);

    var queue = PriorityQueue((VertexCell v1, VertexCell v2) {
      if (v1.distance < v2.distance) {
        return -1;
      } else if (v1.distance > v2.distance) {
        return 1;
      } else {
        return 0;
      }
    });
    map.forEach((c) => queue.add(c as VertexCell));
    queue.add(source);
    while (queue.isNotEmpty) {
      var lowestDistance = queue.removeFirst();

      if (lowestDistance == target) {
        return target.distance;
      }

      var neighbors = map.getNeighbours(lowestDistance.x, lowestDistance.y);
      var remainingNeighbors = neighbors.where((n) => queue.contains(n));

      remainingNeighbors.forEach((n) {
        var alternative = lowestDistance.distance + n.content;
        if (alternative < n.distance) {
          n.distance = alternative;
          n.previous = lowestDistance;
          queue.remove(n);
          queue.add(n);
        }
      });
    }

    var res = target.distance;
    return res;
  }
}
