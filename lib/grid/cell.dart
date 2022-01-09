import 'markable.dart';

class Cell<T> {
  late T content;

  Cell(this.content);
}

class MarkableCell<T> extends Cell<T> with Markable {
  MarkableCell(T content) : super(content) {
    marked = false;
  }
}
