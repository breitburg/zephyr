import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:zephyr/src/core/route.dart';
import 'package:zephyr/src/core/theme.dart';

class ZephyrApp extends StatelessWidget {
  final Widget home;
  final String title;
  final ThemeData theme;
  final ThemeData? _darkTheme;
  final List<Locale> locales;
  final bool showPerformanceOverlay,
      checkerboardRasterCacheImages,
      checkerboardOffscreenLayers,
      showSemanticsDebugger,
      debugShowWidgetInspector,
      debugShowCheckedModeBanner;

  const ZephyrApp({
    Key? key,
    required this.home,
    this.title = '',
    this.theme = const ThemeData(),
    ThemeData? darkTheme,
    this.locales = const [Locale('en', 'US'), Locale('ru', 'RU')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowWidgetInspector = false,
    this.debugShowCheckedModeBanner = true,
  })  : _darkTheme = darkTheme,
        super(key: key);

  ThemeData get darkTheme => _darkTheme ?? theme.dim();

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      home: home,
      title: title,
      supportedLocales: locales,
      color: theme.backgroundColor,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowWidgetInspector: debugShowWidgetInspector,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return ZephyrPageRoute(settings: settings, builder: builder);
      },
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: MediaQuery.of(context).platformBrightness == Brightness.light
              ? theme
              : darkTheme,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
