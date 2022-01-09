import 'package:advent_of_code_21/grid/cell.dart';

class Number extends MarkableCell<int> {
  Number.parse(String s) : super(int.parse(s));
}
