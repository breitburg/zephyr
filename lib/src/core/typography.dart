import 'package:flutter/foundation.dart';
import 'package:zephyr/zephyr.dart';

class Typography with Diagnosticable {
  final TextStyle small;
  final TextStyle body;
  final TextStyle title;
  final TextStyle large;
  final TextStyle gigantic;

  final String? fontFamily;
  final Color color;

  const Typography.raw({
    required this.small,
    required this.body,
    required this.title,
    required this.large,
    required this.gigantic,
    required this.color,
    this.fontFamily,
  });

  factory Typography.fromTheme(ThemeData theme, {String? fontFamily}) {
    fontFamily ??= 'Nunito';

    return Typography.raw(
      color: theme.foregroundColor,
      small: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: theme.foregroundColor.withOpacity(.3),
        package: 'zephyr',
        height: 1.2,
      ),
      body: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: theme.foregroundColor,
        package: 'zephyr',
        height: 1.2,
      ),
      title: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily,
        color: theme.foregroundColor,
        package: 'zephyr',
        height: 1.2,
      ),
      large: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily,
        color: theme.foregroundColor,
        package: 'zephyr',
        height: 1,
      ),
      gigantic: TextStyle(
        fontSize: 52,
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily,
        color: theme.foregroundColor,
        package: 'zephyr',
        letterSpacing: -1,
        height: 1,
      ),
    );
  }

  static Typography lerp(Typography a, Typography b, double t) {
    return Typography.raw(
      small: TextStyle.lerp(a.small, b.small, t)!,
      title: TextStyle.lerp(a.title, b.title, t)!,
      body: TextStyle.lerp(a.body, b.body, t)!,
      large: TextStyle.lerp(a.large, b.large, t)!,
      gigantic: TextStyle.lerp(a.gigantic, b.gigantic, t)!,
      color: Color.lerp(a.color, b.color, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle>('small', small));
    properties.add(DiagnosticsProperty<TextStyle>('title', title));
    properties.add(DiagnosticsProperty<TextStyle>('body', body));
    properties.add(DiagnosticsProperty<TextStyle>('gigantic', gigantic));
    properties.add(DiagnosticsProperty<TextStyle>('large', large));
    properties.add(StringProperty('fontFamily', fontFamily));
    properties.add(ColorProperty('color', color));
  }
}
