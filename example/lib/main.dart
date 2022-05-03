import 'package:flutter/widgets.dart';
import 'package:zephyr/zephyr.dart';

void main() {
  runApp(MarshmallowApp());
}

class MarshmallowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZephyrApp(
      theme: ZephyrThemeData(),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chrome(
      child: Center(
        child: GestureDetector(
          child: Text('Tap to open second screen'),
          onTap: () => Navigator.of(context)
              .push(ZephyrPageRoute(builder: (BuildContext context) {
            return SecondScreen();
          })),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chrome(
      child: Center(
        child: Row(
          children: [
            GestureDetector(
              child: Text('Back'),
              onTap: () => Navigator.of(context).pop(),
            ),
            Text('Yo! This is the second screen'),
          ],
        ),
      ),
    );
  }
}
