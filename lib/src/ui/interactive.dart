import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class InteractionDrawer extends AnimatedWidget {
  final Widget child;

  const InteractionDrawer({
    Key? key,
    required this.child,
    required Animation<double> controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _value => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1 - _value.value * .3,
      child: Transform.scale(
        scale: 1 - _value.value * .15,
        child: child,
      ),
    );
  }
}

class Interactable extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const Interactable({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Interactable> createState() => _InteractableState();
}

class _InteractableState extends State<Interactable>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _scale = _controller.drive(
      CurveTween(curve: Curves.easeInOutCirc),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onCanceled([dynamic event]) async {
    await HapticFeedback.lightImpact();
    await _controller.reverse();
  }

  Future<void> _onTapped([dynamic event]) async {
    await HapticFeedback.lightImpact();
    await _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _onTapped();
        widget.onTap();
        await _onCanceled();
      },
      onTapDown: _onTapped,
      onTapUp: _onCanceled,
      onTapCancel: _onCanceled,
      child: InteractionDrawer(
        child: widget.child,
        controller: _scale,
      ),
    );
  }
}
