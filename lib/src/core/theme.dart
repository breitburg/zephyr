import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:zephyr/zephyr.dart';

const Duration kThemeAnimationDuration = Duration(milliseconds: 200);

class Theme extends StatelessWidget {
  const Theme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final ThemeData data;
  final Widget child;

  static ThemeData of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedZephyrTheme>()!
        .data;
  }

  static ThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedZephyrTheme>()
        ?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedZephyrTheme(
      data: data,
      child: AnimatedDefaultTextStyle(
        duration: kThemeAnimationDuration,
        style: data.typography.body,
        child: child,
      ),
    );
  }
}

class _InheritedZephyrTheme extends InheritedTheme {
  const _InheritedZephyrTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final ThemeData data;

  @override
  bool updateShouldNotify(covariant _InheritedZephyrTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _InheritedZephyrTheme(child: child, data: data);
  }
}

class ThemeData with Diagnosticable {
  final Color backgroundColor;
  final Color? _foregroundColor;
  final Typography? _typography;
  final Brightness? _brightness;

  const ThemeData({
    this.backgroundColor = Colors.burple,
    Color? foregroundColor,
    Brightness? brightness,
    Typography? typography,
  })  : _brightness = brightness,
        _typography = typography,
        _foregroundColor = foregroundColor;

  Brightness get brightness {
    if (_brightness != null) return _brightness!;

    var contrast = _foregroundColor == null
        ? backgroundColor.computeLuminance() > .5
        : _foregroundColor!.computeLuminance() < .5;

    return contrast ? Brightness.light : Brightness.dark;
  }

  Typography get typography {
    return _typography ?? Typography.fromTheme(this);
  }

  Color get foregroundColor {
    return _foregroundColor ?? (bright ? Colors.black : Colors.white);
  }

  SystemUiOverlayStyle get systemUiOverlayStyle {
    return bright ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light;
  }

  bool get bright => brightness == Brightness.light;

  ThemeData dim() {
    return ThemeData(
      backgroundColor: Colors.black,
      foregroundColor: backgroundColor.computeLuminance() < .05
          ? Colors.white
          : backgroundColor,
      brightness: Brightness.dark,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Brightness>('brightness', brightness));
    properties.add(ColorProperty('foregroundColor', foregroundColor));
    properties.add(DiagnosticsProperty<Typography>('typography', typography));
  }
}
