class Point {
  late int x, y;

  Point(this.x, this.y);

  /// Constructs a point from a value string value [s] of the form "x,y".
  Point.fromString(String s) {
    final values = s.split(",");
    x = int.parse(values.first);
    y = int.parse(values.last);
  }
}
