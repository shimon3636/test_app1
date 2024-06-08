import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'page2.dart';
import 'page3.dart';

class MyHomePage extends StatefulWidget {
  static const path = '/page1';

  final String title = 'Bomber';

  const MyHomePage({super.key});

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
      await _audioPlayer.play(AssetSource(_sounds.first));
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
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
            ),
            TextButton(
              onPressed: () => GoRouter.of(context).push(Page2.path),
              child: const Text('Go to page2'),
            ),
            TextButton(
              onPressed: () => context.go(Page3.path),
              child: const Text('Go to page3'),
            ),
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
