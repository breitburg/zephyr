import 'package:flutter/services.dart';
import 'package:zephyr/zephyr.dart';

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
      child: Container(
        color: appTheme.backgroundColor,
        child: child,
      ),
    );
  }
}
