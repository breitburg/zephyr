# Zephyr

A modern and cute design system, inspired by Zenly, Snapchat and Dualingo. Implemented completely from scratch, without [`material`](https://api.flutter.dev/flutter/material/material-library.html) package usage.

![Figly mockup in Figma](https://user-images.githubusercontent.com/25728414/166345247-8ed63a0e-0218-4657-859c-bc23e14c1e7b.png)

Before usage you need to import Zephyr package:

```dart
import 'package:zephyr/zephyr.dart';
```

## Usage

Define `ZephyrApp` as a root widget. It contains all essential components like theme, navigator, and routes.

```dart
// Example of [ZephyrApp] initialization
ZephyrApp(
    title: 'Example App',
    home: HomeScreen(),
    theme: ThemeData(
        backgroundColor: Colors.burple,
    ),
);
```

## Lab

At the `example/` directory you can find the "Zephyr Lab". A utility that helps to test Zephyr design system framework.

- [Get the latest build from TestFlight](https://testflight.apple.com/join/8Kby2eKK)
- [Open web-version](https://zephyrlab.onrender.com/)
