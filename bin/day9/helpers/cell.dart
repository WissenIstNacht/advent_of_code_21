import 'markable.dart';
import 'positionable.dart';

class Cell with Markable, Positionable {
  late int content;

  Cell.parse(String s) {
    content = int.parse(s);
    marked = content == 9 ? true : false;
  }
}
