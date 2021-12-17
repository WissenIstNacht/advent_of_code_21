import 'line.dart';
import 'point.dart';

/// find grid's dimension by finding largest x and y coordinates of points
Point findDimensions(Iterable<Line> lines) {
  var largestX = 0, largestY = 0;
  lines.forEach((l) {
    if (l.start.x > largestX) largestX = l.start.x;
    if (l.end.x > largestX) largestX = l.end.x;
    if (l.start.y > largestY) largestY = l.start.y;
    if (l.end.y > largestY) largestY = l.end.y;
  });

  // since points are 0-indexed, corresponding dimensions will be one larger.
  return Point(largestX + 1, largestY + 1);
}
