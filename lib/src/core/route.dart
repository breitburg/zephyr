import 'package:zephyr/zephyr.dart';

class ZephyrPageRoute<T> extends PageRoute<T> {
  final bool _maintainState;
  final String? _barrierLabel;
  final WidgetBuilder _builder;

  ZephyrPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })  : _maintainState = maintainState,
        _barrierLabel = barrierLabel,
        _builder = builder,
        super(
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = _builder(context);

    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        ),
        child: result,
      ),
    );
  }

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => _barrierLabel;

  @override
  bool get maintainState => _maintainState;

  @override
  Duration get transitionDuration => kThemeAnimationDuration;
}
