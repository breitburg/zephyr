import 'package:flutter/widgets.dart';
import 'package:zephyr/src/core/theme.dart';
import 'package:zephyr/src/ui/interactive.dart';

class PushButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const PushButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Interactable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.5),
          color: Theme.of(context).foregroundColor,
        ),
        alignment: Alignment.center,
        constraints: BoxConstraints.tightFor(height: 55),
        child: Theme(
          data: Theme.of(context).dim(),
          child: child,
        ),
      ),
    );
  }
}
