import 'package:flutter/widgets.dart';
import 'package:zephyr/zephyr.dart';

void main() {
  runApp(MarshmallowApp());
}

class MarshmallowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZephyrApp(
      title: 'Marshmallow',
      theme: ZephyrThemeData(
        backgroundColor: Colors.white,
      ),
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
          child: Text('Hello, world'),
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
    return ZephyrTheme(
      data: ZephyrThemeData(backgroundColor: Colors.black),
      child: Chrome(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Text('Back ↩'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
