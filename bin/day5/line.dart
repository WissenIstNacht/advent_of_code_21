import 'point.dart';

class Line {
  late Point start, end;
  late int horizontalDirection, verticalDirection;
  late int deltaX, deltaY;

  /// Constructs a line from a value string value [s] of the form "x1,y1 -> x2,y2".
  Line.fromString(String s) {
    final value = s.split(" ");
    start = Point.fromString(value.first);
    end = Point.fromString(value.last);

    horizontalDirection = start.x <= end.x ? 1 : -1;
    verticalDirection = start.y <= end.y ? 1 : -1;

    deltaX = (start.x - end.x).abs();
    deltaY = (start.y - end.y).abs();
  }

  bool isAxial() {
    return deltaX == 0 || deltaY == 0;
  }

  List<Point> pointsCovered() {
    // hoizontal lines
    var points = <Point>[];
    if (deltaY == 0) {
      for (var i = 0; i <= deltaX; i++) {
        final d = i * horizontalDirection;
        points.add(Point(start.x + d, start.y));
      }
    }
    // vertical lines
    else if (deltaX == 0) {
      for (var i = 0; i <= deltaY; i++) {
        final d = i * verticalDirection;
        points.add(Point(start.x, start.y + d));
      }
    }
    // diagonal lines
    else if (deltaX == deltaY) {
      for (var i = 0; i <= deltaY; i++) {
        final hd = i * horizontalDirection;
        final vd = i * verticalDirection;
        points.add(Point(start.x + hd, start.y + vd));
      }
    } else {
      throw StateError("Line is neither axial nor diagonal");
    }
    return points;
  }
}
