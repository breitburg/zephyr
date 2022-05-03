import 'package:flutter/material.dart';

void main() => runApp(MarshmallowApp());

class MarshmallowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello, world')),
    );
  }
}
