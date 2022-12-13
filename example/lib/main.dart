import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:show_fps/show_fps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'FPS Monitor',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: ShowFPS(
        visible: true,
        showChart: false,
        borderRadius: BorderRadius.all(Radius.circular(11)),
        child: MyHomePage(title: 'FPS Monitor'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final random = Random();
  final stopwatch = Stopwatch();
  int throttledFramesCount = 0;

  void throttle() {
    stopwatch.start();

    int duration = random.nextInt(30) + 10;

    while (stopwatch.elapsedMilliseconds < duration) {}
    stopwatch.reset();
    stopwatch.stop();

    if (throttledFramesCount > 7) {
      throttledFramesCount = 0;
      return;
    }

    throttledFramesCount++;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      throttle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: const Text('Throttle'),
              onPressed: () {
                throttle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
