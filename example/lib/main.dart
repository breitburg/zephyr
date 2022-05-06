import 'package:zephyr/zephyr.dart';

void main() {
  runApp(MarshmallowApp());
}

class MarshmallowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZephyrApp(
      title: 'Marshmallow',
      theme: ThemeData(),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chrome(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 10),
              Text(
                'Zephyr'.toUpperCase(),
                style: Theme.of(context).typography.large,
              ),
              Spacer(flex: 10),
              Text(
                'Pre-alpha',
                style: Theme.of(context).typography.small,
              ),
              Spacer(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'An open-source implementation\nof Zephyr design system',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
