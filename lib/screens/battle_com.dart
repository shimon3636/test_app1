import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BattleCom extends StatefulWidget {
  const BattleCom({super.key});
  static const path = '/battle_com';
  @override
  State<BattleCom> createState() => _BattleComState();
}

class _BattleComState extends State<BattleCom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COM対戦'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('対戦人数'),
          const NumberAdjuster(),
          const StrengthAdjuster(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () => GoRouter.of(context).pop(),
                child: const Text('スタート')),
          ),
          TextButton(
            onPressed: () => GoRouter.of(context).pop(),
            child: const Text('back'),
          ),
        ],
      ),
    );
  }
}

class NumberAdjuster extends StatefulWidget {
  const NumberAdjuster({super.key});

  @override
  State<NumberAdjuster> createState() => _NumberAdjuster();
}

class _NumberAdjuster extends State<NumberAdjuster> {
  int _currentNumber = 3;

  void _decrementNumber() {
    setState(() {
      if (_currentNumber > 3) {
        _currentNumber--;
      }
    });
  }

  void _incrementNumber() {
    setState(() {
      if (_currentNumber < 6) {
        _currentNumber++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: _decrementNumber,
            ),
            Text(
              '$_currentNumber',
              style: const TextStyle(fontSize: 24.0),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _incrementNumber,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_currentNumber, (index) {
            return Column(
              children: [
                const Icon(Icons.person, size: 48.0),
                Text(index == 0 ? 'me' : 'COM'),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class StrengthAdjuster extends StatefulWidget {
  const StrengthAdjuster({super.key});

  @override
  State<StrengthAdjuster> createState() => _StrengthAdjusterState();
}

class _StrengthAdjusterState extends State<StrengthAdjuster> {
  String _currentStrength = 'ふつう';

  void _decrementStrength() {
    setState(() {
      if (_currentStrength == 'ボンバー') {
        _currentStrength = 'つよい';
      } else if (_currentStrength == 'つよい') {
        _currentStrength = 'ふつう';
      } else if (_currentStrength == 'ふつう') {
        _currentStrength = 'よわい';
      }
    });
  }

  void _incrementStrength() {
    setState(() {
      if (_currentStrength == 'よわい') {
        _currentStrength = 'ふつう';
      } else if (_currentStrength == 'ふつう') {
        _currentStrength = 'つよい';
      } else if (_currentStrength == 'つよい') {
        _currentStrength = 'ボンバー';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('COM難易度'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: _decrementStrength,
            ),
            Text(
              _currentStrength,
              style: const TextStyle(fontSize: 24.0),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: _incrementStrength,
            ),
          ],
        ),
      ],
    );
  }
}
