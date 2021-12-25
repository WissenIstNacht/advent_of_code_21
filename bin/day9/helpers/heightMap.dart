class HeightMap {
  late int width, height;
  late List<List<int>> heights;

  HeightMap.parse(List<String> lines) {
    height = lines.length;
    width = lines.first.length;

    heights = [];
    for (var line in lines) {
      final parsedLine = line.split("").map((s) => int.parse(s)).toList();
      heights.add(parsedLine);
    }
  }

  List<int> getNeighbours(int x, int y) {
    if (x < 0 || x >= height || y < 0 || y >= width) {
      throw ArgumentError("Arguments are out of bounds");
    }
    final neighbours = <int>[];
    if (x - 1 >= 0) neighbours.add(heights[x - 1][y]);
    if (y - 1 >= 0) neighbours.add(heights[x][y - 1]);
    if (x + 1 < width) neighbours.add(heights[x + 1][y]);
    if (y + 1 < height) neighbours.add(heights[x][y + 1]);

    return neighbours;
  }

  bool isLowPoint(int val, List<int> neighbours) =>
      neighbours.every((e) => e > val);

  List<int> findLowPoints() {
    final lows = <int>[];
    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final currHeight = heights[i][j];
        final neighbours = getNeighbours(i, j);
        if (isLowPoint(currHeight, neighbours)) lows.add(currHeight);
      }
    }
    return lows;
  }
}
