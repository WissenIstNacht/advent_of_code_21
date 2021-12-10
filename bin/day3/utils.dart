import 'dart:math';
import 'package:collection/collection.dart';

num bitsToInt(Iterable<int> bitArray) {
  var cols = bitArray.length;
  return bitArray
      .mapIndexed((index, elem) => elem == 1 ? pow(2, cols - (index + 1)) : 0)
      .reduce((a, b) => a + b);
}
