import 'targetArea.dart';

class Probe {
  int posX = 0;
  int posY = 0;

  int initVelocityX;
  int initVelocityY;

  Probe(this.posX, this.posY, this.initVelocityX, this.initVelocityY);

  Probe.atOrigin(this.initVelocityX, this.initVelocityY);

  void move(int step) {
    final deltaX = step > initVelocityX ? 0 : initVelocityX - step;
    posX += deltaX;

    final deltaY = initVelocityY - step;
    posY += deltaY;
  }

  bool isInArea(TargetArea area) {
    return posX >= area.xLo &&
        posX <= area.xHi &&
        posY >= area.yLo &&
        posY <= area.yHi;
  }

  bool isPastArea(TargetArea area) {
    return posX > area.xHi || posY < area.yHi;
  }
}
