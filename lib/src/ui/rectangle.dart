import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Rectangle extends SingleChildRenderObjectWidget {
  Rectangle({Key? key, required Widget child})
      : super(
          key: key,
          child: child,
        );

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRectangle();
  }
}

class RenderRectangle extends RenderShiftedBox {
  RenderRectangle({RenderBox? child}) : super(child);

  @override
  void performLayout() {
    size = constraints.constrain(
      Size(constraints.maxWidth, 50),
    );
    child!.layout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height),
        Radius.circular(20),
      ),
      Paint()..color = Color.fromRGBO(0, 0, 0, .15),
    );

    context.paintChild(
      child!,
      offset +
          Offset(
            size.width / 2 - child!.size.width / 2,
            size.height / 2 - child!.size.height / 2,
          ),
    );
  }
}
