import 'point.dart';

class Line {
  late Point start, end;

  /// Constructs a line from a value string value [s] of the form "x1,y1 -> x2,y2".
  Line.fromString(String s) {
    final value = s.split(" ");
    start = Point.fromString(value.first);
    end = Point.fromString(value.last);
  }
}
