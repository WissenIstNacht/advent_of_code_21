import 'package:advent_of_code_21/grid/cell.dart';
import 'package:advent_of_code_21/grid/markable.dart';

class Dot extends Cell with Markable {
  Dot() : super(null) {
    marked = false;
  }
}
