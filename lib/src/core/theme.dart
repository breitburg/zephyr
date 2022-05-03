import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:zephyr/zephyr.dart';

class ZephyrTheme extends StatelessWidget {
  const ZephyrTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final ZephyrThemeData data;
  final Widget child;

  static ZephyrThemeData of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedZephyrTheme>()!
        .data;
  }

  static ZephyrThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedZephyrTheme>()
        ?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedZephyrTheme(
      data: data,
      child: DefaultTextStyle(
        style: TextStyle(
          color: data.foregroundColor,
          fontFamily: data.fontFamily,
        ),
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

  final ZephyrThemeData data;

  @override
  bool updateShouldNotify(covariant _InheritedZephyrTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _InheritedZephyrTheme(child: child, data: data);
  }
}

class ZephyrThemeData with Diagnosticable {
  final Color primaryColor;
  final String fontFamily;
  final Brightness? _brightness;

  const ZephyrThemeData({
    this.primaryColor = Colors.burple,
    this.fontFamily = 'SF Pro Rounded',
    Brightness? brightness,
  }) : _brightness = brightness;

  Brightness get brightness {
    return _brightness ??
        (primaryColor.computeLuminance() < .5
            ? Brightness.dark
            : Brightness.light);
  }

  Color get foregroundColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;

  SystemUiOverlayStyle get systemUiOverlayStyle =>
      brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light;
}
