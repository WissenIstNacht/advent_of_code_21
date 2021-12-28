import 'package:advent_of_code_21/grid/cell.dart';
import 'package:advent_of_code_21/grid/markable.dart';
import 'package:advent_of_code_21/grid/positionable.dart';

class Height extends Cell<int> with Markable, Positionable {
  Height.parseWithPosition(String s, int x, int y) : super(int.parse(s)) {
    marked = content == 9 ? true : false;
    this.x = x;
    this.y = y;
  }
}
