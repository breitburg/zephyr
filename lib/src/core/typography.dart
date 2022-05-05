import 'package:flutter/foundation.dart';
import 'package:zephyr/zephyr.dart';

class Typography with Diagnosticable {
  final TextStyle small;
  final TextStyle normal;
  final TextStyle large;
  final TextStyle extraLarge;

  final String? fontFamily;
  final Color color;

  const Typography.raw({
    required this.small,
    required this.normal,
    required this.large,
    required this.extraLarge,
    required this.color,
    this.fontFamily,
  });

  factory Typography.fromTheme(ThemeData theme, {String? fontFamily}) {
    fontFamily ??= 'Nunito';

    return Typography.raw(
      color: theme.foregroundColor,
      small: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: theme.foregroundColor,
        package: 'zephyr',
      ),
      normal: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: theme.foregroundColor,
        package: 'zephyr',
      ),
      large: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: theme.foregroundColor,
        package: 'zephyr',
      ),
      extraLarge: TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily,
        color: theme.foregroundColor,
        package: 'zephyr',
        height: 1,
      ),
    );
  }

  static Typography lerp(Typography a, Typography b, double t) {
    return Typography.raw(
      small: TextStyle.lerp(a.small, b.small, t)!,
      normal: TextStyle.lerp(a.normal, b.normal, t)!,
      large: TextStyle.lerp(a.large, b.large, t)!,
      extraLarge: TextStyle.lerp(a.extraLarge, b.extraLarge, t)!,
      color: Color.lerp(a.color, b.color, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle>('small', small));
    properties.add(DiagnosticsProperty<TextStyle>('normal', normal));
    properties.add(DiagnosticsProperty<TextStyle>('large', large));
    properties.add(DiagnosticsProperty<TextStyle>('extraLarge', extraLarge));
    properties.add(StringProperty('fontFamily', fontFamily));
    properties.add(ColorProperty('color', color));
  }
}
