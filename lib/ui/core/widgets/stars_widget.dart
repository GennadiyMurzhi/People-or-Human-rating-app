import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  final Color color;
  final double fillStarsIndex;
  final Size size;

  const StarsWidget({
    Key? key,
    required this.color,
    required this.fillStarsIndex,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: StarsPainter(fillStarsIndex, color),
    );
  }
}

class StarsPainter extends CustomPainter {
  final Color color;
  final double fillStarsIndex;

  StarsPainter(this.fillStarsIndex, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    int fillStars = fillStarsIndex.truncateToDouble().toInt();
    int partiallyFilledStar = ((fillStarsIndex - fillStars) * 10).round();

    for (int i = 0; i < 5; i++) {
      if (i <= fillStars - 1) {
        canvas.drawPath(_starPath(size, i, null), paint);
      } else if (i == fillStars) {
        canvas.drawPath(_starPath(size, i, partiallyFilledStar), paint);
      } else {
        canvas.drawPath(_starPath(size, i, 0), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Path _starPath(Size size, int starNumber, int? fillerPart) {
  List<double> startPositionIndex = [
    0,
    0.21568625,
    0.43137255,
    0.64876385,
    0.86615515,
  ];

  Path path = Path();
  path.moveTo(size.width * (0.08354348 + startPositionIndex[starNumber]), size.height * 0.3310000);
  path.lineTo(size.width * (0.1304348 + startPositionIndex[starNumber]), size.height * 0.3620000);
  path.lineTo(size.width * (0.09489130 + startPositionIndex[starNumber]), size.height * 0.5985000);
  path.lineTo(size.width * (0.1055217 + startPositionIndex[starNumber]), size.height * 0.9500000);
  path.lineTo(size.width * (0.08536957 + startPositionIndex[starNumber]), size.height * 0.8567467);
  path.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.7635000);
  path.lineTo(size.width * (0.02491304 + startPositionIndex[starNumber]), size.height * 0.9500000);
  path.lineTo(size.width * (0.03560870 + startPositionIndex[starNumber]), size.height * 0.5985000);
  path.lineTo(size.width * startPositionIndex[starNumber], size.height * 0.3620000);
  path.lineTo(size.width * (0.04689130 + startPositionIndex[starNumber]), size.height * 0.3315000);
  path.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), 0);
  path.lineTo(size.width * (0.08354348 + startPositionIndex[starNumber]), size.height * 0.3310000);
  path.close();

  if (fillerPart == 0) {
    Path path00 = Path();
    path00.moveTo(size.width * (0.1049304 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path00.lineTo(size.width * (0.07637391 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path00.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.2046667);
    path00.lineTo(size.width * (0.05413043 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path00.lineTo(size.width * (0.02608696 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path00.lineTo(size.width * (0.04782609 + startPositionIndex[starNumber]), size.height * 0.5666667);
    path00.lineTo(size.width * (0.04065217 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path00.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.6666667);
    path00.lineTo(size.width * (0.08980870 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path00.lineTo(size.width * (0.08328696 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path00.lineTo(size.width * (0.1049391 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path00.close();
    path.addPath(path00, Offset.zero);
  } else if (fillerPart == 1) {
    Path path01 = Path();
    path01.moveTo(size.width * (0.04069565 + startPositionIndex[starNumber]), size.height * 0.7835000);
    path01.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.6700000);
    path01.lineTo(size.width * (0.08980435 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path01.lineTo(size.width * (0.08328261 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path01.lineTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path01.lineTo(size.width * (0.07636957 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path01.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.2050000);
    path01.lineTo(size.width * (0.05413043 + startPositionIndex[starNumber]), size.height * 0.4065000);
    path01.lineTo(size.width * (0.03478261 + startPositionIndex[starNumber]), size.height * 0.4193693);
    path01.lineTo(size.width * (0.03478261 + startPositionIndex[starNumber]), size.height * 0.4868013);
    path01.lineTo(size.width * (0.04721739 + startPositionIndex[starNumber]), size.height * 0.5695000);
    path01.lineTo(size.width * (0.04069565 + startPositionIndex[starNumber]), size.height * 0.7835000);
    path01.close();
    path.addPath(path01, Offset.zero);
  } else if (fillerPart == 2) {
    Path path02 = Path();
    path02.moveTo(size.width * (0.04347826 + startPositionIndex[starNumber]), size.height * 0.7666667);
    path02.lineTo(size.width * (0.04347826 + startPositionIndex[starNumber]), size.height * 0.7706200);
    path02.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.6700000);
    path02.lineTo(size.width * (0.08980435 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path02.lineTo(size.width * (0.08328261 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path02.lineTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path02.lineTo(size.width * (0.07636957 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path02.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.2050000);
    path02.lineTo(size.width * (0.05413043 + startPositionIndex[starNumber]), size.height * 0.4065000);
    path02.lineTo(size.width * (0.04347826 + startPositionIndex[starNumber]), size.height * 0.4135853);
    path02.lineTo(size.width * (0.04347826 + startPositionIndex[starNumber]), size.height * 0.4333333);
    path02.lineTo(size.width * (0.04347826 + startPositionIndex[starNumber]), size.height * 0.5000000);
    path02.lineTo(size.width * (0.04347826 + startPositionIndex[starNumber]), size.height * 0.5446327);
    path02.lineTo(size.width * (0.04721739 + startPositionIndex[starNumber]), size.height * 0.5695000);
    path02.lineTo(size.width * (0.04347826 + startPositionIndex[starNumber]), size.height * 0.6921933);
    path02.lineTo(size.width * (0.04347826 + startPositionIndex[starNumber]), size.height * 0.7666667);
    path02.close();
    path.addPath(path02, Offset.zero);
  } else if (fillerPart == 3) {
    Path path03 = Path();
    path03.moveTo(size.width * (0.06465517 + startPositionIndex[starNumber]), size.height * 0.2050000);
    path03.lineTo(size.width * (0.05366379 + startPositionIndex[starNumber]), size.height * 0.4065000);
    path03.lineTo(size.width * (0.05172414 + startPositionIndex[starNumber]), size.height * 0.4078013);
    path03.lineTo(size.width * (0.05172414 + startPositionIndex[starNumber]), size.height * 0.7303733);
    path03.lineTo(size.width * (0.06465517 + startPositionIndex[starNumber]), size.height * 0.6700000);
    path03.lineTo(size.width * (0.08903017 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path03.lineTo(size.width * (0.08256466 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path03.lineTo(size.width * (0.1040302 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path03.lineTo(size.width * (0.07571121 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path03.lineTo(size.width * (0.06465517 + startPositionIndex[starNumber]), size.height * 0.2050000);
    path03.close();
    path.addPath(path03, Offset.zero);
  } else if (fillerPart == 4) {
    Path path04 = Path();
    path04.moveTo(size.width * (0.07571121 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path04.lineTo(size.width * (0.06465517 + startPositionIndex[starNumber]), size.height * 0.2050000);
    path04.lineTo(size.width * (0.06034483 + startPositionIndex[starNumber]), size.height * 0.2840193);
    path04.lineTo(size.width * (0.06034483 + startPositionIndex[starNumber]), size.height * 0.6901267);
    path04.lineTo(size.width * (0.06465517 + startPositionIndex[starNumber]), size.height * 0.6700000);
    path04.lineTo(size.width * (0.08903017 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path04.lineTo(size.width * (0.08256466 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path04.lineTo(size.width * (0.1040302 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path04.lineTo(size.width * (0.07571121 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path04.close();
    path.addPath(path04, Offset.zero);
  } else if (fillerPart == 5) {
    Path path05 = Path();
    path05.moveTo(size.width * (0.1049304 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path05.lineTo(size.width * (0.07637391 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path05.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.2046667);
    path05.lineTo(size.width * (0.06521739 + startPositionIndex[starNumber]), size.height * 0.6666667);
    path05.lineTo(size.width * (0.08980870 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path05.lineTo(size.width * (0.08328696 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path05.lineTo(size.width * (0.1049391 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path05.close();
    path.addPath(path05, Offset.zero);
  } else if (fillerPart == 6) {
    Path path06 = Path();
    path06.moveTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path06.lineTo(size.width * (0.07636957 + startPositionIndex[starNumber]), size.height * 0.4070000);
    path06.lineTo(size.width * (0.06956522 + startPositionIndex[starNumber]), size.height * 0.2837527);
    path06.lineTo(size.width * (0.06956522 + startPositionIndex[starNumber]), size.height * 0.6901600);
    path06.lineTo(size.width * (0.08980435 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path06.lineTo(size.width * (0.08328261 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path06.lineTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path06.close();
    path.addPath(path06, Offset.zero);
  } else if (fillerPart == 7) {
    Path path07 = Path();
    path07.moveTo(size.width * (0.08328261 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path07.lineTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path07.lineTo(size.width * (0.07826087 + startPositionIndex[starNumber]), size.height * 0.4082580);
    path07.lineTo(size.width * (0.07826087 + startPositionIndex[starNumber]), size.height * 0.7333333);
    path07.lineTo(size.width * (0.08980435 + startPositionIndex[starNumber]), size.height * 0.7840000);
    path07.lineTo(size.width * (0.08328261 + startPositionIndex[starNumber]), size.height * 0.5700000);
    path07.close();
    path.addPath(path07, Offset.zero);
  } else if (fillerPart == 8) {
    Path path08 = Path();
    path08.moveTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path08.lineTo(size.width * (0.08695652 + startPositionIndex[starNumber]), size.height * 0.4140420);
    path08.lineTo(size.width * (0.08653078 + startPositionIndex[starNumber]), size.height * 0.5483973);
    path08.lineTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path08.close();
    path.addPath(path08, Offset.zero);
  } else if (fillerPart == 9) {
    Path path09 = Path();
    path09.moveTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path09.lineTo(size.width * (0.09565217 + startPositionIndex[starNumber]), size.height * 0.4198260);
    path09.lineTo(size.width * (0.09565217 + startPositionIndex[starNumber]), size.height * 0.4877347);
    path09.lineTo(size.width * (0.1049348 + startPositionIndex[starNumber]), size.height * 0.4260000);
    path09.close();
    path.addPath(path09, Offset.zero);
  }

  return path;
}
