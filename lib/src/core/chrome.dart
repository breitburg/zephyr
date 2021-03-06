import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:zephyr/src/core/theme.dart';

class Chrome extends StatelessWidget {
  final Widget child;

  Chrome({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTheme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: appTheme.systemUiOverlayStyle,
      child: AnimatedContainer(
        color: appTheme.backgroundColor,
        duration: kThemeAnimationDuration,
        child: child,
      ),
    );
  }
}
