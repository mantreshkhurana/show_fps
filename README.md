# Show FPS

[![GitHub stars](https://img.shields.io/github/stars/mantreshkhurana/show_fps.svg?style=social)](https://github.com/mantreshkhurana/show_fps)
[![pub package](https://img.shields.io/pub/v/show_fps.svg)](https://pub.dartlang.org/packages/show_fps)

Use ShowFPS to monitor your app's FPS (Frames Per Second) in real time.

![Screenshot](https://raw.githubusercontent.com/mantreshkhurana/show_fps/stable/screenshots/screenshot-1.png)

## Installation

Add `show_fps: ^1.0.0` in your project's pubspec.yaml:

```yaml
dependencies:
  show_fps: ^1.0.0
```

## Usage

Import `show_fps` in your dart file:

```dart
import 'package:show_fps/show_fps.dart';
```

Then warp your Main Widget with `ShowFPS` widget:

```dart
MaterialApp(
      title: 'FPS Monitor',
      home: Material(
        child: ShowFPS(
          visible: true,
          showChart: true,
          borderRadius: BorderRadius.all(Radius.circular(11)),
          child: MyHomePage(title: 'FPS Monitor'),
        ),
      ),
    );
```
