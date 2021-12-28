import 'markable.dart';
import 'positionable.dart';

class Cell with Markable, Positionable {
  late int content;

  Cell.parseWithPosition(String s, int x, int y) {
    content = int.parse(s);
    marked = content == 9 ? true : false;
    this.x = x;
    this.y = y;
  }
}
