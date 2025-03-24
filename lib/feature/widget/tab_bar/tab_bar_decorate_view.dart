import 'package:flutter/material.dart';

class TabBarDecorateView extends Decoration {
  final double width;
  final double height;

  const TabBarDecorateView({required this.width, this.height = 2}); // 인디케이터 높이

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(width: width, height: height);
  }
}

class _CustomPainter extends BoxPainter {
  final double width;
  final double height;

  _CustomPainter({required this.width, required this.height});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill;

    // indicator position and size calculation
    final double xCenter = offset.dx + (configuration.size!.width / 2);
    // indicator height
    final double yBottom = configuration.size!.height - height;
    // 가운데 기준으로 start
    final double startX = xCenter - (width / 2);
    // 가운데 기준으로 end
    final double endX = xCenter + (width / 2);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(startX, yBottom, endX, yBottom + 2),
        Radius.circular(height / 2),
      ),
      paint,
    );
  }
}
