import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bomberは誰のもの？'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isPressed = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _isPressed = !_isPressed;
    });
    _playSound();
  }

  void _setIsPressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  //Audio用にメソッド追加
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _sounds = [
    'sounds/Caution.mp3',
    'sounds/BigLight.mp3',
  ];

  void _playSound() async {
    // 非同期処理を行うためにasyncを使用
    // ランダムな数値を生成（0から99まで）
    int randomNumber = Random().nextInt(100);
    if (randomNumber < 10) {
      // 10%の確率で当たった場合の処理
      await _audioPlayer.play(AssetSource('sounds/GravityDragon.mp3'));
    } else {
      //文字列をランダムに順番を変える
      _sounds.shuffle();
      // awaitを使用して音声の再生が完了するまで待機
      //　1番目の文字列を表示する
      await _audioPlayer.play(AssetSource(_sounds[0]));
    }
  }

  @override
  Widget build(BuildContext context) {
    // デバイスの幅と高さを取得
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    // ボタンのサイズをデバイスのサイズに基づいて計算（ここでは幅の50％、高さの10％）
    final double buttonWidth = deviceWidth * 0.5;
    final double buttonHeight = deviceHeight * 0.1;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'グラビティードラゴンで飲めるかい？',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: GestureDetector(
                onTapDown: (_) => _incrementCounter(), // ボタンが押された瞬間に呼び出される
                onTapUp: (_) => _setIsPressed(), // ボタンが離された瞬間に呼び出される
                // onTapCancel: () => _incrementCounter(), // タッチがキャンセルされたときに呼び出される
                child: Image.asset(
                  _isPressed
                      ? 'assets/images/スイッチ押下中.jpg'
                      : 'assets/images/スイッチ押下前.jpg',
                  fit: BoxFit.contain, // 画像をボタンサイズにフィットさせる
                ),
              ),
            )
          ],
        ),
      ),
      // 右下のボタンを停止
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //disposeメソッドを使って_audioPlayer.dispose()を呼び出すことで、
  //AudioPlayerが使用しているリソースを解放し、他のプロセスやアプリケーションがそのリソースを利用できるようにします。
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
