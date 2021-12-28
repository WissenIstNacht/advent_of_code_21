import 'package:advent_of_code_21/grid/cell.dart';
import 'package:advent_of_code_21/grid/markable.dart';

class Number extends Cell<int> with Markable {
  Number.parse(String s) : super(int.parse(s)) {
    marked = false;
  }
}
