import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:zephyr/zephyr.dart';

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
      child: DefaultTextStyle(
        style: data.textStyle,
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
  final TextStyle? _textStyle;
  final Brightness? _brightness;

  const ThemeData({
    this.backgroundColor = Colors.burple,
    Color? foregroundColor,
    Brightness? brightness,
    TextStyle? textStyle,
  })  : _brightness = brightness,
        _textStyle = textStyle,
        _foregroundColor = foregroundColor;

  Brightness get brightness {
    if (_brightness != null) return _brightness!;

    var bright = _foregroundColor == null
        ? backgroundColor.computeLuminance() > .5
        : _foregroundColor!.computeLuminance() < .5;

    return bright ? Brightness.light : Brightness.dark;
  }

  TextStyle get textStyle {
    return _textStyle ??
        TextStyle(
          color: foregroundColor,
          fontFamily: 'SF Pro Rounded',
          fontSize: 20,
        );
  }

  Color get foregroundColor {
    return _foregroundColor ??
        (brightness == Brightness.light ? Colors.black : Colors.white);
  }

  SystemUiOverlayStyle get systemUiOverlayStyle {
    return brightness == Brightness.light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
  }
}
