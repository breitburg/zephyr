import 'package:flutter/widgets.dart';
import 'package:zephyr/zephyr.dart';

class ZephyrApp extends StatelessWidget {
  final Widget home;
  final String title;
  final ZephyrThemeData theme;

  const ZephyrApp({
    Key? key,
    required this.home,
    this.title = '',
    this.theme = const ZephyrThemeData(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZephyrTheme(
      data: theme,
      child: WidgetsApp(
        color: theme.primaryColor,
        home: home,
        title: title,
        pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
          return ZephyrPageRoute(settings: settings, builder: builder);
        },
        builder: (BuildContext context, Widget? child) {
          return ZephyrTheme(
            data: theme,
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
