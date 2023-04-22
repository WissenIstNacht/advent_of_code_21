import 'package:advent_of_code_21/grid/cell.dart';
import 'package:advent_of_code_21/grid/grid.dart';
import 'package:advent_of_code_21/solver.dart';

class Day15Part1 extends Solver {
  Day15Part1() : super(15);

  @override
  String solve(List<String> input) {
    const MAX_INT = 1000;
    final riskMap = RiskMap.parse(input);
    final accumulatedRiskMap =
        Grid.filled(riskMap.width + 1, riskMap.height + 1, Cell(0));

    //initialize first row accumulated Risk Map
    for (var i = 1; i < accumulatedRiskMap.width; i++) {
      accumulatedRiskMap.setCell(i, 0, Cell(MAX_INT));
    }
    accumulatedRiskMap.setCell(1, 0, Cell(0));

    //initialize first column accumulated Risk Map
    for (var j = 1; j < accumulatedRiskMap.height; j++) {
      accumulatedRiskMap.setCell(0, j, Cell(MAX_INT));
    }
    accumulatedRiskMap.setCell(0, 1, Cell(0));

    //compute accumulated risk
    for (var j = 1; j < accumulatedRiskMap.height; j++) {
      for (var i = 1; i < accumulatedRiskMap.width; i++) {
        final cellLeft = accumulatedRiskMap.getCell(i - 1, j);
        final cellTop = accumulatedRiskMap.getCell(i, j - 1);
        final riskCell = riskMap.getCell(i - 1, j - 1);

        if (cellLeft.content <= cellTop.content) {
          accumulatedRiskMap.setCell(
              i, j, Cell(cellLeft.content + riskCell.content));
        } else {
          accumulatedRiskMap.setCell(
              i, j, Cell(cellTop.content + riskCell.content));
        }
      }
    }

    final minRiskPath = accumulatedRiskMap
        .getCell(accumulatedRiskMap.width - 1, accumulatedRiskMap.height - 1)
        .content;
    final initialCellRisk = riskMap.getCell(0, 0).content;

    return (minRiskPath - initialCellRisk).toString();
  }
}

class RiskMap extends Grid<Cell<int>> {
  // RiskMap() : super();

  RiskMap.zero(int width, int height) {
    Grid.filled(width, height, Cell(0));
  }

  RiskMap.parse(List<String> lines) {
    height = lines.length;
    width = lines.first.length;

    cells = [];
    lines.forEach((line) {
      final parsedLine =
          line.split("").map((char) => Cell(int.parse(char))).toList();
      cells.add(parsedLine);
    });
  }
}
