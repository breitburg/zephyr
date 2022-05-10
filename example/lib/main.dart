import 'package:zephyr/zephyr.dart';

void main() {
  runApp(MarshmallowApp());
}

class MarshmallowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZephyrApp(
      title: 'Marshmallow',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var times = 0;

  @override
  Widget build(BuildContext context) {
    return Chrome(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              times.toString(),
              style: Theme.of(context).typography.gigantic,
            ),
            SizedBox(height: 30),
            PushButton(
              child: Text('Тыкни сюда'),
              onTap: () => setState(() => times += 1),
            ),
          ],
        ),
      ),
    );
  }
}
